---
layout: post
title: Browse CPAN modules per namespaces
date: 2021-02-22 14:07:34
---
![MetaCPAN board](/assets/images/cpan.png)

I once was looking to filter out CPAN modules per namespace. Namespaces generally have *meaning* in CPAN since there are conventions and Perl folks try to be rigourous and to [fit well in the existing naming](http://prepan.org)

So back again to my research, I was looking for a way to filter out CPAN modules per namespaces.

# Become the master of MetaCPAN search
From [METACPAN faq](https://metacpan.org/about/faq) you can get some tips like the **module:** prefix

![MetaCPAN tips](/assets/images/yv1570s030v3onxsl9h6.png)

With this trick, you can search for instance all [XML related modules](https://metacpan.org/search?p=7&q=module%3AXML)

It works well, but does not achieve exactly what I want since it returns me also for instance the **SVG::XML** which is not actually prefixed by **XML::**
![Problem](/assets/images/696xvyzky4j2edsvdnsr.png)

# CPANMeta the great
By asking on the good old IRC, I get a solution thanks to [CPANMeta](https://cpanmeta.grinnz.com)

You can then list all [XML::* modules](https://cpanmeta.grinnz.com/packages?module=XML%3A%3A&match_mode=prefix) 
![CPANMeta](/assets/images/mahc6obx5924sd6fw7jy.png)

# Manual grep
The quick and dirty hack!

I downloaded the `02packages.details.txt` file from [CPAN.org](https://www.cpan.org/modules/02packages.details.txt)

Then using a grep
```bash
grep "^XML::" 02packages.details.txt
```

And the output is a long list of modules:
```bash
XML::XSS                         v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Comment                v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Document               v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Element                v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::ProcessingInstruction  v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Role::Renderer         v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Role::StyleAttribute   v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::StyleAttribute         v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Stylesheet::HTML2TD    v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Template               v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XSS::Text                   v0.3.5  Y/YA/YANICK/XML-XSS-0.3.5.tar.gz
XML::XUpdate::LibXML           0.006000  P/PA/PAJAS/XML-XUpdate-LibXML-0.6.0.tar.gz
XML::YYLex                         0.04  B/BO/BOEWE/XML-YYLex-0.04.tar.gz
```

# More experiments
I tried also to use [CPAN::02Packages::Search](https://metacpan.org/pod/CPAN::02Packages::Search) but it seems to only allow exact match.

Look at this working code
```perl
#!/usr/bin/env perl

use CPAN::02Packages::Search;
use Data::Dumper;
 
my $index = CPAN::02Packages::Search->new(file => './02packages.details.txt');
my $res = $index->search('Plack'); 

print Dumper($res);
```

I tried to tweak it with ` $index->search('XML::*');` or `$index->search('XML::.*');` but it is not valid :confused:

[CPAN::Common::Index::Mirror](https://metacpan.org/pod/CPAN::Common::Index#search_packages-(ABSTRACT)) is promising to do the job according to the documentation
![Index](/assets/images/7ck8wq5gg14cm5ig3eyj.png)

But I was not able to make it work *at first* :smiley:

I started with this code snippet
```perl
#!/usr/bin/env perl

use CPAN::Common::Index::Mux::Ordered;
use Data::Dumper;
 
my $index = CPAN::Common::Index::Mux::Ordered->assemble(
    MetaDB => {},
    Mirror => { mirror => "http://cpan.cpantesters.org" },
);
 
my $result = $index->search_packages( { package => 'XML::LibXML' } );
 
print Dumper($result);
```

And tried various `XML::*` and `XML::.*` and `/^XML::.*/` and `m/^XML::.*/` and the same with `-` instead of `::` but no way :grimacing:

Thanks to @Grinnz, I get it!
```perl
#!/usr/bin/env perl

use CPAN::Common::Index::Mux::Ordered;
use Data::Dumper;

my $index = CPAN::Common::Index::Mux::Ordered->assemble(
    MetaDB => {},
    Mirror => { mirror => "http://cpan.cpantesters.org" },
);

my @result = $index->search_packages( { package => qr/^XML::/ });

print Dumper(@result);
```
That will returns several packages:
```perl
$VAR2326 = {
             'version' => 'undef',
             'package' => 'XML::XSH::Parser',
             'uri' => 'cpan:///distfile/CHOROBA/XML-XSH-1.8.6.tar.gz'
           };
$VAR2327 = {
             'version' => '0.48',
             'package' => 'XML::XSLT',
             'uri' => 'cpan:///distfile/JSTOWE/XML-XSLT-0.48.tar.gz'
           };
$VAR2328 = {
             'package' => 'XML::XSLT::DOM::TextDOE',
             'version' => '0.31',
             'uri' => 'cpan:///distfile/MAHEX/XML-XSLT-0.31.tar.gz'
           };
```

I see there are also some other possible alternatives like [App::CPANIDX](https://metacpan.org/pod/App::CPANIDX) or maybe [CPANDB](https://metacpan.org/pod/distribution/CPANDB/lib/CPANDB/Module.pod)?

# MetaCPAN native treeview
I wonder if it should not simply be part of MetaCPAN. I other words a **native tree view in MetaCPAN** :dancer:

Maybe I'm missing a point, but a feature like this would make me happy for a while.

What about something like 
![CPAN treeview](/assets/images/w8zn3qriemgtm2rf84ip.png)

What do you think?
