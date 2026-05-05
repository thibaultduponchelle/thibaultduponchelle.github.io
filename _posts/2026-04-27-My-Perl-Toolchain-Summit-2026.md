---
layout: post
title: My Perl Toolchain Summit 2026
date: 2026-04-27 00:18:32
published: true
---

![](/assets/images/pts2026/group.jpg)

I had the privilege to go for a second time to the [Perl Toolchain Summit](https://perltoolchainsummit.org/pts2026/). 
Actually, I was involved into the organization of it, but I almost left this hat at home during the event, since they were many other helping hands and I felt my pair of hands was not needed for this :)

The event happened in Vienna, which is a very enjoyable place from what I was able to visit (very little to be honest).

I went to the event with the objective to be more focusing on [Test::Smoke](https://metacpan.org/dist/Test-Smoke) this year (for which I'm maintainer) and Perl core topics. And doing that, accepting to be less involved in [CPANSec](https://security.metacpan.org/). 

I ended achieving my primary goal (working on Test::Smoke), did honest job in my second (Perl core) but mainly passively and listening to more experienced hackers. It was at the costs of neglecting a bit CPANSec even if I still did significant contributions (read below) and had discussions in security related topics. 

But hey, that's the fate of being involved in multiple topics.

## Day 1
The first day, the main room started to fill with several Perl hackers.

![](/assets/images/pts2026/group-day-1.jpg)

Philippe Bruhat did [his welcome talk](https://blogs.perl.org/users/book/2026/04/welcome-to-the-perl-toolchain-summit-2026.html) introducing new participants, sponsors, organizing team, most regular attendee and croissants!

Then the hackathon started.

![](/assets/images/pts2026/group-day-1-b.jpg)

(there were more than one room)

## My day 1
### PAUSE/CPANSec
At the very beginning, I did pairing with Tina and Andreas on topic of PAUSE:
- Showing docker pause (Domm later in the event shared it's own setup, with more up to date code)
- Showing nasty YAML payloads and reviewing a bit, what a luck having such YAML expert (!) 
- Test uploading with local PAUSE

Andreas merged a security patch (["rand rand rand rand"](https://github.com/andk/pause/commit/6834b4903c8655f2931ca560f71f39d99c78747a) as we nicknamed) that I did (but was ordered last year by CPANSec) to harden randomization of reset tokens.

### Test::Smoke
Then I started to stick to my objective and moved to Test::Smoke!

First I did check what non core modules are used by Test::Smoke and discussed with Tux if it could be problematic. 
We came to the conclusion that it was not.

Still, I experimented some non core modules removal and weird setup (HTTP::Daemon without LWP) to see impact on Test::Smoke. 

Then I looked at the queue of issues of Test::Smoke for doing fixes, investigated [posting issue](https://github.com/Perl-Toolchain-Gang/Test-Smoke/issues/21) and some other issues.
After a few fixes (impacting installing of T::S), I prepared new 1.85, ran end to end tests then released.

It took me big part of the morning, but I also tried to keep me from doing too much bug fixing for the whole day/summit since I don't necessarly consider that the best way to spend the event for me.

At some point, with Tux we reached the MetaCPAN group to discuss web/DB Test::Smoke migration (hosting), dissuss ownership and future.

The context: The logs in database are reported to be annoying, as well as some current architecture that are difficult to maintain with best effort, even if considered more elegant this way.
So we discussed putting logs out of Database (object store, GitHub?, something else?).

This is a part that I don't own but still follow and have some power of decision or at least can share opinions :)

### Discussions
Later at 2pm, I participated to CPAN client discussion, why multiple clients? Raison d'etre of each? 
Extract portions? Into core. What's missing to CPAN.pm

Skaji reminded that `cpm` version 1.0 was about to get out during the summit! \o/

This was followed by "Cyber Resilience Act Q&A" and a first discussion about AI contributions to Perl ecosystem.

### Going out
Later that day, we went out to eat (healthy) with Robert and Tina, then had an improvised after drink with Robert in a very local place.

We gathered with few of CPANSec where I was presented a new web dashboards of security findings. Won't tell more about that but I found it very impressive.

## Day 2
### PAUSE/CPANSec
The next day started almost as the first one with PAUSE team merging a security fix (["ABRA SQL timely attack"](https://github.com/andk/pause/commit/99649974df4ca03fba711bdf2943101c3948e6fb) as we nicknamed) that I did but again was "ordered" by CPANSec.

### Test::Smoke
Back to Test::Smoke I investigated a problem with curl with some users/CPANTesters (for the record, snap install of curl can't `curl -d@file`

I had some pending contributions from Nicolas to fix issues and improve CI but they were requiring changes. We blocked some time and merged PRs [25](https://github.com/Perl-Toolchain-Gang/Test-Smoke/pull/25), [26](https://github.com/Perl-Toolchain-Gang/Test-Smoke/pull/26), [27](https://github.com/Perl-Toolchain-Gang/Test-Smoke/pull/27) after the proper edits!

And I released Test::Smoke 1.86 :)

### CPM
I did pairing with Skaji about `cpm`, discussing that one way to maybe speed up more cpm would be to use published upstream dependencies ala [uv with PEP 658](https://peps.python.org/pep-0658/). Everything is already there for that. Verifying `dynamic_config: 0` in META (cost: HTTP call) and using MetaCPAN API to list `dependencies` (cost: same HTTP call) would allow to build dependencies tree without download, extract (yes it would happen later anyway, but it could help with parallelizing).

I reviewed `cpm` option `--no-default-resolver` along with priority of resolver with local pinto. It's following [a study I did around dependences confusions](https://security.metacpan.org/docs/cpan-dependency-confusion.html) and a report on IRC.

Skaji explained me the problem with order of EU::MM (build phase should use configure phase EU::MM version, and it can be upgraded in between). What a masterclass!
On my side, I ran for him quickly 2 past talks [Answering questions about CPAN that nobody asked](https://thibaultduponchelle.github.io/talks/talk-tprcic-2021-answers-to-cpan-questions-that-nobody-asked/) and [Answering questions about CPAN that nobody asked - the sequel](https://thibaultduponchelle.github.io/talks/talk-pts-2025-answers-to-cpan-questions-that-nobody-asked-the-sequel/)

Skaji was on the road to `cpm` v1 so I excercised the release candidate by installing cpm trials, testing and reporting my findings/feelings/remarks.

### Discussions
I then participated to "Perl platforms" discussion led by Philippe and followed by several Perl core members.

I did show the CPAN Patching "proxy" approach that I described in [4 Shades Of CPAN Patching](https://thibaultduponchelle.github.io/4-Shades-Of-CPAN-Patching) and discussed with Todd about that, since he had spent lot of time thinking about that also.

The 2 next discussions were about AI, first about AI contribution policy and AI tooling. We made good progress on the first one (defining materials to be proposed to CPAN authors, without giving proper guideline). Second was more about sharing good productivity tooling.

Finally, Paul Evans presented ongoing feature development for perl interpreter, with current, plans and difficulties (roles).

We had group diner on that day

![](/assets/images/pts2026/diner.jpg)

Later, few of us visited later [Metalab](https://metalab.at/), that really impressed me. Then I went back with Graham.

## Day 3
### CPM
I did again pairing with Skaji, where he presented me a past talk followed by a (very difficult) quiz around toolchain.

Skaji getting even closer to v1, I did some more testing of the new trial versions with him as one more sanity check.

### Test::Smoke
Things moved a lot aroung Test::Smoke on that day, since Todd and Nicolas started a full rewrite of the Web/DB part (what is running the [backend part of T::S](https://perl5.test-smoke.org/))

I continued on issues and in particular closing the poster issue [21](https://github.com/Perl-Toolchain-Gang/Test-Smoke/issues/21)
I removed the dual testing of stdio along perlio, it took me multiple tentatives but was finally OK and I finally released 1.87 \o/

### Discussions
I discussed more organizational items with Laurent and Philippe (global team)

I had also a short discussion about knowning acceptable AI contributions policy for Perl-Toolchain-Gang (but nothing decided, need to discuss with more Toolchain Gang members).

### CPANSec
I had another discussion about the "proxy" thing and discussed and clarified CPAN Patch Tooling with Todd, since I initially though he was taking ownership on that (but no).

I discussed vulnerabilities triage with Stig then participated to meeting about "Steward organization"

![](/assets/images/pts2026/meeting.jpg)

### Evening
Pizza party and the long awaited Chartreuse time.

I don't know what went through my head but I brought some local liquor (green "Lerina") to complement (who said "compete"?) the Chartreuse.

![](/assets/images/pts2026/lerina.jpg)

It was a total failure (I'm kidding) and I had to endure a terrible defeat.

## Day 4
### Test::Smoke
I continued to work on Test::Smoke, in particular testing old Test::Smoke 1.71 mail reporting then API (because endpoint changed since then) upon request of Todd.

Tux reported the (ssh) Test::Smoke buffer issue and we had a look (not fixed).
Then we had a discussion about the need of auth endpoint with Todd and Nicolas (and Tim).
I went to MetaCPAN room to discuss infra and ownership with Leo.

Finally, I did some remote helping with new contributions to Test::Smoke.

### PAUSE/CPANSec
We continued the work on checking YAML nasty payloads with Tina.

To give you an idea, this is the kind of things we checked against the parser.

Blessed:
```yaml
---
nasty: !!perl/hash:DBI::st { foo: bar }
abstract: 'The great new Acme::YAML::Inject!'
```

Bim:
```yaml
---
abstract: 'The great new Acme::YAML::Inject::Bim!'
author:
  - ! >-
    Copyright (c) 2024 Thibault DUPONCHELLE. All rights
    reserved.
```

Growing:
```yaml
---
re: !!perl/regexp (?^:(?^:(?^:(?^:(?^:OK)))))
# https://github.com/cpan-authors/YAML-Syck/issues/45
abstract: 'The great new Acme::YAML::Inject::Growing!'
```

Upgraded:
```yaml
---
épée
# https://github.com/cpan-authors/YAML-Syck/issues/60
abstract: 'The great new Acme::YAML::Inject::Upgraded!'
```

LOL Bomb:
```yaml
---
lol1: &lol1 ["lol","lol","lol","lol","lol","lol","lol","lol","lol"]
lol2: &lol2 [*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1]
lol3: &lol3 [*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2]
lol4: &lol4 [*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3]
lol5: &lol5 [*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4]
lol6: &lol6 [*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5]
lol7: &lol7 [*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6]
lol8: &lol8 [*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7]
lol9: &lol9 [*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8]
lolz: &lolz [*lol9]
abstract: 'The great new Acme::YAML::LOLBomb!'
mapping: *lolz
```

Recursive:
```yaml
---
mapping:   &main-rule
  mapping:   *main-rule
abstract: 'The great new Acme::YAML::Recursive!'
```

Still on CPANSec topic, I reviewed and tested the new "River" script and gave some feedback to Olaf.
 

### Meta
We had more intense discussion about organization with Laurent then later Philippe, including a "secret project" and discussing organization of the next PTS.

### CPM
I tested again `cpm` trial 11 then later the v1 (!) then read blog post annoucement from Skaji, gave some feedback and discussed again.

### Other
I went back to home with a CPANSec mascott and new stickers!

![](/assets/images/pts2026/duck.jpg)


## Conclusion
This Perl Toolchain Summit was fantastic and fruitful.

On a side node, I was very tired and went back literrally exhausted, but that's just about me.

Let me conclude with a little "Long live to Perl!" and by saying thank you to the amazing sponsors that made this possible:
- [The Perl and Raku Foundation](https://www.perlfoundation.org/), 
- [Grant Street Group](https://www.grantstreet.com/),
- [Geizhals Preisvergleich](https://geizhals.de/),
- [Vienna.pm](https://vienna.pm.org/),
- [SUSE](http://www.suse.com/),
- Trans-Formed Media LLC,
- [Ctrl O](https://www.ctrlo.com/),
- [Simplelists](https://www.simplelists.com/),
- Harald Joerg,
- Michele Beltrame ([Sigmafin](https://www.blendgroup.it/),
- Laurent Boivin.
