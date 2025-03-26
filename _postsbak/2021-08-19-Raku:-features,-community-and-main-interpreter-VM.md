---
layout: post
title: Raku: features, community and main interpreter/VM
date: 2021-08-19 09:29:19
---
![Some Raku goodies in bulk](images/pys7doytatprcd7n829f.jpg)

(This is a translated/improved version of the french article [Raku en 2020](https://linuxfr.org/news/raku-en-2020) from the same author)

Thank you to **Elizabeth Mattijsen** who helped to proofread and with advices. 

## Table Of Contents
* [About Raku](#about-raku)
* [Community](#about-raku-community)
* [Rakudo](#rakudo)
* [Features of the Raku language](#raku-features)
  * [Typing](#raku-typing)
  * [Routines](#raku-routines)
  * [Operators](#raku-operators)
  * [Async, parallel, concurrency](#raku-async)
  * [Object oriented programming and Meta object programming](#raku-oop-mop)
  * [Grammars](#raku-grammars)
  * [Interfacing](#raku-interfacing)
  * [Unicode](#raku-unicode)
  * [Other](#raku-other)
* [Implementations based on Rakudo](#rakudo-implementation)
* [Conclusion](#conclusion)

In this first blog post in a serie of two, you will find a general introduction with some community insights and details about interpreter and VM (*Rakudo* and *MoarVM*).

In a second part you get a long description of the Raku features to discover why Raku is worth talking about and learning.

(Next blog post is about past implementations and history details)

This blog post is made with love :heart:
    
## About Raku <a name="about-raku"></a>
~~Perl 6~~ Raku is a programming language powerful and mature that was difficult to implement (which will be described in the second part of this post).

Raku née "Perl 6" is no longer the next version of **Perl 5** (will be Perl 5.36 or Perl 7). Raku has been **renamed in 2019** to clarify this state. But Raku shares a lot with Perl 5:
    
- some technical characteristics (close to natural language, [sigils](https://en.wikipedia.org/wiki/Sigil_(computer_programming))...)
- the same [foundation](https://www.perlfoundation.org/)
- the same conferences (but Raku had its first [dedicated conference](https://conf.raku.org/) recently)
- partly their communities (Damian Conway, Larry Wall...)
- some events ([Perl Weekly Challenge](https://perlweeklychallenge.org/)...)

Lately, Raku has become too different from Perl 5 that we can simply say "Perl" to designate Perl 5 (or Perl 7) and we would prefer "Raku" in any circumstances to talk about Perl 6. There was a time where Perl 6 community was slightly against this renaming, but the overall opinion changed and the renaming was done smoothly between 2018 and 2019 (see next blog post of the série for more details).

You can follow Raku news by subscribing to the newsletter [Rakudo Weekly News](https://rakudoweekly.blog/).

Raku has a small community but some "_killer apps_":
- its IDE "[Comma](https://commaide.com/)"
- [Cro](https://cro.services/), a toolbox for the web (applications, services)
- [Sparrow](https://github.com/melezhik/Sparrow6) an automation framework, and its [modules](http://sparrowhub.io/)
- a (small) [CPAN](https://modules.raku.org/)

## Big names from Raku world <a name="about-raku-community"></a>
Before going into details of renaming and Raku versions, let's hightlight some past and present big contributors to Raku:
    
- **Jonathan Worthington**: Current lead developer of Rakudo ([interview](http://www.josetteorama.com/all-about-perl-6-interview-of-jonathan-worthington-part-1-of-3/))
- **Elizabeth Mattijsen**: very involved in Raku
- **Patrick Michaud**: former lead deveoper of Rakudo, NQP, etc....
- **Audrey Tang**: currently Taïwan minister (!), formerly main developer of Pugs (Perl 6 implementation in Haskell, see this [old interview](http://www.perlcast.com/2006/03/interview-with-audrey-tang.html) or this [interview](https://andrewshitov.com/2015/05/05/interview-with-audrey-tang/))
- **Damian Conway**: teacher, speaker, spokesperson and prolific developer
- **Larry Wall**: creator of Perl (BDFL) and creator of Raku. No need to present him! In 2021, no longer involved.
- **Moritz Lenz**: writer and big contributor
- **Flavio S. Glock**: lead developer of Perlito

Not all are still active and the list is not exhaustive!

The Raku community decided recently to setup a [steering council](https://github.com/Raku/Raku-Steering-Council/blob/main/announcements/20200720.md).

## Raku(do) <a name="rakudo"></a>
The most advanced implementation of Raku is **Rakudo** (interpreter) with **NQP** (builtins) on **MoarVM** (virtual machine).

When Rakudo is released, the bundle **Rakudo + MoarVM** is called **Rakudo Star** (or **Rakudo \***) :star:

Since 2015, the implementation of Raku is "features-complete" and the effort on the compiler and VM are more about fixing issues and improving performances.
 
Raku had multiple official releases (the most important being in 2015) :
    
- first public version of **Rakudo \*** in july 2010 (major version but not feature-complete, still based on Parrot → Rakudo + Parrot)
- **6.c** "Christmas" in 2015 ([announcement](https://perl6advent.wordpress.com/2015/12/25/christmas-is-here/)) (Rakudo + MoarVM)
- **6.d** "Diwali" in november 2019 ([details of the several changes](https://github.com/Raku/roast/blob/master/docs/announce/6.d.md)) (Rakudo + MoarVM)
- **6.e** will be the next major version (Rakudo + MoarVM).

From where comes this versioning scheme?

Simply from a [recurring joke](https://youtu.be/FP1IfvAUJnI) about the release date of Raku. It was common to answer "will be ready for christmas" :grinning:

In addition to major version, the team working on Raku produces monthly minor versions.

## Some books
Before going into language details, here are some books to help you learn more about Raku:
    
- [Perl 6 Essentials](https://www.oreilly.com/library/view/perl-6-essentials/0596004990/)
- [Learning Perl 6](https://www.oreilly.com/library/view/learning-perl-6/9781491977675/)
- [Think Perl 6](https://www.oreilly.com/library/view/think-perl-6/9781491980545/)
- [Perl 6 quick syntax reference](https://www.oreilly.com/library/view/perl-6-quick/9781484249567/)
- [Perl 6 deep dive](https://www.oreilly.com/library/view/perl-6-deep/9781787282049/)
- [Raku fundamentals](https://www.oreilly.com/library/view/raku-fundamentals/9781484261095/)

## Some links
- [Test Raku online](https://repl.it/languages/raku)
- [Raku official website](https://www.raku.org/)
- [Rakudo](https://rakudo.org/)
- [MoarVM](https://www.moarvm.org/)

The technical details starts here, I hope you're ready :grinning:

## The power of Raku <a name="raku-features"></a>
Raku features are impressive, I wanted to start by this :)

Raku takes roots from the linguistic skills from Larry Wall, therefore Raku is very influenced by natural language. Raku is multi-paradigm (procedural, functional, concurrency programming and object oriented).

The values of Raku can be found in the Raku manifesto ([1](https://www.codesections.com/blog/raku-manifesto/),  [2](https://www.codesections.com/blog/raku-manifesto-2/), [3](https://www.codesections.com/blog/raku-manifesto-3/))

Like its cousin Perl:
* it's a rich language with a notion of [context](https://docs.raku.org/language/contexts)
* its regular expressions are very powerful and Raku even integrates grammar handling directly in the language (!)
* it has a [CPAN](https://modules.raku.org/t/CPAN).

Contrary to Perl 5:
* interfacing with native code is deadly simple 
* oriented object programming is integrated in the language (framework + object types) 
* the language can deal with concurrency and provides a full toolbox for it
* Unicode is handled "by default"

For more technical details, here is the [Raku glossary](https://docs.raku.org/language/glossary) and also a [features comparison between the compilers](http://web.archive.org/web/20150801100611/http://www.perl6.org/compilers/features) (it gives a good overview of the language). In the coming paragraphs, the Raku features are explained more in detail.

Courses like [courses.raku.org](https://course.raku.org) or [raku.guide](https://raku.guide) are probably good "showcases" of Raku features.

### Typing <a name="raku-typing"></a>
- Gradual typing (dynamic and static typing):
```perl
# Dynamic
my Cool $var = 42;

# Functions using $var will coerce to another type 
# upon their needs

# Static 
my Str $var = "Raku";
```
- Annotation in signatures:
```perl
sub ab(Int $a, Int $b) { return $a+$b; }; 
say ab(1,1);
```

- Type inference
- Allomorphs (and polymorphic evaluation): `IntStr $foo` 
- Junctions:
```perl
my $junction = 1|2|3;
$junction += 4; # junction now equals 5|6|7
$junction += (1&2); # junction now equals (6|7|8)&(7|8|9)
```

- [Subsets](https://perl6advent.wordpress.com/2016/12/08/how-to-make-use-and-abuse-perl-6-subsets/): allow to extend isomorphic classes, can be used as constraints, while being resolved at runtime:
```perl
subset Even where * %% 2;  
say 1 ~~ Even; # False
``` 

- Coercion:
```perl
sub i-cast(Int() $n) { say $n.^name }; 
i-cast "42";
```

- [Coercion in signatures (constraints)](https://docs.raku.org/type/Signature#Coercion_type)

Constraints + coercion ("I want a string object and I _cast_ into integer object"):
```perl
sub f(Int(Str) $want-str-cast-to-int, Str() $cast-to-str) { } ;
f '10', 10;
``` 

Or conditional constraints ("my argument should be an integer object or a string object"):
```perl
sub xyz($n where $_ ~~ Int | Str ) { say +$n }
```

- Native types:
```perl
my int8 $verysmall = 42; 
say $verysmall;
```
- Auto‑boxing : automatic conversion from native type to object
- Auto‑vivification in the hash/arrays:
```perl
my %a; 
%a{'autovivification'}++; 
say %a{'autovivification'};
```

- [Twigils](https://docs.raku.org/language/variables#Twigils) (!) for instance to define the variable scope
- A full [collection of objects containers](https://docs.raku.org/language/setbagmix). See the [list of composite types](https://docs.raku.org/type-composite.html) (SetHash, Bag, Map, list, Mix, Pair, Set...)
- Shaped array/hashes (a kind of matrix or multi dimension hash)
- Compact arrays: `my int @array` which is stored in a contiguous manner
- [Lazy lists](https://medium.com/@jcoterhals/perl-6-small-stuff-5-gather-around-its-time-to-get-lazy-but-why-da20fdb18a3b) (see also `gather`):
```perl
my @list = (1, 1, * + * ... *).grep({ $_.is-prime });
say @list[4]; # This generates elements 0..4. 
# Elements 5..∞ haven't been generated yet
```

### Routines <a name="raku-routines"></a>
- Argument:
```perl
sub plus2($foo) { return $foo+2; }
```

- Typed:
```perl
sub mul3(Int $foo) { return $foo*3; }
```

- With attribute _rw_ or _copy_:
```perl
sub make42($foo is rw) { $foo = 42; }
```

- Multi‑dispatch:
```perl
multi sub sayit( Int $n ) { say "Number: $n"; } 
multi sub sayit( Str $s ) { say "String: $s"; }
```

The dispatch is based on the number of arguments, their types, the constraints (we can even play with it with functions `nextsame`, `nextwith`, `callsame`, `callwith`).
See also "_Proper narrowness analysis_" for the best candidate resolution.

- Slurp of remaining arguments and flattening of arguments (like in Perl 5). 

### Operators <a name="raku-operators"></a>
- Raku has a big number of operators, see the full list:
![Periodic table of the operators](images/mk66pcc34k85yfb2lfcb.jpg)
- Raku can be easily extended (see [documentation of the operators](https://docs.raku.org/language/operators))
- [native operators](https://6guts.wordpress.com/2011/10/15/an-optimizer-lands-bringing-native-operators/)
 (with inline or explicit optimizations)
- operators can even be in UTF-8

### Async, parallelism and concurrency <a name="raku-async"></a>
A full toolbox to handle [asynchronous, parallelism and concurrency](http://doc.perl6.org/language/concurrency) :
- [promises (or future)](https://docs.raku.org/language/concurrency#Promises) usable with [Proc::Async](https://docs.raku.org/language/concurrency#Proc::Async) for external calls
- streams handling with [Channel](https://docs.raku.org/language/concurrency#Channels) and [Supplies](https://docs.raku.org/language/concurrency#Supplies) to implement _event driven_ or _patterns publish/subscribe_ 
- an access to low level primitives like [threads, scheduler and locks](https://docs.raku.org/language/concurrency)

### Object oriented programming and Meta object programming <a name="raku-oop-mop"></a>
Ability to define our own operators (seen above) and features. The _meta object programming_ is partially handled in the virtual machine:
- single or multiple inheritance
- introspection
- "edit" a class after instantiation ([example](https://gist.github.com/draegtun/276591))
- [composition/encapsulation](https://perl6advent.wordpress.com/2011/12/14/meta-programming-what-why-and-how/) of methods
- [trust relationship](https://docs.raku.org/type/Metamodel::Trusting) which allows access to private methods of another (parent) class without making them inherit
- [delegations](https://laurent-rosenfeld.developpez.com/tutoriels/perl/perl6/objets/#L2-6) `has $.base is rw handles <meth1 meth2>`
- type **whatever** "*" (which gave its name to the cast "Rakudo star")

### Grammars <a name="raku-grammars"></a>
Support for [grammars](https://docs.raku.org/language/grammars) (`grammar`,` token`, `rule`,` regex`) in the language! 

```perl
grammar Calculator {
    token TOP { <calc-op> }
 
    proto rule calc-op          {*}
          rule calc-op:sym<add> { <num> '+' <num> }
          rule calc-op:sym<sub> { <num> '-' <num> }
 
    token num { \d+ }
}
 
class Calculations {
    method TOP              ($/) { make $<calc-op>.made; }
    method calc-op:sym<add> ($/) { make [+] $<num>; }
    method calc-op:sym<sub> ($/) { make [-] $<num>; }
}
 
say Calculator.parse('2 + 3', actions => Calculations).made;
```

### Interfacing <a name="raku-interfacing"></a>
Native language support is really very easy!

- Easy interfacing with native languages (_Native Call_):
```perl
use NativeCall;

# Interface a function from unistd.h
sub getpagesize() returns int32 is native {}; 

# Interface a function from a shared library (e.g. libcalculator.so)
sub add(int32, int32) returns int32 is native("calculator") {}; 
```

- Interfacing with Perl 5 with [Inline::Perl5](https://github.com/niner/Inline-Perl5):
```perl
use Test::More:from<Perl5>;
plan tests => 1;

use Inline::Perl5;
my $p5 = Inline::Perl5.new;
$p5.call('print', 'Hello World');
```

### Unicode processed at the grapheme level <a name="raku-unicode"></a>
Very high level of Unicode management, in particular thanks to primitives in the MoarVM virtual machine.
    
The language operators themselves can be UTF-8 (like the ones you create).

### Other bulk features <a name="raku-other"></a>
- [Pointy arrow block](https://andrewshitov.com/2018/10/31/anonymous-code-blocks-in-perl-6/) (anonymous closure): 
    
```perl
my $cube = -> $x {$x ** 3};
say $cube(3); # 27
```

- [Placeholders](https://andrewshitov.com/2018/10/31/placeholders-in-perl-6/)

By Alphabetic order: 
```perl
my $pow = {$^x ** $^y};
say $pow(3, 4); # 81
```

Or even:
```perl
for 0..9 {
    say "$^n2, $^n1";
}
```

Or with naming : 
```perl
my $pow = {$:base ** $:exp};
say $pow(:base(25), :exp(2)); # 625
```

# Rakudo Star (from 2010) <a name="rakudo-implementation"></a>
The first major version of Rakudo Star (or "Rakudo *") was based on Parrot (PCT + ParrotVM), but we will ignore this version to focus on the current implementation (Rakudo + MoarVM).

## Compilation (Rakudo)
**Rakudo** is a compiler for Raku that implements the entire language and can target several different VMs (the main one being MoarVM). Most of Rakudo is written in "simplified Raku" (NQP). Rakudo also implements precompilation to optimize its performance. In addition to that, Rakudo improves the syntax tree using several optimization methods, here are some examples:
    
- the converted _range_ iterations are in native loops
- de-virtualization of private methods with compile-time resolution
- removal of (statically) dead code
- anonymize a variable
- reduce the scope of a variable
- unfolding of the junctions

### NQP
[NQP](https://github.com/Raku/nqp) is a compiler like MiniPerl for Perl 5. It is a _bootstrapping_ tool which helps to compile the Raku parts of Rakudo and compile the libraries before running have compiled the libraries. Unlike MiniPerl for Perl 5 (which is an interpreter that can interpret all Perl syntax but miss some _batteries_: means without modules mixing Perl code and native code), NQP can only compile a "simplified Raku". NQP refers to both the compiler and the source code contained in files with the ".nqp" extension. 

Some NQP code looks like this: 
```perl
method symtable() {
    %!symbol := nqp::hash() if nqp::isnull(%!symbol);
    %!symbol
}

method evaluate_unquotes(@unquotes) {
    my $result := self.shallow_clone();
    my $i := 0;
    my $elems := nqp::elems(@(self));
    while $i < $elems {
        $result[$i] := self[$i].evaluate_unquotes(@unquotes);
        $i := $i + 1;
    }
    $result
}
```

NQP is part of Rakudo and seems inspired from MiniPerl6/KindaPerl6.

Perlito (see below) also implements the same kind of "simplified Raku".

## Execution (MoarVM)
[MoarVM](https://github.com/MoarVM/MoarVM) stands for _Metamodel On A Runtime VM_ ([official site](https://www.moarvm.org/index.html)). It's a registrers-based virtual machine like Parrot. [Jonathan Worthington](https://github.com/jnthn) is the founder and architect of MoarVM.

Here are some features of MoarVM: 
- internal representation closer to Raku (compared to Parrot) ("_On the other hand, there are features that are hard to implement efficiently if the VM doesn't support it._", according to an [interview with Flavio Glock ](https://andrewshitov.com/2015/05/15/interview-with-flavio-glock/));
- superb Unicode support, with strings represented at the grapheme level
- management of asynchronous and concurrent programming with control structures for concurrent programming, synchronous sockets, timers, processes, semaphores, blocking queues, etc.
- precise garbage collection, generational (young → [_semispace_](http://www.cs.cornell.edu/courses/cs312/2003fa/lectures/sec24.htm) and old → _big buckets_) and managing the competition
- able to manage continuations
- [bounded serialization](https://6guts.wordpress.com/2012/02/10/bounded-serialization-better-regexes-and-better-errors/), serialize the code of the loaded modules for later and save start-up time by avoiding reconstructing the intermediate representations of this code
- runtime loading of code
- optimizations: _tail call_ eliminations (do not stack in the call stack if the function return is in the call), _dispatch_, elimination of dead code, _on stack replacement_ (replacement on the routine stack not optimized by a routine optimized), _[escape analysis](https://en.wikipedia.org/wiki/Escape_analysis)_ (transform heap allocations into allocation on the stack or even in a register) and _scalar replacement_ (eliminate memory allocations)
- JIT compilation
- profiling of the call stack and allocations
- [heap snapshotting](https://6guts.wordpress.com/2016/03/21/a-whole-heap-of-work/): mainly for further scans (investigation and improvement of garbage collection, for example)

I also recommend reading this [introduction to MoarVM](http://brrt-to-the-future.blogspot.com/2014/05/moarvm-as-machine.html). 

### MAST
MAST stands for _MoarVM AST_ (Abstract Syntax Tree). 

### MBC
MBC stands for _MoarVM Byte Code_. Here what looks like MBC:
    
```asm
; Grab value out of Scalar
decont r4, r1 

; Grab type ; de-Scalar if needed
wval r5, 1, 34
decont r3, r5

; Ensure arg is an Int
istype r6, r4, r3
assertparamcheck r6
```

## Implementation based on Rakudo + MoarVM (since 2012)
MoarVM does not have an assembler.
    
![Rakudo Moar](images/2syw2b00dpqrg0s6038w.png)

Below is another architecture diagram taken from a presentation on Rakudo/MoarVM optimizations (2014):
![Rakudo Architecture](images/vpq3t6jridlegh6750ni.png)

# Conclusion <a name="conclusion"></a>
This first blog post treated more about *current* information about Raku.

I hope it gave you the envy to try it :kissing_heart:

Next blog post will dig into historical bits of Raku (and implementation archeology) with several technical sketches :dancer:

It took me a lot of time to gather these traces of a dead world, but believe me it's very interesting so just let yourself be guided!
