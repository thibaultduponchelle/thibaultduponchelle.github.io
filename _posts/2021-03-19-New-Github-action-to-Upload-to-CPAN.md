---
layout: post
title: New Github action to Upload to CPAN
date: 2021-03-19 07:51:13
---
I don't release CPAN modules so often, but when I do, I try to do it with class! :smile:

![Style](/assets/images/lpyca80s6wr3zhraw3yf.png)

Some days ago, I got the idea that it could be nice to have a Github action to automatically upload a distribution to CPAN. 

I wondered how to upload a distribution from command line (I never needed such thing) and luckily there is already a perfect existing solution for this: [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload)

I never created before a Github action but surprisingly it is very easy. There are 2 types of actions:
- [javascript actions](https://docs.github.com/en/actions/creating-actions/creating-a-javascript-action)
- [dockerfile actions](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action)

I started with javascript version but since it required more customization, I quickly switched to dockerfile action.

So finally here is it: 

## [thibaultduponchelle/action-upload-to-cpan](https://github.com/thibaultduponchelle/action-upload-to-cpan) :sparkles:

I tested it with [Acme::Automatix](https://metacpan.org/pod/Acme::Automatix)

The yml file describing the process of building and releasing my repository source code is like this:
```yml
on: [push]

jobs:
  build-and-release:
    runs-on: ubuntu-latest
    name: Build and release Acme::Automatix to CPAN
    steps:
    - uses: actions/checkout@v2
    - name: Configure
      run: perl Makefile.PL
    - name: Build
      run: make
    - name: Deliver locally
      run: make dist
    - name: Upload to CPAN
      id: upload
      uses: thibaultduponchelle/action-upload-to-cpan@master
      with:
          username: ${{ secrets.USERNAME }}
          password: ${{ secrets.PASSWORD }}
```
Since credentials are required to upload to CPAN, you have to give your username and password, but you don't want to share them with everybody so you have to put them in as **"secrets"**. Go to "Settings" then "Secrets" and you can add your secret credentials.
![Secrets](/assets/images/d9ocq1sfnmlzjof6v7hd.png)

Only the password is really secret, so I can show you how I added my username (yes I'm "CONTRA" on CPAN):
![CONTRA](/assets/images/xehneatvry4a68fh75ye.png)

And later they well appear obfuscated in the logs :smile:
![Secrets](/assets/images/0ygkgkmcrv2ikbp1fkcc.png)

By default, `upload-to-cpan` will try to upload any tarball in the root directory of your github repo (could maybe change that in the future). Also I'm using `@master` version of the action but this will change in the future.

If you forget to update the version, the releasing with fail with a "conflict".

You can be smarter than me and introduce conditions to upload (only release when merging on a "production" branch, or only release on tagging...)

## Conclusion
I really think this action is useful and since I wrote it, I discovered that these kind of things exist for other ecosystems (e.g. rubygems, pypi...) so it confirmed my feeling :smile:

Then all that remains is to wish you Happy releasing! :sparkles:
 
![Muppet](/assets/images/kco5uq6sjtyag2a7bpvy.gif) 
 