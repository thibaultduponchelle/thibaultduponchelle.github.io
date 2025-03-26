---
layout: post
title: My unrealistic wish-list for Perl 7.x
date: 2021-04-21 09:28:14
---
Notice the **unrealistic** in the title... I did not bothered to check if it was realistic or not :grinning: but just wrote my wish-list.

Here is my list:
1. [Unicode and UTF-8 by default](#Unicode)
2. [Indexing strings](#Index)
3. [Native Object Oriented system](#Cor)
4. [Signatures](#Signatures)
5. [A config-free CPAN client in the core](#CPANCli)
6. [Images in POD](#Images)
7. [Smart Match](#Smart)
8. [A much better REPL](#REPL)
9. [And more...](#More)

# Unicode and UTF-8 by default <a name="Unicode"/>
Today when using UTF-8 in Perl, you often have to explicitly declare it. For example like the following:
```perl
use open ':std', ':encoding(UTF-8)';
print "\x{2717}\n";
```
(or you will see a `Wide character in print at test.pl line 6.`)

On the other hand, if you give the glyph instead the code point, it is working fine, like the following:
```bash
$ perl -e 'print "André\n"'
André
```
(My editor and terminal are UTF-8)

But more strange if you add `use utf8` it starts to do bad things:
```bash
$ perl -e 'use utf8; print "André\n"'
Andr�
```
But adding the `use open` will give you back the correct output:
```bash
perl -e 'use utf8; use open ":std", ":encoding(UTF-8)"; print "André\n"'
André
```

The topic of Unicode and UTF-8 is over complicated and I'm not an expert, but I can say that it's not transparent in Perl 5 and I can give you the link of this [blog post](https://dev.to/fgasper/perl-unicode-and-bytes-5cg7) :grinning:

Python **2** had also problems with UTF-8 and required to add a magic comment like this:
```python
# -*- coding: utf-8 -*-

print "André"
```
Or using "unicode strings" if you wanted to give the code point:
```python
# -*- coding: utf-8 -*-

print u"\u2717";
```

Python **2** was especially annoying since an UTF-8 character in the source file would lead to an error `Non-ASCII character '\xc3'`, even in a comment (!):
```python
# s = "André"
# BOOM!
```

But it was improved a lot in Python 3.

The strings are internally represented as Unicode and the default encoding of file is UTF-8:
```bash
$ python3 -c 'print("\u2717")'
✗
```
Or 
```bash
$ python3 -c 'print("André")'
André
```

The magic encoding then becomes generally useless except if the encoding is not UTF-8:
```python
# -*- coding: iso-8859-15 -*-
s = "ISO André" # This is not UTF-8
print(s)
```
If you forget the magic encoding comment, you will get a the terrible error:
```
SyntaxError: Non-UTF-8 code starting with '\xe9' in file test6.py on line 1, but no encoding declared; see http://python.org/dev/peps/pep-0263/ for details
```
# Indexing strings <a name="Index"/>
While we can access items of an array (declared `@array`) with index `$array[1]` or slice `@array[1,2]` we can't apply the same kind of index on simple scalars holding strings.

What I would like to do is:
```perl
my $str = "bazinga";
print $str[1];
```
Or slicing (substring):
```perl
my $str = "bazinga";
print $str[1,2];
```
Both are achievable with `substr`:
```perl
my $str = "bazinga";
print substr($str, 1, 1);
```
Or by converting before the string into array with `split`:
```perl
my $str = "bazinga"; 
my @array = split("", $str); 
print @array[1,2]
```
But it is extra gymnastic that I would like to avoid if it was possible :smiley:

I could even imagine mixing indexing on scalar and array slices:
```perl
my @array = ("foo", "bar", "baz"); 
print $array[1]; # "bar"
print $array[1][1] # "a"
```

This feature is maybe impossible to implement (is there some cases where syntax will conflict? short answer is YES, see below), but do I mentioned that this wish-list was unrealistic?
![Crazy](/assets/images/29y4ckmvzajdwzjne3xv.jpg)

EDIT : As pointed by "quote-only-eeee" on reddit, it is definitely conflicting since both `$a` and `@a` could live together in a Perl program and `$a[0]` would not be able to choose on which one to apply.

# Native Object Oriented system <a name="Cor"/>
For those who don't know, there is the initiative [Cor(inna)](https://github.com/Ovid/Cor/wiki) and I'm firmly waiting for it.

Go for the native Object Oriented capabilities of Perl!
![Go for it](/assets/images/68b2fr6jae0o3qjznj5w.jpg)
 
# Signatures <a name="Signatures"/>
We discussed a lot already ([here](https://dev.to/thibaultduponchelle/perl-in-2025-fosdem-video-review-1k70) and @mjgardner wrote great posts about it [here](https://dev.to/mjgardner/better-perl-with-subroutine-signatures-and-type-validation-2bck) and [here](https://dev.to/mjgardner/de-experimentalizing-perl-subroutine-signatures-4k0l))

It is the first thing to come, and I'm very happy to have it.

# A config-free CPAN client in the core <a name="CPANCli"/>
We have a CPAN client in the core but it is not *deadly* simple.

```
$ cpan Acme::LSD

CPAN.pm requires configuration, but most of it can be done automatically.
If you answer 'no' below, you will enter an interactive dialog for each
configuration option instead.

Would you like to configure as much as possible automatically? [yes] ^C
```

Maybe we could integrate [cpanm](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm) or [cpm](https://github.com/skaji/cpm) in the core?

If you wonder, python `pip` is config-free and is in the core (since 3.4)

# Images in POD <a name="Images"/>
It's really missing.

You can emulate with HTML in POD:
![Image in POD](/assets/images/sn59pyrjcm7e5etmmtww.png)
But it's not very handy.

Having it directly in the POD format would be great and there was an early attempt to add it (see this [issue](https://github.com/Perl/perl5/issues/18169)).

# Smart match <a name="Smart"/>
This is a long-story subject, I know from lectures that it is "hard as hell" to implement feature (in particular has DWIM issues), but I would like it, one day, maybe, if possible, pleeaaaaase...
![Please](/assets/images/ybl4i0t67fikby9uw2wp.jpg)

# A much better REPL <a name="REPL"/>
The python REPL is far far ahead everything you can have in Perl (but on the other hand, Perl oneliner capacity is far ahead).

My typical workflow for trying ideas in Perl is to write a file then execute it (or alternatively `perl -e`) while my typical workflow for trying ideas in Python is to type `python3` and go with the REPL.

I have seen a talk from **RJBS** that made extensive and impressive use of Perl debugger, but I'm not doing the same :grinning:

When a pure pythonista at work made his first contribution to a Perl script, his first remark was "Where is the REPL, I typed `perl` then my commands but nothing happens". 

# And more... <a name="More"/>
I could have added **better threads** and **nativecall** (see [nativecall](https://docs.raku.org/language/nativecall) and Perl [port](https://metacpan.org/pod/NativeCall)) to the list but it was already too unrealistic :smiley:

I also like ideas (isa, sharpy equalities, multi sub...) presented by **Paul Evans** in his FOSDEM talk that I reviewed [here](https://dev.to/thibaultduponchelle/perl-in-2025-fosdem-video-review-1k70)