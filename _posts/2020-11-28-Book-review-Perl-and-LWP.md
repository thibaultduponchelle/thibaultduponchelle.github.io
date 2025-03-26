---
layout: post
title: Book review "Perl and LWP"
date: 2020-11-28 10:56:49
---
![Perl and LWP](/assets/images/dmwkzfwpbcf04zhvbdna.jpg)

The book is available [online for free](http://lwp.interglacial.com)

Thank you a lot **O Reilly** and **Sean W. Burke** for that !

## Disclaimer
A lot of weaknesses of this book are due to the age but I won't refrain to report them with honesty :)

I'm very grateful to the person that took time to write this book : **Sean W. Burke** !

## Tell me about history
At the beginning, Sean reminds us a lot of LWP and webservers history and I personnally loved it. 

For my point of view, IT sciences are very sensitive to "technologies hypes" and things seems to go faster and faster these days (probably just an impression, I'm too young to judge) but I personnally love to read about history and oldies which created the present world.

Some people can think about this part as a weakness, but I definitely loved it.

## Gandpa 
Quickly we face some outdated websites :anguished:

Among other old stuff, you will have fun with **HTML code from 2002** like table with captiatlized tags : `<TD ALIGN=...` or `<BODY BGCOLOR="#aabbcc" BACKGROUND="img/bg.jpeg" ...` or again `<B CLASS="h3">`

Be prepared !! :grin:

![Old HTML](/assets/images/4o6ptx9c51iu9hli7nmi.jpg)

Some paragraphs from chapter 3 are dedicated to explanations about HTML forms elements like **textarea**, **submit** or **hidden fields** (not really outdated but I felt like a jump in the past :smiley:)

And what about **Netscapes 4.76** :confounded: used as browser (released in 2000).

![Netscape](/assets/images/fvh18ec6afhbbwx7kq0q.jpg)

Sometimes Sean is coding like my grandma (`regularize_hostname` to canonicalize hostname should be taken from a module, not coded by hand with regex). 

...This remark does not mean that I'm not coding like my grandma too ! :grin:

There is only one edition of this book and that's why it is so outdated :/

## Cool bits
Stop critics, let's look at cool things from this book.

I was very happy to learn that :
* LWP manages a chained list of responses objects that we can use to check all the redirection flow.
* We can't do HEAD request on some resources like a CGI (OK it's CGI... but interesting bit anyway)
* The spec for HTML comments is very weird 
* An attribute like `alt=bad dog!` (without quote) could be interpreted as a boolean...
* Comments are pseudo elements
* The difference between UserAgent and Robot (read robots.txt + handle sleep time)

And I enjoyed the detailed sections about :
* The parts of an URL
* The methods allowed

![Cool Man](/assets/images/zavk8bpyiyt14kp7q8d7.jpg)

Later the multiples sections about "reading the HTML" are interesting :
* Dig into HTML with regex :fearful: (pandas were harmed during the write of this paragraph, even if I know about this [famous post](https://stackoverflow.com/a/4234491) responding to this [other famous post](https://stackoverflow.com/a/1732454))
* Parsing sequentially  with HTML::TokeParser
* Parsing HTML with HTML::TreeBuilder and tree access (2020 recommended approach, eventually with another module)

As well as the details about dumped tokeparser `get_token` or `unget_token` and token sequences.

Or the parts about :
* Ordering of traversing
* Traversing recursively or by using a stack
* Modifying the HTML tree

Later, we finally have some chapters about web basics like **cookies** and **credentials** (basic).

The spider chapter is cool and appendix are interesting also even if it's only flat documentation.

I really like the mindset of Sean, UTF8 and unicode are well mentionned and pushed, Microsoft and their non standart politics are well adressed and I found very funny the reference to `All your pies are belong to us.` :smiley:


## Surprising 
Something surprising was to see **Sean** using suck.com (not related to anything NSFW) as a basis of an example. Bad choice in my humble opinion :smiley:


There is **A LOT** of retrieval of string in HTML using regex... :fearful:

The disclaimer is present but very light and does not mention that it’s brittle and limited (for correctness : not completely true).

I have no problem to do some dirty code  when we I do not need more that a quick-and-dirty implementation (no over-engineering for nothing)...

...but these days everybody is very touchy with HTML and regex :satisfied:

Seems also that **CSS selectors** were not in use in 2002 :/

![Alt Text](/assets/images/1mgt6ts8mavq0y0mj02d.jpg)

And finally the TPJ#17 article about OOP seemed for me totally off topic.

## Conclusion
I'm always a bit shy about using scraping because I feel like it's very brittle. I was hoping to see some advanced and robust webscraping methods in this book but it does not provides this at all.

I basically read the whole book without skipping any section (sometimes just went faster on the code samples) so it's still worth to read book !

You can get this and read it you will still learn interesting stuff but there are also probably some better alternatives today (I think about [Mojolicious Web Clients](https://leanpub.com/mojo_web_clients/) but I haven't read it right now).

