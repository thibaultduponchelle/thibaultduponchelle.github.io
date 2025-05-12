---
layout: post
title: Back from the PTS 2025
date: 2025-04-30 18:18:32
---
I'm just back from the [Perl Toolchain Summit 2025](https://perltoolchainsummit.org/pts2025/)!

It was fantastic!

![group](/assets/images/pts2025/group.jpg)

"The Perl Toolchain Summit (PTS) is an annual event where we bring together the volunteers who work on
the tools and modules at the heart of Perl and the CPAN ecosystem" (source: [sponsor prospectus](https://perltoolchainsummit.org/pts2025/PTS2025-Sponsor-Prospectus.pdf))

Its characteristics is to be a _private_ event ("invite only") that is _sponsored_ by companies. 
(at least that's the successful recipe for the most recent years)

![tib](/assets/images/pts2025/tib.jpg)

During 4 days, vital maintainers of Perl toolchain are grouped together in order to exchange, know each others, speed up implementation of some important changes or agree on "consensus" (e.g. LTS or metadatas). 

People joining the event are active outside the event all along the year, recharging battery and motivation during event. They go back home with a TODO list well filled :) 

## The conference/hackathon
I got a bit of a shock during my first hours.

First about the brilliant people there and how reachable they were.

![stickers](/assets/images/pts2025/room.jpg)

The previous picture was taken before it goes more into a messy "hackathon" style with 5 or 6 tables 

![table](/assets/images/pts2025/hackathon.jpg)

^ One of the "tables", here the "table PAUSE" on Thursday.

Second about the geekiness: I never seen so many geek per square meter :D

The stickers

![stickers](/assets/images/pts2025/stickers.jpg)

And goodies

![goodies](/assets/images/pts2025/goodies.jpg)

People brought so great setups (multiple screens, various devices...) where I use to travel the most empty as possible... It impressed me.

Also, if not all people had the same level of knowledge, almost everyone was *very* experimented and have a minimum common base even out of their area of expertise. It made the discussions always valuable up to sometimes epic.

My personal planned focus for this summit was like this:
- [Test::Smoke](https://metacpan.org/pod/Test::Smoke)
- [CPAN Security](https://security.metacpan.org/)
- [PAUSE](https://pause.perl.org/) and [MetaCPAN](https://metacpan.org/)

But I wanted to focus on networking and brainstorming rather than purely technical delivery. It's something that was advised to me by veteran PTS folks ([NEILB](https://metacpan.org/author/NEILB) and [BOOK](https://metacpan.org/author/BOOK)).

## Day 1
On the first day, we did a "presentation" standup, where people expressed their plans for the summit.

I choosed to pick the first "presentation" slot and later on the day I delivered 3 talks: 
- [Hello I'm Tib](https://thibaultduponchelle.github.io/talks/talk-pts-2025-hello-im-tib/)
- [Answering questions about CPAN that nobody asked](https://thibaultduponchelle.github.io/talks/talk-tprcic-2021-answers-to-cpan-questions-that-nobody-asked/)
- [Answering questions about CPAN that nobody asked - the sequel](https://thibaultduponchelle.github.io/talks/talk-pts-2025-answers-to-cpan-questions-that-nobody-asked-the-sequel/)

![stickers](/assets/images/pts2025/presenting.jpg)

Retrospectively, I think:
1. It allowed me to do my introduction, and to share a bit of my vision
2. Items presented were totally in scope of PTS
3. It spread topics to everyone to think about (with or without me) for the rest of the summit

It also means I isolated for some time before (final preparations) which was not great (but I had to).

After my presentations, I preempted quickly [OALDERS](https://metacpan.org/author/OALDERS) for a quick sync to get his insights on some "indexes" oddities (being related to MetaCPAN API or MetaDB).

I went outside to synchronize with [SJN](https://metacpan.org/author/SJN/) from CPANSec and speak about SBOM.

I reached the "[PAUSE](https://pause.perl.org) table" ([ANDK](https://metacpan.org/author/ANDK), [ISHIGAKI](https://metacpan.org/author/ISHIGAKI) and [SREZIC](https://metacpan.org/author/SREZIC)) for "pushing" some issues/PRs.

- [GET URL: HTTPS is now supported](https://github.com/andk/pause/pull/550) (related to PAUSE uploads)
- [Update PAUSE Operating Model for giving up first-come permissions](https://github.com/andk/pause/pull/551) (related to [namespace vacuum](https://security.metacpan.org/docs/cpan-dependency-confusion.html#namespace-vacuum))
- [Do not index Local:: namespace (nor Local)](https://github.com/andk/pause/pull/541) (related to [reserved namespaces](https://security.metacpan.org/docs/cpan-dependency-confusion.html#reserved-namespaces))

I discussed the "Admin permission" and we decided to keep the statu quo on that.

I demoed my local PAUSE (dockerized) that makes handy the dev/audit/test of PAUSE and also avoid hurting production PAUSE for testing purposes. 

The next day, all my pull requests were merged, the PTS did its magic! :) 

## Day 2
Everything accelerated on this day.
 
First we brainstormed with [GARU](https://metacpan.org/author/GARU) to find an improvement (if possible) to the river algorithm to be sent to [NEILB](https://metacpan.org/author/NEILB)

I worked with [ELBEHO](https://metacpan.org/author/ELBEHO) and [BOOK](https://metacpan.org/author/BOOK) on polishing the [PTS prospectus](https://perltoolchainsummit.org/pts2025/PTS2025-Sponsor-Prospectus.pdf).

[CPAN Patch Tooling](https://github.com/orgs/CPAN-Security/projects/11/views/1) was one of my other big topic of the day. I sat aside [TINITA](https://metacpan.org/author/TINITA) to get insights on [cpan-meta](https://github.com/perlpunk/cpan-meta) and slurp its overall expertise in packaging and "layer of patches". 

Later, I paired with [ATOOMIC](https://metacpan.org/author/ATOOMIC) to look at [CPAN::Distroprefs](https://metacpan.org/pod/CPAN::Distroprefs) (that I plan to use for a CPAN Patch Tooling "Proof Of Concept"). Several people intervened (e.g. [LEONT](https://metacpan.org/author/LEONT), [TODDR](https://metacpan.org/author/TODDR)), it was great!

[PEVANS](https://metacpan.org/author/PEVANS) delivered a talk about signatures, classes and roles in Perl.
It was complex, in term of syntax and object oriented concepts. But some people were more confortable than me and it triggered several questions and discussions.

Then we did 2 CPANSec meetings:
- One about organization things
- Second with external people (with other CNAs, Greg Kroah-Hartman from Linux Kernel was there) 

We ended the day with a "sponsored meal" being altogether in a private restaurant room. It was probably the most typical german diner and a very lively one. I was sit close to [ARISTOTLE](https://metacpan.org/author/ARISTOTLE), [TIMLEGGE](https://metacpan.org/author/TIMLEGGE) (my "twin brother of the day"!) and [SIMBABQUE](https://metacpan.org/author/SIMBABQUE) to only cite some of them.

## Day 3
Saturday started with [Test::Smoke](https://metacpan.org/pod/Test::Smoke), finally!

I'm the maintainer after [ABELTJE](https://metacpan.org/author/ABELTJE) passed away and it is actually one of my priorities. 

With [HMBRAND](https://metacpan.org/author/HMBRAND) (creator of [Test::Smoke](https://metacpan.org/pod/Test::Smoke) and perl core porter) we initiated the discussion about deprecating dual testing of PerlIO/StdIO in core smoke testing. Having [LEONT](https://metacpan.org/author/LEONT) right there, we were able to clarify and reach a consensus about that: "it will happen".

I demoed also quickly my start of a (Linux  focused) [Test::Smoke](https://metacpan.org/pod/Test::Smoke) farm.

Later I joined the MetaCPAN table for discussion with [MICKEY](https://metacpan.org/author/MICKEY) and [HAARG](https://metacpan.org/author/HAARG) around indexes and in particular [Acme::Not::Indexed](https://metacpan.org/release/CONTRA/Acme-Not-Indexed-0.01).

[INGY](https://metacpan.org/author/INGY) delivered a talk about [YamlScript](https://yamlscript.org/), again several questions and discussions.

I tested the merge of my change [Do not index Local:: namespace (nor Local)](https://github.com/andk/pause/commit/5e04e74bd21db0f4e3417bd3e007578d1f4fb422) by PAUSE table. I did it with [Local::No::Longer::Indexable](https://metacpan.org/release/CONTRA/Local-No-Longer-Indexable-0.01). I discovered that it has a connection with [Acme::Not::Indexed](https://metacpan.org/release/CONTRA/Acme-Not-Indexed-0.01) discussion.

## Day 4
On Sunday, I wanted to continue on [Test::Smoke](https://metacpan.org/pod/Test::Smoke) and do more "hacking".

I discussed quickly with [HMBRAND](https://metacpan.org/author/HMBRAND) since he's doing some Proof Of Concept to send reports to future CPANTesters infrastructure.

I started to implement a patching facility (using an hypothetical `smokecurrent.patches` and a `patches/` directory) inside [Test::Smoke](https://metacpan.org/pod/Test::Smoke). Right now, you can already emulate that use case easily for instance with fork+branches (syncer "git" or "snapshot") or patching first (syncer "copy")... But TIMTOWTDI and local patching can be slightly more handy for some use cases.

In parallel, I spent some time on Perl logo, changing the logo of [perlres](https://github.com/thibaultduponchelle/perlres).

Then proposing the [081](https://github.com/metacpan/perl-assets/pull/20) ("gradient without medallion") to the official repository of assets.

![081](/assets/images/pts2025/081.svg)

I also spent some time pushing more websites to use the new logo (e.g. [PR#2169](https://github.com/shogo82148/actions-setup-perl/pull/2169) for [action-setup-perl](https://github.com/marketplace/actions/setup-perl-environment))

![exercism](/assets/images/pts2025/action.png)


Or [PR#192](https://github.com/exercism/website-icons/pull/192) for exercism.io that was quickly merged). 

![exercism](/assets/images/pts2025/exercism.png)

On sunday, [BOOK](https://metacpan.org/author/BOOK) and [SJN](https://metacpan.org/author/SJN) did record a podcasts and I was interviewed by [BOOK](https://metacpan.org/author/BOOK) with [HMBRAND](https://metacpan.org/author/HMBRAND) to talk about [Test::Smoke](https://metacpan.org/pod/Test::Smoke). I think we well covered the topic :)

[PJCJ](https://metacpan.org/author/PJCJ) came to me (thank you!) and we discussed [Devel::Cover](https://metacpan.org/dist/Devel-Cover), gcov in perl core and the (defunct) [kritika.io](https://web.archive.org/web/20210415180423/https://kritika.io/) and [Devel::Cover::Report::Kritika](https://metacpan.org/pod/Devel::Cover::Report::Kritika).

Finally, [STIGTSP](https://metacpan.org/author/STIGTSP) and [LEONT](https://metacpan.org/author/LEONT) shared with me some hardening TODO items or WIP pull request for PAUSE and I accepted to handle some and help for others.

## /me and the venue
When I arrived on site on Wednesday 30 april, but late (around midnight). I was immediately welcomed by some night owls in the lobby.

I did not know that at that time, but the lobby was about to become a very important place of the summit where people would gather before going outside for lunch or for long discussions around Perl technical or social stuff.

The next day, I discovered the conference/hack rooms where we would spend 9AM to 7PM (at least).

![venue](/assets/images/pts2025/venue.jpg)

From the outside, it looks like very much a peaceful environment.

![peaceful](/assets/images/pts2025/serenity.jpg)

A little hedgehog seemed to have the same positive opinion and was visiting us regularly. 

![hedgehog](/assets/images/pts2025/hedgehog.jpg)

Back to commodities, we got a great breakfast offer to start.

![breakfast](/assets/images/pts2025/breakfast.jpg)

All along the day, catering was at disposal, which allowed us to (re)charge energy for intense brainstormings!

![catering](/assets/images/pts2025/catering.png)

Side effect, it enabled the possibility to skip lunch if we wanted to.

But we also had opportunities to lunch altogether (e.g. it happened on Thursday).

![lunch](/assets/images/pts2025/lunch.jpg)

## Walking around the venue
During the summit, in little groups, we did some quick exploration around the venue.

![archi](/assets/images/pts2025/narrow.jpg)

And

![archi](/assets/images/pts2025/archi.jpg)

I pictured a few random buildings that I considered nice

![art](/assets/images/pts2025/art-wall.jpg)

Or again

![art](/assets/images/pts2025/art-wall-2.jpg)

I went for quick shopping at Red Bull Leipzig store to make gifts to family and friends.

![rbl](/assets/images/pts2025/rbl.jpg)

Or our Saturday evening restaurant

![art](/assets/images/pts2025/bahnhof.jpg)

As a constant, portions were very generous and we enjoyed that they have their brewery

![art](/assets/images/pts2025/bahnhof-2.jpg)

Proof of the good atmosphere, people frequently switched from one group to another. 

There's folks (that I did not cite so far) and that I enjoyed the company like [FERKI](https://metacpan.org/author/FERKI), [INGY](https://metacpan.org/author/INGY) and [MITHALDU](https://metacpan.org/author/MITHALDU)  without actually not that much interacting on technical topics in the end.

And sometimes, like on Sunday, we ate altogether. For the record, we choose a Doner where Angela Merkel did visit in the past!

![angela](/assets/images/pts2025/angela.jpg)

Also, for the record, German people were friendly with us all during the summit.

## Conclusion
I had a fantastic time at PTS. 

There were 33 attendees with 5 first-timers (I was one of them).

Everyone was very nice and available. I learned a lot, made connections and tried to speak to everyone.
Now, I even more consider this event vital for Perl sustainability and all companies using the language.

I had a great time well beyond the primary focus of technical work.

A huge thank you to organizers [BOOK](https://metacpan.org/author/BOOK), [ELBEHO](https://metacpan.org/author/ELBEHO), [TINITA](https://metacpan.org/author/TINITA), [GARU](https://metacpan.org/author/GARU), [DBOEHMER](https://metacpan.org/author/DBOEHMER)

## Monetary Sponsors

[Booking.com](https://www.booking.com/), [WebPros](https://www.webpros.com/), 
[CosmoShop](https://www.cosmoshop.de/), [Datensegler](https://datensegler.at/), 
[OpenCage](https://opencagedata.com), [SUSE](https://www.suse.com/), 
[Simplelists Ltd](https://www.simplelists.com/), [Ctrl O Ltd](https://www.ctrlo.com/), 
[Findus Internet-OPAC](https://www.findus-internet-opac.de/), [plusW GmbH](https://www.plusw.de/)

## In-kind sponsors

[Grant Street Group](https://www.grantstreet.com/), [Fastmail](https://www.fastmail.com/), 
[shift2](https://en.shift2.nl/), [Oleeo](https://www.oleeo.com/), [Ferenc Erki](https://ferki.it/)

## Community Sponsors 

[The Perl and Raku Foundation](https://www.perlfoundation.org/), [Japan Perl Association](https://japan.perlassociation.org/), 
Harald Joerg, Alexandros Karelas [PerlModules.net](https://www.perlmodules.net/),  Matthew Persico,
Michele Beltrame [Sigmafin](https://www.blendgroup.it/), Rob Hall, Joel Roth, Richard Leach, 
Jonathan Kean, Richard Loveland, Bojan Ramsa






