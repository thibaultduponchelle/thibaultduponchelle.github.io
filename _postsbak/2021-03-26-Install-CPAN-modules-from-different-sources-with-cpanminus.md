---
layout: post
title: Install CPAN modules from different sources with cpanminus
date: 2021-03-26 08:02:53
---
1. [cpanm from CPAN](#from-cpan)
2. [cpanm from git](#from-git)
3. [cpanm from local tarball](#from-tarball)
3. [cpanm from remote tarball](#from-remote)

For this post, I will use the CPAN client [cpanm](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm) and [Acme::Automatix](https://metacpan.org/release/Acme-Automatix) which is one of my modules (and that  does nothing). 

# cpanm from CPAN <a name="from-cpan"/> 
The main way, install from CPAN:
```bash
$ cpanm Acme::Automatix
--> Working on Acme::Automatix
Fetching http://www.cpan.org/authors/id/C/CO/CONTRA/Acme-Automatix-0.05.tar.gz ... OK
Configuring Acme-Automatix-0.05 ... OK
Building and testing Acme-Automatix-0.05 ... OK
Successfully installed Acme-Automatix-0.05
1 distribution installed
```

This is the common way and **recommended way**, because as much as possible, modules have to hit the CPAN (to be indexed, shared and watched by cpantesters). But I will now show you some exotic/pragmatic methods.

# cpanm from git <a name="from-git"/>
If the code is on github, you can install it almost the same way:
```bash
$ cpanm https://github.com/thibaultduponchelle/Acme-Automatix.git
Cloning https://github.com/thibaultduponchelle/Acme-Automatix.git ... OK
--> Working on https://github.com/thibaultduponchelle/Acme-Automatix.git
Configuring /tmp/CkMIR8CLw4 ... OK
Building and testing Acme-Automatix-0.06 ... OK
Successfully installed Acme-Automatix-0.06
1 distribution installed
```

Disclaimer: As I said (and I insist), do not use this feature as an excuse to do not release your code to CPAN. This would be an error. Your code won't be well shared, not integrated in the ecosystem of dependencies etc... In other words, not really *visible*, the CPAN is the source of truth!

There was an [experiment](https://github.com/next-cpan/cnext) (abandoned since then) to build a CPAN client based on github for index and deliveries.

While the time changed since CPAN was created and I understand the benefits that conducted to explore this experiment (e.g. easy patching, flexibility...), it may require to think twice before fully relying on an external *platform*. Both [CPAN](https://metacpan.org/), [PyPi](https://pypi.org/) and [RubyGems](https://rubygems.org) currently rely on *infrastructure* providers for hosting but are not tied to an external *platform*.

# cpanm from local tarball <a name="from-tarball"/>
I don't have a tarball of Acme::Automatix, I will create one. First get the sources:
```bash
$ git clone https://github.com/thibaultduponchelle/Acme-Automatix.git
Cloning into 'Acme-Automatix'...
remote: Enumerating objects: 131, done.
remote: Counting objects: 100% (131/131), done.
remote: Compressing objects: 100% (40/40), done.
remote: Total 131 (delta 48), reused 131 (delta 48), pack-reused 0
Receiving objects: 100% (131/131), 20.69 KiB | 3.45 MiB/s, done.
Resolving deltas: 100% (48/48), done.
```

Configure:
```bash
$ cd Acme-Automatix
$ perl Makefile.PL
Generating a Unix-style Makefile
Writing Makefile for Acme::Automatix
Writing MYMETA.yml and MYMETA.json
```

At this point we have a `Makefile` and we can run various *make "target"*.
Let's create the distribution tarball:
```bash
$ make dist
rm -rf Acme-Automatix-0.06
"/usr/bin/perl" "-MExtUtils::Manifest=manicopy,maniread" \
	-e "manicopy(maniread(),'Acme-Automatix-0.06', 'best');"
mkdir Acme-Automatix-0.06
mkdir Acme-Automatix-0.06/t
mkdir Acme-Automatix-0.06/.github
mkdir Acme-Automatix-0.06/.github/workflows
mkdir Acme-Automatix-0.06/lib
mkdir Acme-Automatix-0.06/lib/Acme
Generating META.yml
Generating META.json
tar cvf Acme-Automatix-0.06.tar Acme-Automatix-0.06
Acme-Automatix-0.06/
Acme-Automatix-0.06/META.yml
Acme-Automatix-0.06/.github/
Acme-Automatix-0.06/.github/workflows/
Acme-Automatix-0.06/.github/workflows/build-and-upload.yml
Acme-Automatix-0.06/lib/
Acme-Automatix-0.06/lib/Acme/
Acme-Automatix-0.06/lib/Acme/Automatix.pm
Acme-Automatix-0.06/MANIFEST
Acme-Automatix-0.06/Changes
Acme-Automatix-0.06/Makefile.PL
Acme-Automatix-0.06/README.md
Acme-Automatix-0.06/META.json
Acme-Automatix-0.06/t/
Acme-Automatix-0.06/t/pod.t
Acme-Automatix-0.06/t/pod-coverage.t
Acme-Automatix-0.06/t/manifest.t
Acme-Automatix-0.06/t/00-load.t
rm -rf Acme-Automatix-0.06
gzip -9f Acme-Automatix-0.06.tar
Created Acme-Automatix-0.06.tar.gz
```
As you can see my tarball contains `.github/workflows/` things which is not very elegant (should be ignored) but not really a problem. 

Then you can install it with cpanm:
```bash
$ cpanm Acme-Automatix-0.06.tar.gz 
--> Working on Acme-Automatix-0.06.tar.gz
Fetching file:///home/tduponchelle/Code/Acme-Automatix/Acme-Automatix-0.06.tar.gz ... OK
Configuring Acme-Automatix-0.06 ... OK
Building and testing Acme-Automatix-0.06 ... OK
Successfully installed Acme-Automatix-0.06
1 distribution installed
```

# cpanm from remote tarball <a name="from-remote"/>
Put your tarball somewhere accessible in HTTP, in my case a [github public repo](https://github.com/thibaultduponchelle/messy-ci-workflows/blob/master/dirt/Acme-Automatix-0.06.tar.gz)

Then you can install it with the URL:
```bash
$ cpanm https://github.com/thibaultduponchelle/messy-ci-workflows/raw/master/dirt/Acme-Automatix-0.06.tar.gz
--> Working on https://github.com/thibaultduponchelle/messy-ci-workflows/raw/master/dirt/Acme-Automatix-0.06.tar.gz
Fetching https://github.com/thibaultduponchelle/messy-ci-workflows/raw/master/dirt/Acme-Automatix-0.06.tar.gz ... OK
Configuring Acme-Automatix-0.06 ... OK
Building and testing Acme-Automatix-0.06 ... OK
Successfully installed Acme-Automatix-0.06
1 distribution installed
```

# Conclusion
This is the end of my tour of exotic sources of [cpanm](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm)... :+1: 

Do you know other ways?
