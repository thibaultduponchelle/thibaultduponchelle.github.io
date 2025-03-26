---
layout: post
title: CPAN utils
date: 2021-03-31 07:56:22
---
![CPAN utils](/assets/images/6e5cry8wptwsu9rjulvt.png)

In this post I will present you some *must-have-but-less-known* CPAN utils :+1: :muscle: :sunglasses:

1. [List outdated modules](#outdated)
2. [List latest changes](#latest)
1. [Print dependencies tree](#tree)
1. [List system requirements](#pragmatic)

# List outdated modules <a name="outdated"/>
You can use [cpan-outdated](https://metacpan.org/pod/distribution/cpan-outdated/script/cpan-outdated) to get the list of your outdated modules.

```bash
$ cpan-outdated -p
Acme::Automatix
Alien::Plotly::Orca
Alien::SNMP::MAXTC
PPIx::QuoteLike
PPIx::Regexp
```
Outdated modules you said?

The discrepancy is totally normal, since modules versions evolve on CPAN but not necessarily locally.

In my example, the list is very small because I updated all my modules very recently with `cpan-outdated -p | cpanm` (I don't really know why I did it but it was cool :grinning:).

# Get latest changes <a name="latest"/>
Use [cpan-listchanges](https://metacpan.org/pod/distribution/cpan-listchanges/script/cpan-listchanges) to get meaningful portions of changelog between the version installed locally versus the latest version on CPAN. Example with one of the outdated from my previous list:
```bash
$ cpan-listchanges PPIx::QuoteLike
=== Changes between 0.015 and 0.016 for PPIx-QuoteLike

0.016		2021-03-26	T. R. Wyant
    Add rt.cpan.org back to bug reporting methods. Long live RT!

    Get prerequisites up to snuff, and add xt/author/prereq.t to ensure
    they stay that way.

    Refactor authortest into three, so I do not have to generate stub
    files to test without optional modules.
```

# Print dependencies tree <a name="tree"/>
Print the dependency tree with [cpandeps](https://metacpan.org/pod/distribution/CPAN-FindDependencies/bin/cpandeps)

```bash
$ cpandeps JSON::Conditional
JSON::Conditional (dist: L/LN/LNATION/JSON-Conditional-1.00.tar.gz)
  JSON (dist: I/IS/ISHIGAKI/JSON-4.03.tar.gz)
    Test::More (dist: E/EX/EXODIST/Test-Simple-1.302183.tar.gz)
      File::Temp (dist: E/ET/ETHER/File-Temp-0.2311.tar.gz)
        Carp (dist: X/XS/XSAWYERX/Carp-1.50.tar.gz)
          Exporter (dist: T/TO/TODDR/Exporter-5.74.tar.gz)
          IPC::Open3 (dist: S/SH/SHAY/perl-5.32.1.tar.gz)
        File::Path (dist: J/JK/JKEENAN/File-Path-2.18.tar.gz)
          File::Spec::Functions (dist: X/XS/XSAWYERX/PathTools-3.75.tar.gz)
            Scalar::Util (dist: P/PE/PEVANS/Scalar-List-Utils-1.55.tar.gz)
        parent (dist: C/CO/CORION/parent-0.238.tar.gz)
      Storable (dist: X/XS/XSAWYERX/Storable-3.15.tar.gz)
        XSLoader (dist: S/SA/SAPER/XSLoader-0.24.tar.gz)
  Module::Metadata (dist: E/ET/ETHER/Module-Metadata-1.000037.tar.gz)
    Encode (dist: D/DA/DANKOGAI/Encode-3.08.tar.gz)
    lib (dist: S/SM/SMUELLER/lib-0.63.tar.gz)
    version (dist: L/LE/LEONT/version-0.9928.tar.gz)
      base (dist: R/RJ/RJBS/base-2.23.tar.gz)
  Struct::Conditional (dist: L/LN/LNATION/Struct-Conditional-1.00.tar.gz)
    Clone (dist: A/AT/ATOOMIC/Clone-0.45.tar.gz)
      B::COW (dist: A/AT/ATOOMIC/B-COW-0.004.tar.gz)
```

You can also see the JSON::Conditional deps (here for perl 5.26.1) on [deps.cpantester.org](http://deps.cpantesters.org/?module=JSON%3A%3AConditional&perl=5.26.1&os=any+OS):
![CPANDeps CPANTesters](/assets/images/dqak9heagjkozfveo80n.png)

Or a nice view (configurable) on [cpandeps.grinnz.com](https://cpandeps.grinnz.com/?dist=JSON-Conditional&dist_version=&phase=test&recommends=1&suggests=1&perl_version=v5.26.1&style=auto):
![CPANDeps grinnz](/assets/images/nxzn1o9d5ve4shu8efd9.png)


None of these 2 pages give the exact same result than the command line, I haven't checked why, we could discuss in comments (maybe something with dynamic/static).

# List system requirements <a name="pragmatic"/>
Several modules require libraries or development kit that CPAN can't satisfy (even if [Alien modules](https://alienfile.org/) can often fill this gap). Having a CPAN module installation failing because a dependency is missing is "normal". It is like when you compile something, it fails while reporting a missing header because you need to install it before. To help you and automatic tests, [Slaven Rezić](https://metacpan.org/author/SREZIC) gathered system dependencies for us in the tool [cpan-sysdeps](https://metacpan.org/pod/distribution/CPAN-Plugin-Sysdeps/script/cpan-sysdeps)

```bash
$ cpan-sysdeps --cpanmod Imager
libfreetype6-dev
libgif-dev
libpng-dev
libjpeg-dev
libtiff5-dev
```

I was mad when I discovered this module, come on MetaCPAN and hit the "++" button!

![++](/assets/images/v6zqc5hvsyb70jprzn5z.png)

# Conclusion
If you have more to add to this list, please share! :smile:
