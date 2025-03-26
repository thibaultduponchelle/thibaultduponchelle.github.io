---
layout: post
title: Perl 2020 retrospective
date: 2021-08-23 12:57:41
---
Along the year I some took notes about Perl events/news and it's time to drop my retrospective!

# Perl governance
This year saw several changes around the Perl core governance with the setup of [Perl steering committee](https://github.com/Perl/perl5/wiki/Perl-Steering-Council) and [Perl Proposal for Enhancement](https://github.com/toddr/RFB/blob/master/0001-rfb-process.md) (I think it since changed its name to RFCs). We now have people opening RFCs e.g. [RFC 004](https://github.com/Perl/perl5/issues/17949).

The [perlgov policy](https://perldoc.perl.org/perlgov) have seen several changes, perl 5 maintainers are now using [Perl topicbox space](https://perl.topicbox.com/latest) for administrative discussions (e.g. voting) while [p5p](https://www.nntp.perl.org/group/perl.perl5.porters/) still remains for technical discussions.

[SawyerX](https://github.com/xsawyerx) resigned and we now have 3 Perl [pumpkins](https://perldoc.perl.org/perlhist#PUMPKIN?) instead only one.

# Perl core
Apple decided to enable -Werror producing trouble in Perl 5 core, a grant for [documentations improvements](https://news.perlfoundation.org/post/grant_proposal_documentation_standards_perl7) was accepted (in addition to the usual core maintenance grants) and... The original Perl 7 idea died.

The feature "signature" was proposed to become [no longer experimental](https://github.com/Perl/perl5/issues/18537), a new (experimental) [isa keyword](https://perldoc.perl.org/perlexperiment#isa-infix-operator) appeared and Cor changed its name to [Corinna](https://github.com/Ovid/Cor)!

The perl5 repository gets [1000 stars](https://github.com/Perl/perl5):

![1000 stars](images/clht83jttloca599upty.png)

Concerning releasing flow, the development versions of Perl restarted after some months of pause (at least to test non-regressions on the CPAN river).

# Deprecations
There were serious discussions about maintainer-ship and the [status of libemperl in Debian](https://lists.debian.org/debian-perl/2020/08/msg00006.html). The same kind of adventure happened to [mod_perl being candidate to go "attic"](https://www.nntp.perl.org/group/perl.perl5.porters/2021/03/msg259344.html) (going attic means being archived, and we usually never returns from this place).

Kritika.io also closed this year :/

# Toolchain 
[Neil Bowers](http://neilb.org/index.html) (one of our current Pumpkins) spent time to [resolve inconsistent permissions](https://neilb.org/2020/08/08/cpan-spelunking.html) while [malicious code was found in module AutoLoad](https://www.reddit.com/r/perl/comments/hzjqcy/malicious_code_in_moduleautoload/).

The CPAN mirror list was [finally abandoned](https://log.perl.org/2021/02/cpan-mirror-list-changes.html) since fastly CDN is doing the same job. 

@davorg came with [CPAN Dashboards](https://cpandashboard.com/).

The "Bus factor river" was [added to MetaCPAN](http://blogs.perl.org/users/olaf_alders/2021/06/cpan-bus-factor.html):

![Bus factor](images/k8d3s6p1wft85hgd6tg5.png)

# Community
People doing [Weekly Challenge](https://theweeklychallenge.org/) started to post live coding  sessions!

Once again this year the major Perl conference [TPRCiC](https://perlconference.us/tprc-2021-cloud/) was online (and a success... and I gave talks \o/)

Perl (and Raku) also had their own room at [FOSDEM 2021](https://fosdem.org/2021/schedule/track/perl_and_raku_programming/).

The must-have space game [Tau Station](https://taustation.space/) has launched (by mistake for the record) its [kickstarter](https://www.kickstarter.com/projects/1246097605/tau-station-the-mmo-biblio-rpg?lang=fr).

![Tau](images/cszavkkapx5dgi59zy0s.jpg)

The ticket tracker [rt.cpan.org](https://rt.cpan.org/) was [announced as closing](https://log.perl.org/2020/12/rtcpanorg-sunset.html) then finally the maintenance handed over and [rt.cpan.org moved to new home](https://news.perlfoundation.org/post/rt-cpan-org-upgraded) (with an upgrade). Despite github issue tracker being often preferred, Request Tracker is a very good issue tracker and offers an independent issue tracker (what if github suddenly decided to change its policy towards open source?)

Another event that happened and had some echo outside or Perl community was when [Perl.com was kind of "hacked"](https://www.perl.com/article/the-hijacking-of-perl-com/).

Once again this year we had [Perl advent calendar](https://perladvent.org/2020/) and even the [Leonerd advent calendar](http://leonerds-code.blogspot.com/2020/12/2020-perl-advent-calendar-day-1.html).

And... The [#perl on devto](https://dev.to/t/perl) started to work well :grinning:

# Other
The [Rex friendly automation framework](https://www.rexify.org/) celebrated its [4000th commit]( https://www.reddit.com/r/perl/comments/iict7r/celebrating_4000_commits_of_rex_o/) and its [10 years](https://www.rexify.org/docs/release_notes/1.13.1.html) :tada:

Do you know [inxi](https://smxi.org/docs/inxi.htm) ?

# Raku
Raku community discussed about having its own foundation and organized its first [dedicated conference](https://conf.raku.org/)!

# Conclusion
That was a complicated year, Perl is changing, moving forwards but not without trouble.

I hope you enjoyed this retrospective!