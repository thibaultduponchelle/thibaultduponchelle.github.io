---
layout: post
title: Book review "Advanced Perl programming"
date: 2022-01-10 12:33:56
---

![Advanced Perl Programming](/assets/images/fbiqenfto5d5vh6g43o6.jpg)

[Advanced Perl Programming](https://www.oreilly.com/library/view/advanced-perl-programming/1565922204/) is a book from **Sriram Srinivasan** published in 1997 (ouch!).

It's old, if you're a Perl *newcomer*, don't read such old books (in addition that this book is not adapted to your level).

There is a [second edition](https://www.oreilly.com/library/view/advanced-perl-programming/0596004567/) of this book but it seems a totally different book (different author). Also the [Advanced Perl Programming: From Advanced to Expert](https://www.oreilly.com/library/view/advanced-perl-programming/9781484258637/) from **William Bo Rothwell** seems a completely different book.

**Advanced Perl Programming** is old but interesting... but I have to admit that it is not consistent in quality.

I think this book is for "hardcore Perl programmers" :grinning:

## Start of the book
The first chapters talk about Perl internals from a Perl developer point of view: references, symbolic refs, reference counting, symbol table, anonymous subs and closures. 

It continues with advanced Perl topics (eval and modules).

These chapters give an overall feeling of cleanliness and deep research from author. Each notion is compared to other programming languages (Java, C++, Tcl) which is VERY interesting. In short I loved these chapters.

It makes me think the author is a senior developer and has made a nice research work :)

## Middle of the book
I really less appreciated this part, it's about Object Oriented Programming, interfaces, persistence, templating... But if topics seem cool, it has flaws, it's based often on big pieces of imaginary code (not on CPAN) and/or old technologies. I can't say it's bad, but I definitely less enjoyed this part because also the style. Overall I think it's harder to follow because the ordering where code snippets are introduced is rough (e.g. The tetris chapter). 

There are still interesting things to pick up in the middle of this, e.g. I enjoyed the chapter about "Tie" (chapter 9) and Persistence (chapter 10).

## End of the book
Starting chapter 18, we are back to Perl internals (perl *interpreter* internals this time). Personally I'm interested in this and I found this part really great. 

## Interesting bits in bulk
* "Variable suicide"
* I discovered there was a ".plc" initiative (to pre-compile perl scripts "a la" python .pyc)
* I heard for the first time the word "Impedance mismatch" (OOP)
* When you give a reference as parameter of a function, it is not an optimization
* Symbolic references only works for global variables
* Symbolic references does not increase ref count

## Citations
* Perl is an highly idiomatic language (and it is both good and bad)
* Don't sit here and complain, do something! (yet another Perl motto)
* It would be an ideal world if we never had to worry about fatal bugs, power failures or end users (Byte Mag)
* A good tool is one that is used in ways its developers never thought of (Brian Kernighan)