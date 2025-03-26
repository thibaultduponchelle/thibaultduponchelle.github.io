---
layout: post
title: "Perl in 2025" FOSDEM video review 
date: 2021-02-25 15:04:53
---
Once again, I have to talk you about [Paul "Leonerd" Evans](http://leonerds-code.blogspot.com/) :smiley:

He is the author of the video that I will review now and I have to say first that I consider that we are lucky to have such brilliant guy in Perl community :+1: :muscle:

The video is titled [Perl in 2025](https://fosdem.org/2021/schedule/event/perl_in_2025/) and is actually a list of **open questions** about Perl new operators in near future.

Leonerd goes a bit fast, but I really enjoyed the video.

# isa, signatures
I won't discuss this part, it is stable and coming in the core soon, but he explained these things, and it was very clear.

# Smart match
I started Perl when smart match (`~~`) was already around (and already not recommended to the usage). 
![Smartmatch](images/cu9qj9g74hz6ivcuxpf7.jpeg)

I used them a bit (I was young and bold at that time :grinning:) then quickly followed the recommendations and forbid myself to use them.

**But what were my needs to use smartmatch?**

First, it was to emulate **"is in"** ("Is this value in this array?"). Yes it can be done with other operators or CPAN module but `~~` seemed so short and elegant...

Second, as explained by Paul, another *hidden* usage of `~~` is internally in `given/when` construction (that I don't used so much at the end).

I would actually have loved to continue to use smartmatch, but I'm a prudent programmer so one warning was sufficient to make me run away and totally forget about this construction :joy:

# Sharpy equalities
Leonerd then discusses also about new operators `equ` and `===` that I unilaterally decided to name "nervous equalities" or "sharpy equalities" (maybe it sounds terribly bad, but yes I'm not a native english speaker :grinning:).

The need for them comes from smartmatch (watch the video to know why!) but extends to simplify basic comparisons (`if(defined $var and $var eq "perl")`).

It appeared to me to be at first a very sharp usage, but finally it seems very cool:
```perl
if("" eq undef) { # it is true
    ...
}
if("" equ undef) { # it will be false
    ...
}
```

The same way with numeric `===`:
```perl
if(0 == undef) { # it is true
    ...
}
if(0 === undef) { # it will be false
    ...
}
```

# any and in
`any` and `in` would cover the need (dig into lists) that I previously mentioned.

Leonerd presents in as a possible metaoperator that you can "parametrize" to choose how it behaves (a bit crazy in a [Raku way](https://docs.raku.org/language/operators#Metaoperators)).

By detailing `any`, `in`, `given/when`, and friends, I understand the difficulty it was to properly implement smartmatch (that contains all these things).

# Multi dispatch
The same way, "multi dispatch" makes me think again of Raku which is amazing on this.

I wondered what dispatch mechanism was already implemented in Perl, since we already have a notion of [Method Resolution Order](https://perldoc.perl.org/mro). The answer is that there is dispatch mechanism but limited to Oriented Object Programming.

**What if we try to do multi sub dispatch in the same package?**

With prototypes, if you try something like:

```perl
sub a() { print "a\n"; }
sub a($) { print "aa\n"; }
```
Unfortunately you will get an error:
```perl
Prototype mismatch: sub main::a () vs ($) at multi.pl line 2.
```

With signatures, if you try something like:
```perl
use v5.20;
use feature qw(signatures);
no warnings qw(experimental::signatures);

sub b() { print "b\n"; }
sub b($arg) { print "bb\n"; }

b();
b("myarg");
```

The latest declaration will override the previous one and you can get `Too few arguments for subroutine` or `Too many arguments for subroutine` depending the order you declared the `sub b`.

@mjgardner (and others) do not hesitate to correct me, you master better than me all these things.

You can still use the flexibility of Perl and handle dispatch inside the `sub`, but it is not properly *native* dispatch.

Back to the MRO (Method Resolution Order), [Perl MRO](https://perldoc.perl.org/mro#NAME) is by default implemented using [DFS (Depth First Search)](https://en.wikipedia.org/wiki/Depth-first_search) but can be configured to use [C3](https://en.wikipedia.org/wiki/C3_linearization) from the [CPAN module C3](https://metacpan.org/pod/Class::C3).
Python or Raku use C3 algorithm as default impementation.

Then as a summary, Paul discusses about adding **multi dispatch** (i.e. **method overriding** or **polymorphism** in the same package) and he proposes implementations based on `signatures`, `isa` and `is` (that I do not talked but `is` is a part of possible new ops).

My thought is... It would be nice! :smiley:

# All things together
This is a great talk, that opens the door to discussion and implementations.

![All](images/npqkx3kim0zypdjwhdbg.png)

As a conclusion, thank you again **Leonerd**!

That was the last time I talked about you... for today :grinning:




