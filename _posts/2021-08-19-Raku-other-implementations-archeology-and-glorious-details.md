---
layout: post
title: Raku other implementations, archeology and glorious details
date: 2021-08-19 09:30:23
---
![Raku past implementations](/assets/images/j1zdt6fezc7w44reh7t4.jpg)

(This is a translated/improved version of the french article [Raku en 2020](https://linuxfr.org/news/raku-en-2020) from the same author)

Thank you to **Elizabeth Mattijsen** who helped to proofread and with advices. 

## Table Of Contents
* [Birth](#raku-birth)
* [Renaming process from Perl 6 to Raku](#renaming-perl6-to-raku)
* [Implementations based on Parrot](#parrot-implementation)
* [Implementations based on Pugs](#pugs-implementation)
  * [Pugs](#pugs)
  * [v6](#v6)
  * [Perlito](#perlito)
* [Other implementations](#other-implementations)
  * [STD VIV](#std-viv)
  * [SMOP](#smop)
  * [Mildew](#mildew)
  * [Elf](#elf)
  * [Ponie](#ponie)
  * [Punie](#punie)
  * [Yapsi](#yapsi)
  * [Niecza](#niecza)
  * [Topaz](#topaz)
  * [Moe](#moe)
  * [PerlOnJava](#perlonjava)
  * [Sapphire](#sapphire)
* [Conclusion](#conclusion)

# The history of Raku
The history of Raku interpreter and virtual machine is really not straightforward... If you've heard about "Parrot", "PIR", "PASM", "Pugs", "Rakudo", "MoarVM", "NQP", "Rakudo on JVM", "Rakudo on Parrot", "Mildew", "Ponie" but you're lost with all these implementations then this blog post is made for you! 

I made researches :mag: to clarify all historical and technical (!) details and gathered all the results here, with several homemade and original sketches to make it crystal clear for you.

![Lot of original sketches](/assets/images/es4fa2fm2gkc9w278leq.png)

## The birth of Raku <a name="raku-birth"></a>
Raku is born on 18 July 2000 from a [famous event where John Orwant threw coffee mugs against a wall during a meeting](http://strangelyconsistent.org/blog/happy-10th-anniversary-perl-6).

## The renaming process : Perl 6 → Raku <a name="renaming-perl6-to-raku"></a>
A programming language that changes its name... it does not happens often!

Recently, Raku celebrated its second year (or its 21 years). Here is how the renaming happened:

0. Long time ago (around 2005), people discussed about an alias but it never led to anything
1. while answering a question, Larry Wall [proposed an alias](https://www.youtube.com/watch?v=E5t8qaAGw9w&t=4885s)
2. alias requested by [some people from Perl 6 community](http://blogs.perl.org/users/zoffix_znet/2018/10/a-request-to-larry-wall-to-create-a-language-name-alias-for-perl-6.html)
3. and [validated by Larry](https://twitter.com/zoffix/status/1058796898235105280)
4. later, one member of the _core team_ (Elizabeth Mattijsen) opened an "issue" on the official GitHub of Raku to ask for a renaming:
![Issue from Elizabeth](/assets/images/lo68b480gqv0fdl60424.png)
5. Elizabeth then opened a merge request towards the Git official repository of Raku (requesting maintainers to vote):
![Pull Request from Elizabeth](/assets/images/3p74u1yg15i9ojub2re0.png)
6. people voted for (or abstained), then came the "blessing" from Larry Wall:
![Comment from Larry Wall](/assets/images/dy40d146w352sduho8fn.png)
7. renaming done, please welcome Raku!

The renaming process in links: 
- August 2017: _[Original idea for Perl 6 Alias](https://www.youtube.com/watch?v=E5t8qaAGw9w&t=4885s)_ 
- October 2018: _[A request to Larry Wall for an alias](https://perl6.party/post/A-Request-to-Larry-Wall-to-Create-a-Language-Name-Alias-for-Perl-6)_ 
- November 2018: _[On Raku](https://liztormato.wordpress.com/2018/11/06/on-raku/)_ 
- August 2019: _[Liz issue — Perl in the name is confusing](https://github.com/Raku/problem-solving/issues/81)_ 
- August 2019: _[Liz PR — Path to Raku](https://github.com/Raku/problem-solving/pull/89)_ 
- September 2019: _[On renaming Perl 6](https://andrewshitov.com/2019/09/24/on-renaming-perl-6/)_ 
- October 2019: _[Blessing of Larry then renaming](https://github.com/Raku/problem-solving/pull/89#pullrequestreview-300789072)_

# Compilers, frameworks and virtual machines
In this second part, I will detail the past implementations of the Raku language. Get ready, acronyms are coming!

![Scrabble letter](/assets/images/9rxfpytoflzo0fn51h52.jpg)

## Which "official" implementation?
Short answer: **Rakudo** and **MoarVM**.

(the details about Rakudo/MoarVM are in the previous blog post of the serie)
    
Initially it was decided that no implementation would be defined as "official" for Raku but rather that "Raku is something that passes the [official test suite](https://github.com/Raku/roast)". In fact, since 2012 there is an official _de facto_ implementation which is **Rakudo + MoarVM**.

Before that, there was the Parrot framework (2002-2012) as well as Pugs (2005-2007) and various other compilers and runtime environments (Mildew, Niecza, Yapsi…). This technical and historical part will be discussed at the end of this dispatch. But let's go back to talk about the beginnings.

The very first announcement of the creation of Raku dates back to July 19, 2000. Larry Wall's idea was to make it an ultra-community project right down to the language design, so he would start by asking to contribute to the specifications. It resulted in 361 [RFCs](https://raku.org/archive/rfc/), , from which Larry Wall produced [apocalypses](https://raku.org/archive/doc/apocalypse.html), which where then explained by Damian Conway in the [exegesis](https://raku.org/archive/doc/exegesis.html) , and then later further detailed in the [synopses](https://design.raku.org/).

![RFC Apocalypses Synopses](/assets/images/2yd8k3zak4omzmlntgce.png)

Links for historians or the curious:
- 2000-1018: the [Raku museum repository](https://github.com/Raku/museum-items) partially saves "events" that are part of Raku's history
- 2000: [Old blog post criticizing the RFC process (early)](https://www.perl.com/pub/2000/11/perl6rfc.html/)
- 2005: [Get involved in Pugs](https://www.perlmonks.org/?node_id=455979)
- 2006: [Get involved in Perl6](https://www.perlmonks.org/?node_id=628746)
- 2008: [Get involved in Perl6](https://www.perlmonks.org/?node_id=690945)
- 2009: [Get involved in Perl6](https://www.perlmonks.org/?node_id=771635)
- 2010: [Happy 10th anniversary Perl 6](http://strangelyconsistent.org/blog/happy-10th-anniversary-perl-6) (MUST READ :warning:)
- 2015: [Flavio Glock interview](https://andrewshitov.com/2015/05/15/interview-with-flavio-glock/)

# Parrot <a name="parrot-implementation"></a>
Created in [2002](https://github.com/parrot/parrot/blob/master/docs/parrothist.pod), the framework and the [Parrot virtual machine](http://docs.parrot.org/parrot / latest / html) have long been central to Raku's implementation (this is no longer the case today). Parrot was born from an April Fool's Day announcing the unification of Perl and Python and even the upcoming release of a book on the subject:
    
![Announcement of the unification of Perl and Python](/assets/images/t2reah7ce74l48neyy0i.gif)

Why build a *new* VM?

The JVM was studied in 2001, but considered poorly suited to dynamic languages ​​(it still wasn't in 2010, _quid_ of 2021?).

## Compilation
Parrot offers much more than a virtual machine, Parrot is a language creation, compilation and execution framework. This framework makes it possible to build high level languages ​​(HLL) easily and quickly. It has been put into practice by Rakudo for a long time.

### PCT
PCT stands for _Parrot Compiler Tools_. Its purpose is to enable the creation of a compiler and a high level language execution environment (HLL).

![PCT](/assets/images/11s6q12bt485mx8pp49e.png)

PCT is written in PIR (see assembly section below).

### PAST
PAST stands for _Parrot Abstract Syntax Tree_: internal representation of a syntax tree.

### HLL
HLL stands for _High Level Language_.

### PGE
Originally called P6GE, **PGE** stands for _Perl Grammar Engine_. Based on **HLLCompiler**. A PGE rule looks like this:
    
```perl
rule term   { <number> | \( <expr> \) }
rule number { \d+ }
rule expr   { <term> ( '+' <term> )* }
```

PGE was used by Pugs, another Raku compiler (see below).

### TGE
TGE stands for _Tree Grammar Engine_.

### PACT
[PACT](https://github.com/parrot/PACT) stands for _Parrot Alternate Compiler Toolkit_. An alternative to PCT because PCT was considered too limited.

## Assembly
### PASM
PASM stands for _Parrot assembly language_ (PASM). The low level code ready to be converted and executed by Parrot VM. PASM code looks like this: 
    
```asm
  set     I1, 1
REDO:
  gt      I1, 10, END
  print   I1
  print   " "
  inc     I1
  branch  REDO
END:
  print "\n"
  end
```

References:
- [PASM code examples](http://www.parrot.org/dev/examples/pasm)
- [LinuxMag](https://connect.ed-diamond.com/gnu-linux-magazine) articles from [french mongueurs](http://www.mongueurs.net/) on Parrot assembler writing: [1](http://articles.mongueurs.net/magazines/linuxmag97.html), [2](http://articles.mongueurs.net/ magazines / linuxmag98.html) and [3](http://articles.mongueurs.net/magazines/linuxmag99.html).

### IMCC
IMCC stands for _Intermediate Code Compiler_. It is an alternative tool for creating and running Parrot _bytecode_

IMCC brings its own language, commonly known as _Parrot Intermediate Language_ (PIR). IMCC embeds the Parrot runtime environment, so IMCC can compile from PIR to PASM, then from PASM to PBC, then execute this _bytecode_. IMCC can also do optimizations, although it doesn't by default.

### PIR
First called IMC, [PIR](http://docs.parrot.org/parrot/latest/html/docs/user/pir/intro.pod.html) is an overlay of PASM without being a language of high level. Files containing PIR code have the suffix ".imc"

This is what PIR looks like: 
    
```asm
.sub loopy
        .local int counter
        counter = 0
LOOP:   if counter > 10 goto DONE
        print counter
        print " "
        inc counter
        goto LOOP
DONE:
        print "\n"
        end
.end
```

You can learn more from this [IMCC intro](https://www.oreilly.com/library/view/perl-6-essentials/0596004990/ch07.html) or this article on how to [write PIR]( http://docs.parrot.org/parrot/latest/html/docs/user/pir/intro.pod.html). See here [PIR examples](http://www.parrot.org/dev/examples/pir) or even the [detailed documentation of FR mongueurs on PIR](http://articles.mongueurs.net/magazines/linuxmag122 .html).

## Execution
### NCI
NCI stands for _Native Call Interface_.

### PMC
PMC stands for _PolyMorphic Container_ or _Parrot Magic Cookies_ (the way of representing data in the virtual machine).

### PBC
PBC stands for _Parrot Byte Code_

## The Parrot VM
The Parrot VM is a registry-based virtual machine, which is not the "standard" (eg JVM).

Here are some features of the Parrot VM:
- able to manage static and dynamic languages
- Copy On Write
- manages continuations and closures
- can be embedded in C code
- PolyMorphic Container (flexible type storage)

It's easy to include Parrot in C code or call C in Parrot ([Native Call Interface](http://docs.parrot.org/parrot/latest/html/docs/pdds/draft/pdd16_native_call .pod.html)).

## Raku implementation based on Parrot (2002-2012)
![PCT IMCC Parrot VM](/assets/images/0f8hhhiuvjdp1qchkk85.png)

Or with a merged IMCC and Parrot stage (later because IMCC contains Parrot):
![PCT IMCC](/assets/images/gz0rr0dmg0qd4qi1hjim.png)

Below is an even more detailed/technical diagram (taken from Parrot documentation):
![How Parrot works](/assets/images/zus5lqpqj0h62i0ys1ri.png)

Many details are available in the [Parrot Design Document](http://docs.parrot.org/parrot/latest/html/pdds.html)

## Problems with Parrot
If Parrot was initially at the center of Raku, this has changed over time:
    
- 2008: "_While Parrot is the most solid solution to deploy Perl 6 in the long term, on the other hand, the challenges Parrot has accepted had proven to consume more time and resources than previously expected._" ([Perl foundation news](https://news.perlfoundation.org/post/2008q2_grant_proposal_smop_sim))
- 2013: "_The latest news is that Parrot Virtual Machine is no longer the only one enjoying Rakudo's exclusivity._" ([all about Perl6](http://www.josetteorama.com/all-about-perl-6 -interview-of-jonathan-worthington-part-1-of-3 /))
- communication problems
- Parrot gradually moved away from Perl 6 (by becoming more generalist)

Little by little, the Rakudo compiler has freed itself from Parrot and is now targeting a new virtual machine.

# Pugs (2005-2007) <a name="pugs"></a>
From here we start archeology, the real one :mag:

In his short existence, Pugs explored many architectural choices. Pugs refers to the interpreter, compiler, runtime environment, and test suite. The compiler can compile to Haskell, JavaScript, Perl 5, or PIR (for Parrot, if you remember).
    
![Pugs compilation flow](/assets/images/fs49aubnqum8n29kykix.png)
    
Pugs is written in Haskell and falls dormant after 2007.

## Compilation
Here are the concepts of builds around the Pugs implementation.

### PCR
PCR stands for _Pugs Compiler Rules_. This is a Perl 5 implementation of Raku's regular expression engine. PCR replaced PGE in Pugs.

### LREP
LREP evolved into _Pugs::Compiler_, then, later, MiniPerl6.

### Pugs::Compiler
_Pugs::Compiler_ is a set of Perl 5 modules for compiling Raku.

### MiniPerl6
Was part of Pugs but in a separate directory. **MiniPerl6** became **KindaPerl6** then **Perlito6**.

### KindaPerl6
KindaPerl6 or KP6 is a Raku implementation of the Raku grammar with a _bootstrap_ in Perl 5. KindaPerl6 is built from MiniPerl6.

## Execution
### PIL
PIL stands for _Pugs Intermediate Language_. PIL is not a human readable format but rather an abstract syntax tree internal to Pugs.

### PIL-Run
![Pugs PIL Perl](/assets/images/520c6p3qmy2s80i7jl7y.png)
    
PIL-Run was built on top of a set of Perl 5 modules that read and run PIL. PIL-Run was Pugs' back-end in Perl 5... at the start.

## Pugs based implementations <a name="pugs-implementation"></a>
### Pugs + various back‑ends
"Pugs compiles and executes"
![Pugs compile and run](/assets/images/zr81m45yvcjmgir1579n.png)

"Pugs compiles for Parrot (PIR)"
![Pugs PIR](/assets/images/o68g2x2r9fm3n72i15ac.png)

The compilation to PIR is done in two stages, small zoom on it:
![Pugs PIL PIR](/assets/images/rmjpp55vf46q2tu7esup.png)

"Pugs compiles (transpiles?) To JavaScript"
![Pugs JS](/assets/images/vlh3eqj99kstiw4owk9u.png)

"Perl compiles (transpiles?) To Perl 5"
![Pugs Perl 5](/assets/images/7y702czqjfsnoty5cr17.png)

### v6 <a name="v6"></a>
**v6-pugs** then **v6-alpha** and now [v6.pm](https://metacpan.org/pod/v6) is a complete rewrite of Pugs, using a mix of Raku (_Pugs::Compiler_ and associated modules) and Perl 5. It reuses code from the runtime environment of PIL-Run and "half of the CPAN" :grinning: 

Now v6 is released in Perlito6. **v6.pm** is the front-end for Perlito and Pugs in Perl 5. 
 
### Perlito <a name="perlito"></a>
The [Perlito project](https://github.com/fglock/Perlito) is led by [Flavio S. Glock](https://github.com/fglock). The Perlito project actually contains multiple compilers for multiple languages ​​in multiple languages ​​targeting various _back‑ends_:
    
- compile Perl 5 to Java source code
- run Perl5 directly in the JVM
- compile Perl 5 to JavaScript source code, run Perl5 directly in the browser or Node.js
- compile Raku to JavaScript source code, run Perl6 directly in the browser or Node.js
- compile from Perl 5 to Perl 5
- compile from Raku to Perl 5
- compile from Raku to Python 2.6
- compile from Perl 5 to Perl 6 (in progress)
- compile from Raku to Ruby 1.9 (in progress)
- compile from Raku to Go (in progress)
- compile from Raku to Common Lisp (SBCL) (in progress)

One thing he can't do is translate from Perl 5 to Raku.

MiniPerl6 and KindaPerl6 form Perlito6. Perlito5 is a port of Perlito6 to Perl5. It is "Perl 5 implemented in Perl 5". Perlito5 itself is written in Perl. Perlito6, on the other hand, is written in Raku.

Perlito only implements a subset of Raku called the "useful subset" which:
- has no list context
- has no inheritance
- has no laziness
- has closures but no coroutines or continuations
- has no multis. 

This "useful subset" is kind of similar to **NQP** (see previous blog post for details about NQP).

# Other compilers, runtime environments and virtual machines <a name="other-implementations"></a>
In this part, I will continue my tour of initiatives around compilers, runtime environments, and legacy virtual machines.

## STD and viv <a name="std-viv"></a>
[STD and viv](https://raku.org/compilers/std-viv) are works of Larry Wall.
    
We find in [STD](https://github.com/perl6/std/blob/master/STD.pm6) the grammar of Raku… written in Raku (which did not have a compiler at the time! :smirk: It's the beginning of the _bootstrapping_ problems :grinning:
    
[VIV](https://github.com/perl6/std/blob/master/viv) or literally in Roman numerals "VI → V" (and therefore "6 to 5") was a module capable of converting from Perl 6 to Perl 5.

## SMOP <a name="smop"></a>
First called YAP6, **SMOP** stands for _Simple Meta Object Programming_
    
SMOP is a compiler and runtime environment written in C for Raku, but we sometimes say SMOP to refer only to the runtime environment (which may be targeted by other compilers).
    
![SMOP YAP6](/assets/images/duyi0u0q1no2uulkav3g.png)
    
SMOP is not a virtual machine but a runtime environment that resembles that of Perl 5, while having functionality to manage Raku.

## Mildew <a name="mildew"></a>
Mildew was an STD to SMOP compiler.
    
![Mildew SMOP](/assets/images/m37lmxax10b3ri06l67e.png)
    
It directly uses the STD grammar.

## Elf <a name="elf"></a>
Elf was a compiler written in Raku with a Ruby grammar. It could issue Perl 5 or Lisp. It was never completed. It was expected that Elf could target SMOP.

## Ponie <a name="ponie"></a>
[Ponie](http://www.poniecode.org/) stands for _Perl On a New Internal Engine_. This involved running Perl 5 in the Parrot virtual machine. Stopped in 2006.

[Announcement Jesse Vincent](https://www.nntp.perl.org/group/perl.ponie.dev/2006/08/msg487.html)
    
![Ponie](/assets/images/7df6hvy7bk4dtm3usf9a.png)

## Punie <a name="punie"></a>
[Punie](https://en.wikipedia.org/wiki/Punie) (direct reference to Ponie) was a Perl 1 compiler to Parrot.

## Yapsi <a name="yapsi"></a>
[Yapsi](https://github.com/masak/yapsi) for _Yet Another Perl Six Implementation_ is an implementation of the compiler and its Raku runtime environments and virtual machines in Raku.
    
![Yapsi](/assets/images/l02832y9zhv3ipojelao.png)
    
**SIC** means _(S??) Instruction Code_, this is Yapsi's own _byte code_.

## Niecza <a name="niecza"></a>
[Niecza](https://github.com/sorear/niecza) is a Raku compiler written in C# that targets CLR ([Mono](https://wiki.winehq.org/Mono)).
    
![Niecza Mono](/assets/images/883yjl1p5f6ql50layt9.png)

## Topaz <a name="topaz"></a>
[Topaz](http://topaz.sourceforge.net/) was a Perl 5 core rewrite in C++ started before Perl 6, finally abandoned.

## Moe <a name="moe"></a>
[Moe](https://github.com/MoeOrganization/moe) was a Perl 5 core rewrite in Scala in 2013. See [slides from Stevan Little](https://speakerdeck.com/stevan_little/perl-is-not-dead-it-is-a-dead-end) 

## PerlOnJava <a name="perlonjava"></a>
[PerlOnJava](https://github.com/fglock/PerlOnJava) is a Perl 5 core rewrite in Java to run on JVM.

## Sapphire <a name="sapphire"></a>
[Sapphire](https://www.perl.com/pub/2000/09/sapphire.html/) was another rewrite of Perl 5 internals in September 2000, shortly after the announcement of Perl 6. More experimentation than something else.

Phew! It was the last one, we're done. :grinning:

# Conclusion <a name="conclusion"></a>
There are many interesting concepts to be found in Raku as well as in its history and the history of its implementations (although most of them are part of a vanished world, they well deserved a little closer look).
    
I hope that this long blog post has been able to lift the fog around the twists and turns of Raku's implementations, its history and to highlight the concepts of the language. 
