---
layout: post
title: The difficult road to Perl
date: 2022-02-03 15:39:50
---
Around 2010, I was in the middle of my CS studies and I was a pythonista. :clap: :snake:

![Python](images/getblu2zkitswfpaxbsn.jpg)

At that time, it was **python 2.6** dominating but some people were starting to use the new **python 2.7** :new:

**python 2** was far not as good as **python 3** is today (who have been impressively improved :scream:)... but it was so cool! And I loved it! 

Python language was *my* thing :heart:

## It was another era...
**python 3** was out but nobody was using it.

People were posting in forums, do you remember? :grin:

Python had still the reputation of not doing breaking changes.

![Lol](images/vuslhak5kxr9fex4exug.gif)

(only Ruby was assuming this mindset)

I think that list comprehension existed (looking at [python 2.0 changelog](https://docs.python.org/3/whatsnew/2.0.html#list-comprehensions)) but I don't remember using it (?).

It was possible to type `print "hello world"` without parenthesis... :+1:

I remember some pain points, like `easy_install`, `None` concatenation or UTF-8.

## Some python 2 pain points
First, there was no fstrings :scream: therefore you would fall often into the trap: `TypeError: cannot concatenate 'str' and 'NoneType' objects`

UTF-8 file encoding was not default then leading to this annoying error:
`SyntaxError: Non-ASCII character '\xc3' in file utf8.py on line 1, but no encoding declared;` (and commenting the line would not save you!)

The ["There should be one-- and preferably only one --obvious way to do it."](https://www.python.org/dev/peps/pep-0020/) was often more a curse than a blessing. It's terrible how you can spend 15 minutes on understanding a construction when you're just experimenting. 

And the toolchain...

## *"Perl?"* What a weird choice 
At that time I gave some talks and helped organizing [JM2L](https://jm2l.linux-azur.org/), an open source event organized by [Linux Azur](https://www.linux-azur.org/) near Cannes/Antibes (France).

![Linux Azur](images/h2hgyenypvmfom5xfdpr.png)

I remember contacting speakers (CFP) and in particular one email thread with a regular speaker. I was asking details about "his" free software, he told me it was in Perl. I hesitated... then asked him anyway:
- Why it is written in Perl, such a weird choice ?! 

(I really asked this way)

He answered me gently that "It was the language of choice when he started the project".

Long time later, I wonder even how I dared asking this question. It's judging, useless and not professional (even if we were not in a professional exchange).

At that time, I hadn't ever seen any line of Perl, I was judging, without any reason. 

I was just ANTI-Perl. One more soldier in the army of [Perl haters](https://dev.to/thibaultduponchelle/the-hate-of-perl-in-memes-469e).

![Perl WTF](images/r15jw4unakhmvp2nhj86.jpeg)

And I was so sure of myself and so sure that everybody shared the same evidence, that I asked this question.

This judgement is probably something that appeared and consolidated during my studies through contact with school friends (?) or communities of programmers in general (?)

Because in my older memory (1998-2008), my view of Perl was not so bad. I remember Perl having a reputation of hacker's choice, legendary coders, super heroes of command line and UNIX, smart but mad peoples. :sunglasses:

![Mad](images/xx2ip12gkonvhsq86rwj.png)

In a coder's mind, it was more something fascinating. 

I was seeing the community around Perl like a "sect" (e.g. mongers...) like the [Mandalorians](https://dev.to/thibaultduponchelle/perl-programmers-are-mandalorians-l0b).

![Mandalorian](images/7yc04wpgxswh12otxxm7.jpeg)

Mandalorians respect the creed!

## Introduction to Perl
Then I joined my job in 2013. I remember people studying me in the first days (they confessed they had looked for my name in Google before I joined). I had a first meeting with my team leader. He explained the very high level architecture of my department and technologies. 

- We have a lot of C, some bash and a lot of Perl...
- I don't know Perl at all, I said
- You will learn!

I was then introduced to Perl like this, *by constraint*.

I'm lucky enough since it became for years my language of choice and this was the first time I studied so deep programming languages principles, thanks to Perl but largely beyond Perl (hello Python :wave:, hello Ruby :wave:, hello Raku :wave:, hello [lsbasi](https://ruslanspivak.com/lsbasi-part1/) :wave:, etc...).

But even if I changed my view on Perl (proving that I'm open minded :wink: or just respecting the hierarchy :relieved:), I wanted to share how **the road to (learning) Perl is full of obstacles**. 

Please take a moment to think about it.

## I enjoy Perl
If you read my posts, you know that most of my current posts talk about Perl. It has several qualities that I cherish (stable, robust, [CPAN](https://metacpan.org/)...) that are maybe not super trendy in the current "ship fast and break things" world but talk to me.

And it is fun to write!

What I found in Perl was the freedom, less boilerplate and a very close integration in Linux. And also maybe a more "artistic" approach of programming.

But I consider myself as a polyglot programmer, [I don't call myself a Perl programmer](https://dev.to/davorg/don-t-be-a-perl-programmer-4h2d) (why would I do? It's not my first neither my last language). I enjoy it and I don't like how reputation is more important than actual qualities. This is something I liked between programmers, how we don't judge that much by appearance.

Today I do much more Python than Perl, and each time I switch from Python to Perl I see Perl defects (OOP, REPL, collections containers...) the same way when I switch from Perl to Python I see Python pain points (toolchain, strictness...), but luckily I enjoy much more the qualities than I suffer the imperfections! :grin::grin::grin:

Having dodged the python 2 to 3 migration frustration, and with all sweets of python 3, I'm still close to be a kind of pythonista somewhere inside but since I said "I'm not a Perl programmer" there is no reason I would consider myself as a "Python programmer" neither. And while I used, I'm using and I will use Python a lot for a long time, I can't say that I was ever *involved* in Python while it's clear that I *cared* about Perl :camel:
