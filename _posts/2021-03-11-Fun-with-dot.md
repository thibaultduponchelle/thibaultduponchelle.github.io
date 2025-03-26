---
layout: post
title: Fun with dot
date: 2021-03-11 09:40:33
---
I don't know how to introduce this post :smiley: I will just play with you using various usage of `.` in Perl but not only (see second part).

## Table Of Contents
1. [Fun with dot in Perl](#with-perl)
2. [Fun with dot in everything but Perl](#without-perl)

## Fun with dot in Perl <a name="with-perl"></a>
### Concat strings with .
In Perl like in a lot of other languages, you can concat strings with `.`
```perl
print "Fun" . " with " . "." . "\n";
```

But you can also concat *without quotes* which is less usual:
```perl
print Dota.All.Star;
```
It's less flexible and if you want my opinion I don't recommend to use this form.

### Match a lot with .
`.` normally matches almost any character (including a dot itself).
You can even extend what is matched by `.` using [`/s`](https://perldoc.perl.org/perlre#s) modifier.

```perl
while(<>) {
    $_ =~ s/(...)./$1/g;
    print $_;
}
```
That will match 4 characters and keep only 3 and repeat:
```bash
$ echo "foo bar baz" | perl keep3.pl
foobarbaz
```

You can make your dot match more ("greedy dot"):
```perl
while(<>) {
    $_ =~ s/(.*) foo/$1/g;
    print $_;
}
```
That will match as much as possible:
```bash
$ echo "foo foo foo" | perl greedy.pl
foo foo
```

But you can also make the contrary ("non greedy dot"):
```perl
while(<>) {
    $_ =~ s/(.*?) foo/$1/g;
    print $_;
}
```
That will match the minimum possible valid match:
```bash
$ echo "foo foo foo" | perl nongreedy.pl 
foo
```

### v-strings
Another use of dot can be the [version strings](https://perldoc.perl.org/perldata#Version-Strings) (or "v-strings"):
```perl
$ perl -e 'print v74.65.80.72'
JAPH
```

Or even mixing vstring with "non quote" trick:
```perl
$ perl -e 'print etc.v46.46.46'
etc...
```

If you read "version" in version strings and you are interested in creating and comparing versions in Perl please read this [great blog post about versions](https://dev.to/grinnz/a-guide-to-versions-in-perl-3ng1).

### Terminates format
The format is an old and powerful (but less and less commonly used) feature of Perl. It is used to do formatting as the name suggests :smiley:
```perl
format STDOUT =
@<<  @||||||   @>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Fun",   "with",   "dot !"
.
write;
```
The output is:
```bash
$ perl format.pl 
Fun   with                                  dot !
```

### The range operator
A great Perl feature is the [range operator](https://perldoc.perl.org/perlop#Range-Operators) `..` or `...`:
```perl
my @r = aa...bb;
print join " ", @r;
```
(Here `...` is equivalent to `..`)

That produces:
```
aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb
```

I wanted to find a `python` equivalent to show, but it seems [not straighforward at all](https://stackoverflow.com/questions/3264271/what-is-the-python-equivalent-to-perl-a-azc) (not an operator or even a one line thing). Seems like [range](https://docs.python.org/fr/3/library/stdtypes.html#range) is for integers only, and something naive like:
```python 
import itertools

for it in itertools.product('abcdefghijklmnopqrstuvwxyz', repeat=2):
    print it
```
Is not producing the right thing, because I don't want the first character to vary outside "a" and "b"...

If you have a simple equivalent, feel free to comment! 

Now, a much more *strange* range:
```perl
#!/usr/bin/env perl
use strict;
use warnings;

while(<>) {
    if(/>>>/../<<</) {
        if(!/^>>>$/ and !/^<<<$/) {
            chomp; print;
        }
    }
}
```

To apply on this file:
```
Ignore me
>>>
Kawa
<<<
Ignore
me
>>>
bunga
<<<

>>>
!
<<<
```

Execute with:
```bash
$ cat file.txt | perl sections.pl 
Kawabunga!
```

### The ellipsis
The [ellipsis](https://perldoc.perl.org/perlsyn#The-Ellipsis-Statement) or "yada-yada" or "triple-dot" is a way to mark a place as **unimplemented**. 

```perl
$ perl -e '... if 1;'
Unimplemented at -e line 1.
```
It is resolved at runtime so will only throw the **Unimplemented** if the code actually reach the ellipsis.

### Unsafe dot
Starting Perl **5.26.0**, the current directory (`.`) was removed from default INC. You can still add them with `-I.` or `use lib "."` or compile the interpreter with `PERL_USE_UNSAFE_INC=1`

## Fun with dot in all but Perl <a name="without-perl"></a>
### Calling methods
The dot is used to call methods in several languages (e.g. `python` or `ruby`).

### Un point c'est tout
For a very long time, when you asked "how to concat 2 string in PHP?" on [google.fr](https://www.google.fr/), the first answer was a forum where a guy answered *tersely* "un point c'est tout" (meaning "a dot and that's all!" or "this is like this!"). 
```php
<?php 
$a = "hello" . "world";
print $a;
?>
```
Since it is also a french expression, it has a double sense and was not well understood by newbies despite being completely correct :smiley:

### The dotfiles
Dotfiles are user config in files starting with dot (e.g. `.vimrc`). People sometimes put them and share them in git.

### Nasty dot
On GNU/Linux, if you want to be a ~~hacker~~ script kiddie like **Kim DotCom** you can "hide" files by naming them `. ` or `...`.
```
touch ". " ...
```
As they start with dot, an usual `ls` won't print them.

Of course if you really want to hide a file, you need a more robust method.

### Safe Navigation operator
For instance in groovy `.?`

See [Safe Navigation operator](https://en.wikipedia.org/wiki/Safe_navigation_operator)

### Dota
Completely off topic but it starts with "dot" and I played it when I was younger :grinning:
![Dota](/assets/images/kx94kxovzo5b9uexy9xn.jpg)

What is the sense of this post after all? I don't know...

### Git 
Git also propose `..` and `...` for commit ranges. e.g.
`git diff abc..def` or `git diff abc...def` the secong is more strict (introduce ordering).

There is the kind of thing (with different meaning) for `git log`.

### C structs
Access C struct elements with `.`:
```C
/* Declare the struct with integer members x, y */
struct point {
   int    x;
   int    y;
};
/* Define a variable p of type point, and set members using designated initializers*/
struct point p;
p.x = 0;
p.y = 0;
```

Or the less common set with **designated variables**:
```C
/* Declare the struct with integer members x, y */
struct point {
   int    x;
   int    y;
};
/* Define a variable p of type point, and set members using designated initializers*/
struct point p = { .y = 2, .x = 1 };
```

### The final dot in url
Do you know that [example.com](http://example.com/) can also be written [example.com.](http://example.com/) ?

The same way we can access my "Fun with perl shebang" article using [perl.com.](https://www.perl.com./article/bang-bang/)

But I read that [it is not equivalent](https://url.spec.whatwg.org/#concept-domain).

I don't know much about this, if you have details, please comment!

### The more expensive dot of history?
One of my teacher told me one day about the rocket explosion caused by a bug where a dot was used instead a comma.

He was referencing the FORTRAN punctuation error occured on Mariner 1 in 1962. It's seems to be an urban legend, but still interesting to mention right?

### The printf of Brainfuck
Do you know Brainfuck? If you don't, you should maybe not try to :grinning: for you mental sanity

The dot is the printf in Brainfuck (`putchar(*ptr);​`)

### Execute and source
Execution with `./a.out` and source with `. config.sh` (or `source ./config.sh`)

## Conclusion
This post was not published on **slashdot** but on **dev.to** that is a blog platform not running **dotclear**.

The majority of samples are written in **Perl 5.32**, don't expect them to run in **dotnet**.

Sorry for this conclusion... :speak_no_evil: :dizzy_face:

Do you have more `.` usages  in Perl or other fields? Or more IT related puns with the word "dot"? :grinning: