---
layout: post
title: Check links programmatically (with Perl)
date: 2021-02-08 12:02:27
---
Links are moving too fast... And your online README.md, links directories, blog posts or whatever... rapidly give links to dead resources :cry:

Like in my [awesome-like Perl README.md :rocket:](https://github.com/thibaultduponchelle/perlres) that contains hundreds of links (go check it out, it is cool ! :sunglasses:).

My solution is to check periodically that the links are *still* up ! 
 
# Basic version
For this very first version, I will take links from a file or a `|` (pipe). And I will use `LWP::Simple`.

```perl
#!/usr/bin/env perl

use LWP::Simple;
$| = 1; # Ignore this

while(<>) {
    chomp; # Remove carriage return
    my $link = $_;
    print "Checking [$link]...";
    my $content = get($link);
    if(! defined $content) {
        print " BROKEN !\n";
    } else {
        print " OK\n";
    }
}
```

That I use with a list of links in a `links.txt` file for instance:

```
http://cpantesters.org
https://img.shields.io/badge/Language-Perl-blue
https://www.perltutorial.org/
http://cpancover.com
```

And I run it like this:
```bash
$ cat links.txt | perl checklinks.pl
# OR
$ perl checklinks.pl links.txt
```
This is the magic of `<>` !

![Magic](images/4lmhzxqrzwilk1gtlkxt.gif)

It produces an output like the following:
```
Checking [http://cpantesters.org]... OK
Checking [https://img.shields.io/badge/Language-Perl-blue]... BROKEN !
Checking [https://www.perltutorial.org/]... OK
Checking [http://cpancover.com]... BROKEN !
```

What ? We have some broken links ?

But the [shields.io badge](https://img.shields.io/badge/Language-Perl-blue) and [cpancover.com](http://cpancover.com) are actually not down...

![What The Hell](images/9j46j3ro09mvy2olev6n.gif)

And since we are using `LWP::Simple` that clearly states that ```
"If you need more control or access to the header fields in
the requests sent and responses received, then you should use
the full object-oriented interface provided by the
LWP::UserAgent module."
```

Then... Go for [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent) !

# LWP::UserAgent
Then, here is my new version based on `LWP::UserAgent`:
```perl
#!/usr/bin/env perl

use LWP::UserAgent ();
my $ua = LWP::UserAgent->new(timeout => 10);
$| = 1;

while(<>) {
    chomp;
    my $link = $_;
    print "Checking [$link]...";
    my $res = $ua->get($link);
    if(! $res->is_success) {
        print " BROKEN !\n";
    } else {
        print " OK\n";
    }
}
```

I then run it like this :
```bash
echo "https://img.shields.io/badge/Language-Perl-blue" | perl checklinks.pl
```

The [shields.io badge](https://img.shields.io/badge/Language-Perl-blue) is still up for humans but broken for LWP :unamused::
```
Checking [https://img.shields.io/badge/Language-Perl-blue]... BROKEN !
```

I need to see the status code...

# 403 forbidden !
To know what is the status code, I can print `$res->status_line`:
```perl
print " BROKEN ! --> " . $res->status_line . "\n"
```

And the conclusion is terrible :grinning::
```bash
BROKEN ! --> 403 Forbidden
```

The **403 Forbidden** is something like the server is working well but refused to serve us because it detected something that he does not like. 

Maybe like an empty user agent ? :innocent:

Adding `$ua->agent('Mozilla/5.0');` like in the [LWP::UserAgent CPAN doc](https://metacpan.org/pod/LWP::UserAgent#agent) effectively fixed the problem:

```
Checking [https://img.shields.io/badge/Language-Perl-blue]... OK
```

We fixed one problem, but we still have some others.

# 406 Not Acceptable
The [Perl Tutorial](https://www.perltutorial.org/) website was OK with the `LWP::Simple` version but is now BROKEN with a strange status:
```
Checking [https://www.perltutorial.org/]... BROKEN ! --> 406 Not Acceptable
```

"Not Acceptable" is supposed to be a problem with what the client accepts ("Accept" headers) and what the server can give.

In my firefox browser I have this:
![Accept](images/meg65bovt9fd9a8ocwk0.png)

I can try to emulate and change them with `push_header` like this:
```perl
$ua->default_headers->push_header('Accept' => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
$ua->default_headers->push_header('Accept-Encoding' => "gzip, deflate, br");
$ua->default_headers->push_header('Accept-Language' => "en-US,en;q=0.5");
```

But here it is not the problem, the problem is that I use a bad agent name ("Mozilla/5.0", the one taken *as is* from LWP::UserAgent doc).

My feeling is that "Mozilla/5.0" is not an empty agent name but is probably too old and looks like too much "a bot with a name" :grinning:

This change, fixes the problem:
```perl
$ua->agent('Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/82.0');
```

# 500 Can't connect to ... (certificate verify failed)
One more problem is related to certificat verification.

If you visit [builtinperl.com](http://builtinperl.com) you will get the usual certificat warning: 

![Warning](images/s4zrdjma6xtenkx6snui.png)

We can force the visit when using Firefox, but when using my script:
```
$ echo "http://builtinperl.com"  | perl checklinks.pl
```

It hardly fails:
```
Checking [http://builtinperl.com]... BROKEN ! --> 500 Can't connect to builtinperl.com:443 (certificate verify failed)
```

But once again, you can tweak `LWP::UserAgent` to fix this:
```perl
use IO::Socket::SSL qw( SSL_VERIFY_NONE );
$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

# And later
# ...
$ua->ssl_opts(SSL_verify_mode => SSL_VERIFY_NONE);
```

`verify_mode => 0` was supposed to do the same than `$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;` but was not working, if someone knows the why... Please comment :grin:

# 500 read timeout
Shit happens, even for best of us ([CPANTesters](http://cpantesters.org))

You can increase the timeout.

# 405 Method Not Allowed
I usually use HEAD method since I don't care about the content but only the page status. But some links (e.g. CGI) won't answer HEAD requests!

For instance [qntm.org](https://qntm.org) answers "405 Method Not Allowed" for HEAD requests, and it's annoying:
```
$ curl --head https://qntm.org/files/perl/perl.html
HTTP/1.1 405 Method Not Allowed
Date: Mon, 08 Feb 2021 09:27:56 GMT
Server: Apache/2.4.38 (Debian)
Vary: User-Agent
Content-Type: text/html; charset=UTF-8
```

# Pimp my output
![Salt](images/b97oa045x52hnhcr6w9w.png)

I just added some salt to my script to make it nicer.

Unicode characters:
```perl
use open ':std', ':encoding(UTF-8)';
```
See [this StackOverflow thread](https://stackoverflow.com/questions/15210532/use-of-use-utf8-gives-me-wide-character-in-print) to know why this line.

And colors in terminal:
```perl
use Term::ANSIColor; 
```

And later:
```perl
print color('red') . " \x{2717}" . color('reset') . " --> " . $res->status_line . "\n";
```

It does not change much the output but make it clearer and nicer :smiley:

![Pimp](images/kliu4pdrp1bpd26ywemh.png)

# Conclusion
There is more to say here :smiley: 

Like mentioning that [Mojolicious](https://docs.mojolicious.org/Mojo/UserAgent) provides a very good framework for doing the same kind of tasks (it could be perceived as a "more modern" approach).

And also to try to be kind if possible with websites (using HEAD verb, announce yourself as a bot when possible, do not crawl too often...).

EDIT1: This blog post has a sequel, see [Check markdown links with github action](https://dev.to/thibaultduponchelle/check-markdown-links-with-github-action-3c2m)

EDIT2: This blog has another sequel, see [Check links with HTTP::Simple ](https://dev.to/thibaultduponchelle/check-links-with-http-simple-perl-3bhh)

