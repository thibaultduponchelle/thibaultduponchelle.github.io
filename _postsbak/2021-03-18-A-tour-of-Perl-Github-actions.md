---
layout: post
title: A tour of Perl Github actions
date: 2021-03-18 09:25:50
---
I am using A LOT github actions. 

I like them well and nothing hurts me too much (except the scheduled jobs auto disabling, but I now accepted to live with it :cry:).

![Crowd Surfing](images/ov1zn82qeovcq8rtqfz6.png)

I use them for instance for doing strange things like [CI poor-man dashboards](https://github.com/thibaultduponchelle/aliens-ci) like the picture below:

![Dashboard](images/hs64nc1fky4bdhmochz1.png)

Or I simply use them [to test](https://github.com/thibaultduponchelle/XML-Minifier/blob/master/.github/workflows/linux.yml) my modules.

I even produced this [showcase](https://github.com/thibaultduponchelle/messy-ci-workflows) (not limited to github) or posted a long writing [about a crypto-mining attack](https://dev.to/thibaultduponchelle/the-github-action-mining-attack-through-pull-request-2lmc) that targeted my github actions recently.

"Github actions" actually designates both the CI system in general and the ready-to-use modules made for it (what you could find on **Circle CI** under the name "Orbs" or "pipeline libraries" in **Jenkins**).

Now I will talk about "Github action" *modules* :smile:

You can *almost* live without Github actions (I would at least use checkout action), but they bring so much convenience that you should really give them a try :grinning:

## The status of github actions for Perl
There are already some github actions to satisfy most needs like installing CPAN deps, testing a distribution or linting (validating with `perlcritic`).

You have the excellent [Setup Perl](https://github.com/shogo82148/actions-setup-perl) to install the perl version of your choice + install CPAN modules (cpanm and cpm inside!)

```yml
steps:
    - uses: actions/checkout@v1
    - name: Setup Perl
      uses: shogo82148/actions-setup-perl@v1
      with:
        perl-version: '5.30'
    - name: perl -V
      run: perl -V
    - run: cpanm --installdeps .
    - run: prove -lv t
```

Note: The "Setup X" is common for actions and we find that [for lot of technologies](https://github.com/marketplace?type=actions&query=Setup) ("Setup Python", "Setup Ruby", "Setup Jira"...) 

"Setup perl" installs perl but if you want, there is also the possibility to use a docker image having already the version you want:

```yml
 jobs:
  perl:

    runs-on: ubuntu-latest

    strategy:
      matrix:
        perl-version:
          - '5.10'
          - '5.16'
          - 'latest'
          - 'threaded'

    container:
      image: perl:${{ matrix.perl-version }}

    steps:
      - uses: actions/checkout@v2
      - name: perl -V
        run: perl -V
```

This will connect to a ubuntu-latest VM having docker, launch 4 containers `perl:5.10`, `perl:5.16`, `perl:latest` and `perl:threaded` and run your `perl -V` inside.

![Docker](images/hhldd72iecrf23gbxsne.png)

You can even come with your own [customized image](https://hub.docker.com/r/tibtibdocker/perl-blead) (that you can create and push from [another github repo](https://github.com/thibaultduponchelle/docker-perl-blead) with its [own github action](https://github.com/thibaultduponchelle/docker-perl-blead/blob/master/.github/workflows/perl-blead.yml)).
Another example is [ci-perl-helpers-ubuntu](https://hub.docker.com/r/houseabsolute/ci-perl-helpers-ubuntu) from [houseabsolute/ci-perl-helpers](https://github.com/houseabsolute/ci-perl-helpers) that seems to target transparent multi ci providers tooling.

With containers, the actual perl setup has been done during the docker packaging.

There are the also excellent `install-with-cpanm` or `install-with-cpm` that give you convenient and unified actions to install CPAN modules:

## install-with-cpanm
```yml
- name: install cpanm and multiple modules
  uses: perl-actions/install-with-cpanm@v1
  with:
    install: |
      Simple::Accessor
      Test::Parallel
```
The `|` is for introducing multiline.

## install-with-cpm
```yml
- name: install cpm and multiple modules
  uses: perl-actions/install-with-cpm@stable
  with:
    install: |
      Simple::Accessor
      Test::Parallel
```
Do you know that cpm is fast?

## ... Or their poor man versions
I'm decidedly a poor man!

You can also simulate `install-with-cpanm` with:
```yml
steps:
      - name: Install alien
        run: curl -L https://cpanmin.us | perl - --configure-timeout=1920 Alien::FFI
```

Or for cpm:
```yml
    steps:
      - name: Install alien
        run: curl -sL https://git.io/cpm | perl - install --show-build-log-on-failure --test --configure-timeout=1920 Alien::FFI
```

Please note the `--configure-timeout` option to increase the configure time (`Alien` modules can take long time)

The cpm `--show-build-log-on-failure` is a candy :heart:

The `--test` is to run tests (cpm by default disables them, for speed!)

You probably noticed that these versions use the pre-installed perl that comes with the VM but it is generally OK.

## More and more with ci-perl-tester-helpers
There is even more in [ci-actions-perl-helpers](https://github.com/perl-actions/ci-perl-tester-helpers) since it configures with `dzil` or `minil`, installs deps and builds your code.

(I haven't tested this one)

## Perlcritic actions
I haven't tested any, but there is multiple `perlcritic` github actions. See [gugod-perlcritic](https://github.com/marketplace/actions/gugod-perlcritic) or [gugod-perlcritic-with-reviewdog](https://github.com/marketplace/actions/gugod-perlcritic-with-reviewdog) or [perl-critic-action](https://github.com/natanlao/perl-critic-action) or [perl-critic](https://github.com/pipeline-components/perl-critic) or [action-perlcritic](https://github.com/Difegue/action-perlcritic).

So much choices...

![Choices](images/nly9xch6bs06tk84bi9e.jpg)

## Your first action?
It appears a bit late in this post :grinning: but if you never jumped into github actions, here is *my quickstart*:

1. Create a file in `.github/workflows/` (need to create the directory) named for install `check.yml`
2. Put this yml code inside:
```yml
name: check-syntax

on: [push]

jobs:
  perl:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Check syntax 
      run: for f in `find . -name "*.pm" -o -name "*.pl" -o -name "*.t"`; do perl -c $f; done
```

Push then wait and see :smile:
![Check](images/1a7qsvjpda4ulmc52qbt.png)


## Conclusion
This is the end of my tour of Github actions for Perl.

I have still plenty of things to say but won't fall into too much details :smile: maybe in another blog post :smile:

I hope you learned something or that I gave you the motivation to setup a github action on your repository!


 