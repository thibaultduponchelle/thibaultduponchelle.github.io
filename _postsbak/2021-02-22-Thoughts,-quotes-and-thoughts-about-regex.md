---
layout: post
title: Thoughts, quotes and thoughts about regex
date: 2021-02-22 08:57:46
---
# Regex
**"Regex"** is the small name of [Regular expressions](https://wiki.c2.com/?RegularExpression)

**Regex** are one of the superpowers :muscle: of [Perl](https://www.perl.org/)
![Perl <3 Regex](images/tioynjfepr3j7qzxdixr.png) 

It's a *productivity* superpower the same way knowing command line shortcuts and mastering vim.

**Regex** could become one of *your* programmer superpowers also if you decide to.
![True power](images/274xka2o0faorfaj6zcw.jpg)

But "regex" have also a *nefarious reputation* because they are hard, error-prone and misused.
![100](images/4byfxbmyiwtic0sxya4h.png)

[Damian Conway](https://en.wikipedia.org/wiki/Damian_Conway) is a master of regular expressions but you can sometimes feel the pain in his mouth when he discusses regex
![Pain](images/j0le639s5pcr5vlqnk5t.png)

Or even
![Misery](images/r4kxkfi0pxcx0scc2g73.png)

But on a more positive note, Damian said
![WrongButGoodEnough](images/dv7a0xj0i80do0796esf.png)

It could be strange to advocate a *wrong thing* but sometimes you just don't need more than a one shot program, and for me it would be dumb (or irresponsible) to spend more time than needed just **"for the sake of correctness"**.
![David Goodenough](images/1ckek441gz594l4hjhvj.jpeg)

I know it's not really the hype of these days where over engineering is better perceived than KISS principles (I exaggerate just a little) but it is pragmatism.

# Regex are bad
Regex are bad, everybody knows, and here is the very famous [SO answer "You can't parse [X]HTML with regex"](https://stackoverflow.com/a/1732454) about that :grinning: 
![Idiot](images/fghx6z9n1duiha62sfnz.jpg)

# Are they really?
Some people have played the "devil's advocate" and came with regex for XML like this [great answer from Tom Christiansen](https://stackoverflow.com/a/4234491) where he used regex to tokenize then Perl to parse.

But even **Tom Christiansen** said 
![Should](images/3gztnahxug1iev81axau.png)

Seems also like **PCRE** are *more* than simple regular grammars but actually I can't say if mathematically **Perl regex** can or can't parse XML, [regular expression page on wikipedia](https://en.wikipedia.org/wiki/Regular_expression#Patterns_for_non-regular_languages) says that 
![Regular not regular](images/2qef7xde37bme6twmawb.png)

Another interesting old link on this topic is [REX](https://www2.cs.sfu.ca/~cameron/REX.html). The abstract of it is 

***The syntax of XML is simple enough that it is possible to parse an XML document into a list of its markup and text items using a single regular expression. Such a shallow parse of an XML document can be very useful for the construction of a variety of lightweight XML processing tools***

(I do not quoted this one on a picture since I'm too afraid to awake Cthulhu)

# Then what are regex *recommended* for
While use of complex regex are subject to discussions, there are perfect and obvious use cases for regex:
* Validation of input
* Cleaning of input
* Restructuring of input
* Looking for substrings within input

# Folklore
I discussed about ***WrongButGoodEnough*** regex that help you save the world on a Friday evening:
![Save](images/kogecvqvo2s12dtohfbw.png)

But writing regex is hard to master and you probably don't
![Trial](images/158rcsp35vv6mjmeua2i.jpg)

One solution is to leave your cat typing the regex for you!
![Cat regex](images/pk17xzza4meohq74aop6.png)

# Perl folks are crazy about regex
I wanted to finish with this crazy fact, fasten your seat belts.

Perl folks are really serious about regex
![Serious](images/z48um17vo69q3k5bvdaj.png)

This is mad.

