---
layout: post
title: Check links with HTTP::Simple
date: 2021-02-11 15:41:31
---
This is the sequel of [Check links programmatically (with Perl)](https://dev.to/thibaultduponchelle/check-links-programmatically-with-perl-1a14)

This time, I use [HTTP::Simple](https://metacpan.org/pod/HTTP::Simple)
![Dancing](images/athmdxwr0z1c6dpihpse.gif)

# Rewrite with HTTP::Simple
I restarted from my previous simple code that was using `<>` (read file on command line or get input from `|`, split it by carriage return).

It's a loop, that get a link and prints "✓" or "✗" depending the status of the link.

`HTTP::Simple` provides almost the same API than `LWP::Simple` with slightly different behaviour and some extends.

So except the `use HTTP::Simple` and the usage of a surrounding `eval`, this is the same code.

(if something is unclear in the following code, check [previous blog post](https://dev.to/thibaultduponchelle/check-links-programmatically-with-perl-1a14)) 
```perl
#!/usr/bin/env perl

use open ':std', ':encoding(UTF-8)';
use Term::ANSIColor;
use HTTP::Simple;

$| = 1;

while(<>) {
    chomp;
    my $link = $_;
    print "Checking [$link]...";
    eval { get($link) };
    if($@) {
            print color('red') . " \x{2717}\n" . color('reset');
    } else {
            print color('green') . " \x{2713}\n" . color('reset');
    }
}
```

# Exceptions and status
Interesting enough, with `HTTP::Simple`, some functions are throwing exceptions. Read carefully the doc since some are throwing exceptions for **connections** and **HTTP** errors (like [get](https://metacpan.org/pod/HTTP::Simple#get)) when others only for **connections** errors (like [getprint](https://metacpan.org/pod/HTTP::Simple#getprint))

Actually with this `get` method I *can't* retrieve easily the status. I could have printed the exception, but it also gives the line number where the exception occured and it is not very pretty.

I can get the status from `getprint` or `getstore`. Since I don't need to print nor store anything, it's a bit overkill, but I can probably handle this :smiley:. So I tried to use `getstore($link, "/dev/null")` but it was not well accepted :grin:

My trick is then to use `getprint` and *trash* output using `select`. Here is the idea:
```perl
my $TRASH;
open($TRASH, '>', '/dev/null');

# Later in code
select $TRASH;
print "Trashed\n";
select STDOUT;
```

# Final code
Below are all the final code snippets.

The links are stored in a file, one per line:
```
http://cpantesters.org
https://img.shields.io/badge/Language-Perl-blue
https://www.perltutorial.org/
http://stratopan.com
https://www.perl.org/
```

Beside I have my `checklinks.pl`:
```perl
#!/usr/bin/env perl

use open ':std', ':encoding(UTF-8)';
use Term::ANSIColor;
use HTTP::Simple;

my $TRASH;
open($TRASH, '>', '/dev/null');

$| = 1;

while(<>) {
    chomp;
    my $link = $_;
    print "Checking [$link]...";

    select $TRASH;
    my $status = getprint($link);
    select STDOUT;
    if(! is_success($status)) {
            print color('red') . " \x{2717} --> $status\n" . color('reset');
    } else {
            print color('green') . " \x{2713}\n" . color('reset');
    }
}
```

Then I execute my link checker through a pipe:
```bash
$ cat links.txt | perl checklinks.pl
```

And I get my pretty links checker report:
![Check](images/objz3rf0r7p39nfp622i.png)

