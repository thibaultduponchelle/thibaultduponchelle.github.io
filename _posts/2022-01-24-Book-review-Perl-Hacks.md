---
layout: post
title: Book review "Perl Hacks"
date: 2022-01-24 09:07:20
---
![Perl Hacks](/assets/images/m4q06jhyy9b6d3eyq0x6.jpg)

# Intro
[Perl Hacks](https://www.oreilly.com/library/view/perl-hacks/0596526741/) is not a book like you're used to read. It's not a [tutorial](https://www.oreilly.com/library/view/learning-perl-8th/9781492094944/) or developing a topic like [network programming](https://www.oreilly.com/library/view/network-programming-with/0201615711/). It's even not [a selection of blog posts](https://perlschool.com/books/the-best-of-perl-hacks/).

It's a collection of 101 tricks for Perl developers from *programming masters*. To improve your daily life, your programming skills or your "Perl fu".

I'm a big fan of [Chromatic](https://en.wikipedia.org/wiki/Chromatic_(programmer)) and its [Modern Perl](http://modernperlbooks.com/) which I consider a masterpiece. I'm shy to have no review of it on this blog, one day maybe.

[Perl Hacks](https://www.oreilly.com/library/view/perl-hacks/0596526741/) starts with a presentation of authors (there is 3 main ones + plenty of well known Perl community members). It is really nice and make me think of the recent [Highlighting members of the Perl family](https://dev.to/mjgardner/highlighting-members-of-the-perl-family-1kgi) from [Mark Gardner](https://dev.to/mjgardner) :grinning:

The book is not for beginners. It is old and some hacks are outdated because of this. And finally some hacks are just not interesting but this is really a tiny portion of the 101 hacks.

# Productivity Hacks
It starts smooth with less known **perldoc** arguments (do you know that you can "search" the perldoc with `-q`)

Ever heard about [Pod::Webserver](https://metacpan.org/pod/Pod::Webserver)?
![podwebserver](/assets/images/fa5d7882efofx66qby6x.png)

There are hacks for enlightened users of vim or emacs like testing syntax on file saving, fix indent, run tests...

# User Interaction Hacks
It's fun how the first hack is exactly something that I coded myself in the past (Perl static site generator).
![Mind blow](/assets/images/blow-mind-mind-blown.gif)

The next tricks are real life problems (make interactive programs silent when not interactive) or use `prompt` for better prompts (lists, hierarchical menus...)! It's expanded later into the usage of [ExtUtils::MakeMaker](https://metacpan.org/pod/ExtUtils::MakeMaker) (when a module needs to ask user for informations).

It's great how each contributor came with its area of expertise... Like the [SDL](https://www.libsdl.org/) introduction by Guillaume Cottenceau. Yes... the guy behind [Frozen-Bubble](http://www.frozen-bubble.org/)!

![Frozen Bubble](/assets/images/5k8gm1ajabinwhq1tsw5.png)

And finally a nice [HTTP::Proxy](https://metacpan.org/pod/HTTP::Proxy) trick.

# Data Munging Hacks
"A little subtlety, style and finesse and you can write easy-to-understand code that's just as powerful as the wild-eyed forge-ahead-at-all-costs just-do-the-job code."

Slurping and tying CSV files into Perl arrays, spreadsheets portability or reading file backwards (simple but not simple).

I discovered [SQL::Library](https://metacpan.org/pod/SQL::Library) which is interesting concept (does a language portable version of this exists?). 

Of course SQL statements bindings are introduced (hello [little Bobby](https://bobby-tables.com/) :wave:) with the `NAME_lc` trick (read the book to know what it is :stuck_out_tongue_winking_eye:).

It ends with iterator and `wantarray`.

# Working With Modules Hacks
Aliasing package names, PERL5LIB, `use lib`, configure, sitecustomize, reload modules, modules bundles, trace modules (code reference in `@INC`)... So much fun!

This is EXACTLY for these kind of "hacks" that I was eager to read this book (I think some of these hacks have leaked and I fall on these somewhere :D).

Monkey Patching external modules is a morally questionable hack but still interesting. I learned that `die` is often better than `exit` since `die` can be caught.

The hack "Drink to the CPAN" is... original... to say the less :grin:

Hacks about packaging with PAR.

One hack is more "social": a complete walk-through about how to be a good open source bug reporter.

# Object Hacks
Hacks about Oriented Object Programming like attributes, true private methods dealing with typeglob (this hack is totally mad!), auto declare arguments or auto generate accessor, access control, polymorphism.

I think I leaned somewhere in this chapter the `$" = "]["` trick which I found very cool.

# Debugging Hacks
Some debugging hacks from basic ones (`perl -c` or bracketing your variables in your printf debugging sessions) to more intermediate things like using tests cases or [Smart::Comments](https://metacpan.org/pod/Smart::Comments) (great!) or extend stacktrace on error (or deparse/name anonymous subs) or even customize the debugger.

# Developer Tricks Hacks
This sections provides hacks at module level (segregate tests, helper script to rebuild a module, run tests automatically or print test failures in color).

Beware of the fact that studying [ExtUtils::MakeMaker](https://metacpan.org/pod/ExtUtils::MakeMaker) source code will make you "wake up fully clothed and shivering in the shower several hours later".
![Shivering](https://media1.giphy.com/media/xT0xeHkthod39vab0k/giphy.gif?cid=ecf05e472k2phd1y0e0cg4bwwc28dm8ln9znist60nuer9dn&rid=giphy.gif&ct=g)

In previous chapter, *closure* were introduced, now it's time for the another cool programming feature *memoize*! (and [Ackerman function](https://en.wikipedia.org/wiki/Ackermann_function)).

Some other hacks concern building Perl from source and using a file watcher to constantly run tests :+1:

# Know Thy Code Hacks
It starts with PHASES (you know BEGIN/END/CHECK...) then continue with dump, `corelist` and tracing core modules (*survival* must have hacks).

This is probably the most "sysadmin" chapter:
"For sysadmin, stability is a way of life, not a goal" and "We are in the golden age of Perl testing".


Other hacks are about typeglobs (find them) or Backend compiler collection ([B::Concise](https://metacpan.org/pod/B::Concise) or [B::TerseSize](https://metacpan.org/pod/B::TerseSize)) or [Devel::SymDump](https://metacpan.org/pod/Devel::Symdump), very interesting!

An interesting (but I bet outdated) hack introduces [PersistentPerl](https://metacpan.org/pod/PersistentPerl).

Actually more you advance in the book and the less there is to trash, 30 last hacks are just all competing being more mad than each others!

![Fireworks](https://media3.giphy.com/media/VkoJ9yd1VOePal8KyY/giphy.gif?cid=ecf05e47irm0zv09i28l1zmdp30z6wb57holgeed2gaz46jj&rid=giphy.gif&ct=g)

Trace ops...
Write your own warnings....
Dualvar...
Play with soft and hard refs...
Lock hash keys (prevent autovivication)...
Replacing CORE sub...
Contextual return value...
Active values...
[List comprehension](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions) in Perl...
Add your own Perl syntax... ("Although Perl is not perfect, it is Perfectable")
Use shared library...
Calculation with intervals...
Operator overload... :dizzy_face: ("Perl is a operator-oriented language" -> behavior of datas depends on what ops you decide to perform on them)

It's sweet nectar. :heart_eyes:

It ends with an advice on deobfuscation of [JAPHs](https://en.wiktionary.org/wiki/JAPH#English)

If you read so far, it's clear that you're *just another Perl hacker* too! :camel:




