---
layout: post
title: Grab a distribution tarball from CPAN
date: 2021-05-18 14:40:45
---
This is another "CPAN utils" post (sort of) but this time around resolving and fetching tarballs :smiley:

1. [cpan -g](#cpan)
2. [sourcepan](#sourcepan)
3. [cpan-get](#cpan-get)
4. [MetaCPAN::Client + HTTP::Simple](#mcpan-httpsimple)

## cpan -g <a name="cpan"/>
First let's start by using the *venerable* [CPAN](https://metacpan.org/pod/CPAN):
```
$ cpan -g Parser::MGC 
Checking Parser::MGC
Reading '/home/tduponchelle/.local/share/.cpan/Metadata'
  Database was generated on Sat, 15 May 2021 16:41:03 GMT
CPAN: LWP::UserAgent loaded ok (v6.53)
Fetching with LWP:
http://www.cpan.org/authors/01mailrc.txt.gz
CPAN: YAML loaded ok (v1.30)
Reading '/home/tduponchelle/.local/share/.cpan/sources/authors/01mailrc.txt.gz'
CPAN: Compress::Zlib loaded ok (v2.102)
............................................................................DONE
Fetching with LWP:
http://www.cpan.org/modules/02packages.details.txt.gz
Reading '/home/tduponchelle/.local/share/.cpan/sources/modules/02packages.details.txt.gz'
  Database was generated on Tue, 18 May 2021 12:29:03 GMT
............................................................................DONE
Debug(CPAN,CPAN.pm,703,[Index,Index.pm,483,all_objects]): mgr[CPAN=HASH(0x563dc712a9e8)] class[CPAN::Module]
Debug(CPAN,CPAN.pm,703,[Index,Index.pm,483,all_objects]): mgr[CPAN=HASH(0x563dc712a9e8)] class[CPAN::Bundle]
Debug(CPAN,CPAN.pm,703,[Index,Index.pm,483,all_objects]): mgr[CPAN=HASH(0x563dc712a9e8)] class[CPAN::Distribution]
Fetching with LWP:
http://www.cpan.org/modules/03modlist.data.gz
Reading '/home/tduponchelle/.local/share/.cpan/sources/modules/03modlist.data.gz'
DONE
Writing /home/tduponchelle/.local/share/.cpan/Metadata
Use of uninitialized value in concatenation (.) or string at /usr/share/perl/5.26/App/Cpan.pm line 1186.
Downloaded [Parser::MGC] to []
```

## sourcepan <a name="sourcepan"/>
Then look at the more *developer oriented* [sourcepan](https://metacpan.org/pod/sourcepan):
```
$ sourcepan Acme::LSD
Reading '/home/tduponchelle/.local/share/.cpan/Metadata'
  Database was generated on Tue, 18 May 2021 12:29:03 GMT
CONTRA/Acme-LSD-0.04.tar.gz => Acme-LSD-0.04.tar.gz
```
`sourcepan --git` could even init for you a repository...

## cpan-get <a name="cpan-get"/>
Continue with the *newborn* [cpan-get](https://metacpan.org/release/App-CPAN-Get):
```
$ cpan-get Test::More
'http://cpan.metacpan.org/authors/id/E/EX/EXODIST/Test-Simple-1.302183.tar.gz' was downloaded.
```

## MetaCPAN::Client + HTTP::Simple <a name="mcpan-httpsimple"/>
And finish by a mixed [MetaCPAN API client](https://metacpan.org/pod/MetaCPAN::Client) + an [HTTP client](https://metacpan.org/pod/HTTP::Simple) (with no error handling at all):
```perl
# Init MetaCPAN client
use MetaCPAN::Client;
my $mcpan = MetaCPAN::Client->new();

# Resolve url
my $download_url = $mcpan->download_url('ExtUtils::MakeMaker');

# Download
use HTTP::Simple;
getstore($download_url->{data}->{download_url}, "EUMM.tgz");
```
(Should be possible fetch with MetaCPAN::Client, if you know how, please comment)
