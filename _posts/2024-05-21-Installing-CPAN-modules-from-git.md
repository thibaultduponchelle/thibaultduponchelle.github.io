---
layout: post
title: Installing CPAN modules from git
date: 2024-05-21 18:18:32
---
![Elevate](/assets/images/elevate.png)

(picture from [elevate](https://www.pexels.com/fr-fr/@elevate/)) 

For various reasons, you might want to install CPAN modules from a git repository. 

It can be because somehow a git repository is in advance against CPAN:
- A fix was merged in official git repository but never released to CPAN
- A branch or a fork contains some valuable changes (this *very-little-but-absolutely-needed* fix)

Or it can be because the modules are actually not in CPAN: not public and not in a alternative/private CPAN (see Addendum) or simply they are only "experiments"

But this post is not meant to discuss about the "why" but instead mainly share technically the "how" you could do that :grinning:

I tested various syntax and installers and will share now some working examples.

Before we continue, be sure to upgrade your installers (`App::cpm` and `App::cpanminus`) to their latest

## Installing from command line with `cpm`
Installing with `cpm` is straighforward:
```bash
$ cpm install https://github.com/plack/Plack.git --verbose
33257 DONE fetch     (0.971sec) https://github.com/plack/Plack.git
33257 DONE configure (0.033sec) https://github.com/plack/Plack.git
33257 DONE resolve   (0.031sec) Clone -> Clone-0.46 (from MetaDB)
...
33257 DONE install   (0.364sec) URI-5.28
33257 DONE install   (0.046sec) https://github.com/plack/Plack.git
31 distributions installed.
```

It can also work the same with ssh `git@github.com:plack/Plack.git`:
```bash
$ cpm install git@github.com:plack/Plack.git --verbose
64383 DONE fetch     (2.498sec) git@github.com:plack/Plack.git
64383 DONE configure (0.039sec) git@github.com:plack/Plack.git
...
64383 DONE install   (0.045sec) git@github.com:plack/Plack.git
31 distributions installed.
```

## Installing from command line with `cpanminus`
Installing with `cpanm` is not harder:
```bash
$ cpanm https://github.com/plack/Plack.git
Cloning https://github.com/plack/Plack.git ... OK
--> Working on https://github.com/plack/Plack.git
...
Building and testing Plack-1.0051 ... OK
Successfully installed Plack-1.0051
45 distributions installed
```

## Installing from `cpanfile`
The correct syntax is the following (thank you @haarg):
```bash
requires 'Plack', git => 'https://github.com/plack/Plack.git', ref => 'master';
```
(`ref => 'master'` is optional)

And it would just work later with `cpm`:
```bash
$ cpm install --verbose
Loading requirements from cpanfile...
33257 DONE fetch     (0.971sec) https://github.com/plack/Plack.git
33257 DONE configure (0.033sec) https://github.com/plack/Plack.git
33257 DONE resolve   (0.031sec) Clone -> Clone-0.46 (from MetaDB)
...
33257 DONE install   (0.364sec) URI-5.28
33257 DONE install   (0.046sec) https://github.com/plack/Plack.git
31 distributions installed.
```
:warning: Despite being a `cpanfile`, please note the use of `cpm`

## Installing from `cpmfile` 
Let's write our first [cpmfile](https://github.com/skaji/cpmfile)  and save it as `cpm.yml`:
```yml
prereqs:
  runtime:
    requires:
      Plack:
        git: https://github.com/plack/Plack.git
        ref: master
```

And then it would just work with `cpm`:
```bash
$ cpm install --verbose
Loading requirements from cpm.yml...
66419 DONE resolve   (0.000sec) Plack -> https://github.com/plack/Plack.git@master (from Custom)
66419 DONE fetch     (1.695sec) https://github.com/plack/Plack.git
66419 DONE configure (0.034sec) https://github.com/plack/Plack.git
...
66419 DONE install   (0.023sec) https://github.com/plack/Plack.git
31 distributions installed.
```

## Beware of "incomplete" repositories
Releases on CPAN are standardized and generally contain what is needed for installers, but distributions living in git repositories are more for development and very often not in a "ready to install" state.

(thank you @karenetheridge)

There's some limitations that you can encounter:
- `cpm` would refuse to install if no META file is found (but `cpanm` would be OK with that)
- `cpm` would refuse to install if no `Makefile.PL` nor `Build.PL` is found, except if [x_static_install: 1](https://blogs.perl.org/users/shoichi_kaji1/2017/03/make-your-cpan-module-static-installable.html) is declared in META (`cpanm` would still refuse) 

Should I mention the repositories with only a `dist.ini`? (used by authors to generate everything else) 

And you would get similar trouble with distributions using `Module::Install` but having not versioned it.

## Conclusion
You should probably not rely too much on "install from git" method but still, it can provide an handy way to install modules to test fixes or experiments. 

And now with this post you should have good examples of “how” you can achieve that.

# Addendum

## Alternative CPAN
For alternative/private CPAN, several tools can come to your rescue: 
- [minicpan](https://metacpan.org/dist/CPAN-Mini/view/bin/minicpan)
- [opan](https://metacpan.org/pod/App::opan)
- [OrePAN2](https://metacpan.org/pod/OrePAN2) 
- [pinto](https://metacpan.org/dist/Pinto/view/bin/pinto)

## What is *not* working (2024)
### cpanm with cpanfile 
Look at following `cpanfile`:
```bash
requires 'Plack', git => 'https://github.com/plack/Plack.git', ref => 'master';
```

It is not well "honored" by `cpanminus`.

### Broken syntax
```bash
requires "MyExperimental::Module" => "git://github.com/lestrrat/p5-MyExperimental-Module.git";
```

## Resources
(some of them are outdated)
- [Is it possible to require a git repo in a cpanfile for cpanm](https://stackoverflow.com/questions/38603421/is-it-possible-to-require-a-git-repo-in-a-cpanfile-for-cpanm)
- [The Main Problem With CPAN Modules On Github](https://blogs.perl.org/users/lestrrat/2013/03/the-main-problem-with-cpan-modules-on-github.html)
- [Private Git URLs & the --installdeps option](https://github.com/miyagawa/cpanminus/issues/381)
- [cpanfile: support git URL](https://github.com/miyagawa/qahack-tokyo/issues/6)

