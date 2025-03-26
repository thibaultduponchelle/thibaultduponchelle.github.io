---
layout: post
title: 3 original Perl CPAN social concepts
date: 2024-08-23 11:00:30
---

(Picture from [Eren Li](https://www.pexels.com/fr-fr/@eren-li/))

## CPAN Lieutenants
![Man army](images/p00z9ilo7aj6ch6dak10.jpg)
(Picture from [Alex Andrews](https://www.pexels.com/fr-fr/@alex-andrews-271121/))

I often mentally represent modules "per namespace" (I explained it [here](https://dev.to/thibaultduponchelle/browse-cpan-modules-per-namespaces-6p)) like in a tree where we have a node "JSON" that contains all JSON related (`JSON:PP`, `JSON:XS`, etc...).

I know it's partially wrong, there's no such "order" and for instance `Cpanel::JSON::XS` is out of this hierarchy but still well a JSON thing. But most of the time, this mental model works.

If we care about the quality of the ecosystem, we should try to find a solution to *fight the CPAN inertia*. 

Some important modules can be considered a bit a "common good" (is it wrong to think like this?) but we need also to respect the ownership and copyright.

So here is the concept of CPAN Lieutenants. 

For some very specific cases (e.g. a module does not install at all), I think we should be able to "force apply" a patch to a module. 
Boundaries should be clear:
1. Purpose is to fix a broken module
2. Fix is relatively simple (to review), blocker is about releasing it

In practice, it would mean to let few trusted members to manage a dedicated **sub-tree** of CPAN namespaces. And in extreme case, after some formal review, discussion and notifications, these people would be able to **push** a fix to CPAN (= publish a new release). 

It would be a bit like these people, thanks to their trust and expertise, have implicit co-maintainer rights (`CO-MAINT` in CPAN jargon) on a topic (e.g. "Alien" modules, or "XML").

It won't imply these "lieutenants" to maintain these modules neither the ceremonial of asking (and eventually being refused) co-maintainer permissions. And don't hear what I did not say: I do not criticize PAUSE operating model for that.

The name is inspired from Linux kernel development with "lieutenants" that have responsibility on sub parts of the kernel.

Also we need to respect authors and their rights. It's a matter of finding the right balance so everybody wins. That's why we should be careful with boundaries and rules (e.g. a minimum number of lieutenants approvals), the same way PAUSE admins are careful with module ownership.

If it proves to be incompatible with license, we could consider a layer of patches, inspired by what do several Linux distributions (see for instance `Locally applied patches:` section under Debian/Ubuntu `perl -V`). 

It proved to work (for inertia and licensing) but I would prefer to avoid this, first because it's generally considered good practice "to push patch upstream" when possible, also because it would add complexity and "yet another layer of patches":
- CPAN release contains base delivery
- GitHub locally applied patches (merged commits in GitHub that never reached CPAN)
- CPAN locally applied patches :warning:
- OS Distribution locally applied patches 

But on the other hand, the CPAN local patch layer approach has advantage of managing the storage of patch (since *inertia* very likely also concerns code forge...)

I don’t know the exact solution, but I think there’s something to do :smile:

Actually, a recent discussion on [perl development mailing list](https://www.nntp.perl.org/group/perl.perl5.porters/2024/08/msg268685.html) ("p5p") has highlighted the same need and discussed some close proposals. I swear I did not copied! :grinning: But it decided me to post this!

**edit 1**: a CPAN module security vulnerability is also a valid reason to want this and I see that CPANSec folks have similar concern, see [CPAN Security Patch Tooling](https://github.com/orgs/CPAN-Security/projects/11/views/1)

**edit 2**: [A Social Contract about Artistic Control](https://perldoc.perl.org/perlpolicy#A-Social-Contract-about-Artistic-Control) - perl core statement (applies to modules added to perl core distribution)

**edit 3**: [DistroPrefs](https://metacpan.org/pod/CPAN#Configuration-for-individual-distributions-(Distroprefs)) - CPAN.pm patching facility

## CPAN Mentors
![Helping blind](images/https3a2f2fdev-to-uploadss3amazonawscom2fuploads2farticles2fktrqmr6iufz7fe1jd9jm.jpg)

(Picture from [Thirdman](https://www.pexels.com/@thirdman/))

I think [the barrier of entry of Perl is high](https://dev.to/thibaultduponchelle/the-difficult-road-to-perl-3o5f) but with a compatible mindset, once someone get in, Perl (and CPAN) produces often long time involved members.

These days, there's no so much new entrants to the CPAN. 

We should optimize for retention (and unity).

The idea of CPAN Mentors is to offer help to newcomers, once they pass the entry door, something that we can monitor from [perl modules mailing list](https://www.nntp.perl.org/group/perl.modules/)

Let’s say after 3 weeks, if a new CPAN AUTHOR has not published any module, someone can drop a little mail:
```
Hello new CPAN AUTHOR,

I noticed you recently registered to PAUSE/CPAN, congratulation for this.
I also noticed that you did not publish any module, yet.
I don't know your level of expertise,
maybe you would benefit from some guidance?
I'm reaching you to kindly offer my help :) 
Feel free to ask me questions or we can maybe even accommodate some pairing via a call.

Regards.

Tib
```

I think the number of new monthly CPAN registrations would permit it, and reinforce the community feeling that always been a strength of Perl.

## CPAN Guards
![Guard](images/fkwc4tis671ums68rb0z.jpg)
(Picture from [PhotoMix Company](https://www.pexels.com/@wdnet/))

This concept joins actually a bit the CPAN Lieutenants concept.

The idea is to watch (and contribute to) a limited set of critical modules (depended by several modules or in Perl jargon: those high in the [CPAN river](http://neilb.org/2015/12/22/cpan-river-water-quality.html)) and help keeping  them in good quality and portable.

This is actually not a new concept (forgive me the "original" in title), some people (CPANTesters and perl core developers) are already on it (see for instance [BBC and CPAN River 5000](https://www.nntp.perl.org/group/perl.qa/2017/03/msg13747.html)). 

So it's more about formalizing this under a fancy name.

CPAN Guards concept fits well the Perl folks that are more contributors than maintainers and prefer to jump often from modules to modules.

At some point it's also related to the [Perl Phalanx initiative](https://www.perl.com/pub/2005/01/13/phalanx.html/) (more focused on tests)

## Some reading and watching
- [The Four Major Problems with CPAN](https://blogs.perl.org/users/brendan_byrd/2013/03/the-four-major-problems-with-cpan.html)
- [Don't release experiments to CPAN](https://blogs.perl.org/users/neilb/2013/03/dont-release-experiments-to-cpan.html)
- [Perl Phalanx Project](https://qa.perl.org/phalanx/)
- [What is Perl Phalanx Project](https://www.perl.com/pub/2005/01/13/phalanx.html/)
- [BBC testing from upriver downwards](https://www.nntp.perl.org/group/perl.qa/2017/03/msg13747.html)
- [Whither Perl? - Olaf Alders - TPRC 2023](https://www.youtube.com/watch?v=9J_9WQ_haDs)
