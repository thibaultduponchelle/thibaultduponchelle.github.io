---
layout: post
title: Japhs Autopsies (1)
date: 2020-12-03 10:39:09
---

This is the first post of a serie about [Japhs](https://en.wikipedia.org/wiki/Just_another_Perl_hacker)

Japhs are crazy-cursed-science, people sometimes love them as much as they hate them :smiley: 

![Crazy Japh](/assets/images/nzklo0g6g51s1b93a34p.jpg)

Japhs could be a showcase of obfuscated, bad practices, non modern Perl code but it is also often a demonstration of Perl skills and a way to nicely highlight some features or simply demonstrate code agility.

Several Japhs were written by "Perl Grand Masters".

## DO-NOT-DO
Often a Japh is more a matter of **obfuscation** than **encryption**.

This is the case of this **Japh** from **Randal Schwartz**, where a simple `print"Just another Perl hacker,"` is surrounded by "garbage code".

```perl
$_='987;s/^(d+)/$1-1/e;$1?eval:print"Just another Perl hacker,"';eval;
```

This Japh is actually full of nothing :smiley: 

Once unfold, the code is actually very simple but there is some interesting bits here :
- Some fun with `/e` modifier (= evaluate right hand side `RHS`)
- A misleading `(d+)` capture (vicious typo : missing `\` ! :smile:) that leads to a `$1` actually undefined
- Some fun with eval (the Japh *killer-feature* :smiley:)

```perl
eval {
        my $v = "987"; # or my $v = 987; it is the same
        # Substitute number by himself minus one
        $v =~ s/^(d+)/$1-1/e; # /e enable right hand side as an expression
        # $v is (still) "987";
        # $1 is undefined 
        # because to work
        # capture (d+) should be (\d+)
        if(undef) {
                eval;
        } else {
                print"Just another Perl hacker,";
        }
}
```

I really love this Japh !!

## Jump-Jump
```perl
$_="krJhruaesrltre c a cnP,ohet";$_.=$1,print$2while s/(..)(.)//;
```

The trick here is to loop over a string and take one char every 3 chars (but only one time per loop).

Having all keywords sticked together like this :
```perl
$_.=$1,print$2while
```
is a way to exploit the greatness of the parser ! :sunglasses:

When I first saw this Japh, I was not sure to understand well `s/(..)(.)//` 
because it seemed the string matched was substitued by nothing.

But is is actually kept by `$_.=$1`.

It is the same than this code : 

```perl
my $str ="krJhruaesrltre c a cnP,ohet";

do { 
	$str .= $1; # Keep 2 char (..)
	print $2; # Print one char (.)
} while($str =~ s/(..)(.)//);
```

What if we print the `$str` to see the content ?

```
krJhruaesrltre c a cnP,ohet
hruaesrltre c a cnP,ohetkr
aesrltre c a cnP,ohetkrhr
rltre c a cnP,ohetkrhrae
re c a cnP,ohetkrhraerl
c a cnP,ohetkrhraerlre
 cnP,ohetkrhraerlrec 
P,ohetkrhraerlrec  c
hetkrhraerlrec  cP,
krhraerlrec  cP,he
raerlrec  cP,hekr
rlrec  cP,hekrra
ec  cP,hekrrarl
 cP,hekrrarlec
,hekrrarlec c
krrarlec c,h
arlec c,hkr
ec c,hkrar
c,hkrarec
krarecc,
recc,kr
c,krre
rrec,
c,rr
rc,
rc
```

And if you look closer, you can see the `Just another Perl hacker,` hidden like a sort of [steganography](https://en.wikipedia.org/wiki/Steganography):

```
kr[J]hruaesrltre c a cnP,ohet
hr[u]aesrltre c a cnP,ohetkr
ae[s]rltre c a cnP,ohetkrhr
rl[t]re c a cnP,ohetkrhrae
re[ ]c a cnP,ohetkrhraerl
c [a] cnP,ohetkrhraerlre
 c[n]P,ohetkrhraerlrec 
P,[o]hetkrhraerlrec  c
he[t]krhraerlrec  cP,
kr[h]raerlrec  cP,he
ra[e]rlrec  cP,hekr
rl[r]ec  cP,hekrra
ec[ ] cP,hekrrarl
 c[P],hekrrarlec
,h[e]krrarlec c
kr[r]arlec c,h
ar[l]ec c,hkr
ec[ ]c,hkrar
c,[h]krarec
kr[a]recc,
re[c]c,kr
c,[k]rre
rr[e]c,
c,[r]r
rc[,]
rc
```

The "substitution per nothing" and the "only one time per loop" tricks are confusing for me.

In my mind, I would have prefered something like this : 

```perl
my $str ="krJhruaesrltre c a cnP,ohet";

do {
        print $2; # Print one char
} while($str =~ s/(..)(.)(.*)/$3$1/);
```

But one of the goal of a Japh is to confuse the reader, isn't it ?

And this goal is well achieved by this really nice Japh !

## Eval-ception

This Japh from **Raymond Chen** is playing with `eval` and `\` (protected quotes by antislash).

All the annoying `\`, `"` and `x` makes this line very *blurry* to the reader.

```perl
$_='x"Not ";"x\"another \";\'x\\"perl \\";x\\"hacker,\\"\'"';s/x/print/g;eval eval eval;
```

It is actually relatively simple when we break down into steps to see what happens exactly :

```perl
use v5.10;

$str = 'x"Not ";"x\"another \";\'x\\"perl \\";x\\"hacker,\\"\'"';
$str =~ s/x/print/g;
# 'print"Not "; "print\"another \";\'print\\"perl \\";print\\"hacker,\\"\'"';
say eval $str;
# Not print"another ";'print"perl ";print"hacker,"'
say eval eval $str;
# Not another print"perl ";print"hacker,"
eval eval eval $str;
# Not another perl hacker,
```

First eval will print `Not` and remove `"` around the rest of the line :
```perl
print"Not ";"print\"another \";'print\"perl \";print\"hacker,\"'"
            ^                                                   ^
``` 

Second eval will print `another` and remove `'` around the rest of the line :
```perl
Not print"another ";'print"perl ";print"hacker,"'
                    ^                           ^
```

Third eval will print `perl hacker,` :
```perl
Not another print"perl ";print"hacker,"
```

And finally this is `Not another perl hacker` ! :smiley:

## The Char-taker

This is a Japh from [gnebbia](https://github.com/gnebbia/japh)

```perl
use Modern::Perl;

say chr($_) foreach qw/ 
74	117 
115		116 
20 			97 
110				111
116				104
101				114
20			80
101		114
108	20
72
97
99
107
101
114/;
```

Simple and effective !

Not very hard to understand, but it uses some nice features from perl.

The `qw` actually drops some formatting for us and builds a clean `array of string`.

Then the indentation and spaces are ignored and `chr` will tranform ASCII codes into a Japh :smiley:


```perl
use Modern::Perl;

#              J   u   s   t      a  n   o   t   h   e   r      P  e   r   l      h  a  c  k   e   r
foreach my $d (74,117,115,116,20,97,110,111,116,104,101,114,20,80,101,114,108,20,72,97,99,107,101,114) {
        print chr($d);
}
```

This Japh does not really confuse the reader, but force to dig a bit into language understanding, and that's very cool ! :sunglasses:

## Split-Sort-Grep
**Randal Schwartz**, in addition of being **Japh #0** is one of the master of the Japh competition.

He plays often a lot with `split` combined with some other operands, here it is `grep` and `sort`.

```perl 
print grep(s/^\d+(.*)/$1 /, sort(split(/ /,"8hacker, 4Perl 1Just 2another")));
```

I feel comfortable with this one, I see the Japh unordered but there is a `sort` not far and numbers will give the ordering :grin:

It is a way to properly demonstrate some Perl killer features like **easy string manipulation** and **regular expressions**.

We can detail this one liner into an equivalent script :
```perl
my $str = "8hacker, 4Perl 1Just 2another";
my @s = split " ", $str;
@s = sort @s;
# 1Just 2another 4Perl 8hacker,
foreach my $v (@s) {
        $v =~ s/^\d(.*)/$1/;
        print $v . " ";
}
```

`$1` is what is matched between parenthesis.

`sort` will not convert to numeric but compare string, if you're not convinced, please check this example :

```perl
my $str = "09first 2third 1second"; 
print join " ", sort split(" ", $str);
```

That produces :

```
09first 1second 2third
```

Despite being relatively simple, this is a cool Japh, demonstrating some nice Perl features. :smiley:

## Turtle Neck
OH! Turtleneck phrase jar! :astonished:

```perl
$_ = "wftedskaebjgdpjgidbsmnjgc";
 tr/a-z/oh, turtleneck Phrase Jar!/; print;
```

This Japh is playing with **transliteration operator**, the **regex range** and the **default variable** `$_` features.

The `tr` is an operator to **translate** (like the Unix `tr` command line).

`a-z` in the regex is actually implicitely transformed into `abcdefghijklmnopqrstuvwxyz`.

Then we only have to pick our Japh using the *"key"* `wftedskaebjgdpjgidbsmnjgc` ! :sunglasses:

Once unfold, the Japh looks like this :
```perl
my $str = "wftedskaebjgdpjgidbsmnjgc";
$str =~ tr/abcdefghijklmnopqrstuvwxyz/oh, turtleneck Phrase Jar!/;
print $str;
```

Relatively simple, but a very cool Japh !

## Conclusion
This is the end of my first post about Japhs !

![Crazy Japh](/assets/images/ox3qqsnwu89ctcuzw6jk.jpg)

I hope you enjoyed as much as me :grin:

Check the [next post of the serie](https://dev.to/thibaultduponchelle/japhs-autopsies-2-41jl)