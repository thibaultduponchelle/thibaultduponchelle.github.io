---
layout: post
title: Book review "Mastering Perl"
date: 2021-11-02 12:56:59
---
![Mastering Perl](images/2t33a9d2rkmicle13i3k.jpg)

[Mastering Perl](https://www.oreilly.com/library/view/mastering-perl/9780596527242/) is a book from [brian d foy](https://en.wikipedia.org/wiki/Brian_d_foy)

If you like this post, read my other [Perl books reviews](https://dev.to/thibaultduponchelle/about-perl-books-review-1cj6) :grinning:

## Becoming a Perl master
This is a good paragraph title because this is what this book is about, to make you a better programmer and particularly a better Perl programmer. 

The goal is even more fairly high since it aims to (give you hints) to make you a *master*.

![Splinter](images/ulwoh9w8b4pl4wt9qdgv.jpg)


There is an interesting introduction about how to become a master *in general*, how it involves studying methods from multiple masters, working on a masterpiece and knowing multiple languages.

## Book structure
The book is composed of a serie of totally independent chapters. Each chapter focuses on one topic and has the same structure: a kind of introduction, the main content with paragraphs, a list of resources and a conclusion.

There are a lot of names dropping and references so you can continue your path to mastering :grinning:

Reading this book requires to know Perl basics.

## Regex
Regex as first chapter is a bit rough :grinning: but there are a lot of interesting bits like explanations about modifiers, `lookahead` and `lookbehind`, the `use re "debug";` 

## Security 
This chapter suffers from being old (the book I have into my hands was published in 2007) and all topics are very well known today (but does not mean they are no longer true).

I enjoyed the description of different forms of system calls and the explanation about setuid. 

## Debugging Perl
A lot of very nice tricks here, like `redefine` or wrapping subs or even using `-d` for a `Devel::` shortcut :+1:

Have you ever used all debugging functions from this list?
1. `print` (of course! Who does not?!)
2. `warn` (yes, a customized print)
3. `croak` (people says it is the magic wand)
4. `carp` (how is it different from croak?)
5. `cluck` (WUT?) 
6. `confess` (how many are there?)

## Profiling
This is a great and not so great chapter in the same time. There is plenty of profilers listed here like [Devel::SmallProf](https://metacpan.org/pod/Devel::SmallProf) (not updated since 2007, still good?) or [DBI::ProfileDumper](https://metacpan.org/pod/DBI::ProfileDumper) or [Devel::Dprof](https://metacpan.org/pod/Devel::DProf) (deprecated). 

I must add [Devel::NYTProf](https://metacpan.org/dist/Devel-NYTProf) because it's a must! I think it is not mentioned because it was not created when this book was released.

There is even a paragraph to explain how to write your own debugger.

It's not so great because the first edition of Mastering Perl is old, code is not really modern and it is a bit "too personal" for me (this last point could be a good point for other people, matter of taste).

## Benchmark
In addition to pure benchmark tips like `-DDEBUGGING_MSTATS` compilation flag and benchmark functions like `timethese` there are technical details from perl internals (and this is something I really enjoy)

"perl trades memory for processing speed" or "perl does a lot of lookup instead a lot of compilation" or even about memory management (perl takes big memory chunk and tries to reuse them)

Some usage of [Devel::Peek](https://metacpan.org/pod/Devel::Peek) and [Devel::Size](https://metacpan.org/pod/Devel::Size) are showing how perl behaves (SV, PV, PVIV, how data is stored) and how we can inspect this even from running program.

I really loved this chapter!

## Clean Up Perl
This chapter is about managing a codebase and does not fall into the trap of giving details about coding style but keeps about generic concepts:
- "Code isn't bad because a novice Perl programmer can't read it"
- "[You should] Be able to understand handful major coding styles"
- "Be coherent and mimic existing style"

## Typeglobs
Very interesting explanations about scopes (`my`, `local`, `our`, `packages`) passing functions as parameters or return values of functions.
It opens the door to the next chapter about "Dynamic Subs"

## Dynamic subroutines
A lot of black magic here about references, symbolic references, [Data::Constraint](https://metacpan.org/pod/Data::Constraint) (that I found pretty clever), Autoload, Autosplit.

Code samples are dirty: hacks + `goto` + `&{$AUTOLOAD}` + regex + `$1` + `$_` + `no stricts` + `$sub = sub` + `die` + `$_[0]`

But hey it's gory details, at some point if we want to understand all Perl internals...

And as I said it is really black magic! 

## Modifying and jury rigging modules
This chapter explains how to debug/patch modules.

For the record: 
- Local patch with very high version
- Redefine sub in caller code
- Wrap sub in caller code
- Subclass (if possible) sub in caller code 

## Configuring Perl programs
Various methods described:
1. Config in Perl code
2. Config in external Perl code (e.g. code.pl `require` config.pl)
3. Config in ENV vars
4. Command line args (via GetOpt or `perl -s`). Raku has MAIN
5. Config file (ini, yaml...)
6. Configure according to filename (modern trick like git-log)
7. Interactive questions (if interactive shell `-t STDOUT`)
8. Heavy config `use Config`

## Error reporting and logging
We don't really have exceptions in Perl, we have `eval` + `die` to simulate or `try`/`catch` coming into core right now but is it not universally used. The chapter details about sending and retrieving errors or propagating them.

Logging chapter presents some logging facilities and especially `log4perl` which is very powerful.

## Data persistence
Once again this chapter gives you pointers:
1. `pack`
2. [Data::Dumper](https://metacpan.org/pod/Data::Dumper) to serialize as string
3. YAML
4. [Storable](https://metacpan.org/pod/Storable)
5. DBM (not always portable if we use different driver)

Concerning serialization, I must add [Sereal](https://metacpan.org/pod/Sereal), ProtocolBuffer and Avro.
I think none of them existed when the book was released.

EDIT: some more... MessagePack, XDR :grinning:

## Working with bits and tied variables
Diving into functions "close to material" with `vec` or [Bit::Vector](https://metacpan.org/pod/Bit::Vector) an [Tie::Cycle](https://metacpan.org/pod/Tie::Cycle) or [Tie::BoundedInteger](https://metacpan.org/pod/Tie::BoundedInteger) etc...

## Modules as programs
Very nice trick with `caller()`

## Tricks in bulk
- `@{[ ]}` see [baby cart](https://metacpan.org/dist/perlsecret/view/lib/perlsecret.pod#Baby-cart)
- using `keys map` to untaint
- `WARN` is  signal!
- `L::*` (I think it's [like Local::*](https://pause.perl.org/pause/query?ACTION=pause_namingmodules#Local))
- `dualvar` for error for instance
- END blocks are executed after a `die`
- `$^E` for OS specific errors
- You can put perl code in log4perl conf
- [Data::Dumper](https://metacpan.org/pod/Data::Dumper) does not work for subs
- `vec` can be a lvalue
- `make disttest`, `make tardist`

## Citations
- "Humility is the principal virtue of a maintenance programmer"
- "Talk to your Perl therapist"

## Conclusion
While being imperfect (mainly due to the age of the book, ~~only one and last edition in 2007~~), [Mastering Perl](https://www.oreilly.com/library/view/mastering-perl/9780596527242/) is rewarding and teaches a lot of useful things from programming concepts to Perl details (more the latter actually).

I can recommend this book since I learned a lot of tricks :grinning:

