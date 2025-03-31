---
layout: post
title: #AdoptAPerlModule
date: 2021-04-14 11:48:52
---
### Do you have some time for open source (and Perl)?

Then [#AdoptAPerlModule](http://neilb.org/2013/07/24/adopt-a-module.html)!

Maintaining module is a rewarding position where you can learn more about toolchains concepts and play a role in the Perl ecosystem.

Of course depending how much people depends on your module, it will require more work, reactivity and consistency. But a lot of "orphan" modules fall not in this category.

### Friendly CPAN module is looking for love and care
I listed below some links where you can find modules that **need help** or are **looking for a new maintainer** ("Adoptable").

As a starting point, see first the [adoption's list](https://neilb.org/adoption/) from **Neil Bowers** who integrates metrics like number of issues to extract "possible candidates".

Then there is the [ADOPTME](https://metacpan.org/author/ADOPTME) author on MetaCPAN.
Unfortunately the [HANDOFF](https://metacpan.org/author/HANDOFF) and [NEEDHELP](https://metacpan.org/author/NEEDHELP) search from MetaCPAN are not working well (and actually even the ADOPTME I mentioned you just above is incomplete). ~~Maybe I have to propose a code change to [MetaCPAN](https://github.com/metacpan/metacpan-web)~~

EDIT: As shared in comments by @grinnz (thank you!!) we have correct lists in MetaCPAN using the *permissions* views:  [ADOPTME](https://metacpan.org/permission/author/ADOPTME), [HANDOFF](https://metacpan.org/permission/author/HANDOFF) and [NEEDHELP](https://metacpan.org/permission/author/NEEDHELP)

You also go on [RT](https://rt.cpan.org/Public/):
- [ADOPTME](https://rt.cpan.org/Public/Dist/ByMaintainer.html?Name=ADOPTME)
- [HANDOFF](https://rt.cpan.org/Public/Dist/ByMaintainer.html?Name=HANDOFF)
- [NEEDHELP](https://rt.cpan.org/Public/Dist/ByMaintainer.html?Name=NEEDHELP)

Or on [CPANMeta](https://cpanmeta.grinnz.com/):
- [ADOPTME](https://cpanmeta.grinnz.com/perms?author=ADOPTME&module=&match_mode=exact)
- [HANDOFF](https://cpanmeta.grinnz.com/perms?author=HANDOFF&module=&match_mode=exact)
- [NEEDHELP](https://cpanmeta.grinnz.com/perms?author=NEEDHELP&module=&match_mode=exact)

And finally, there is also a GitHub organization that [gathers orphan modules](https://github.com/CPAN-Adoptable-Modules)

(If you know more links, please share in comments)

### River position
Take care of the "river" position, don't adopt modules with several dependent packages.  

