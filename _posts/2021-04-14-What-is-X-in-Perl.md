---
layout: post
title: What is X in Perl?
date: 2021-04-14 09:24:54
---
### What is pip or gem?
[cpanm](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm) or [cpm](https://metacpan.org/pod/distribution/App-cpm/script/cpm)

### Where is my REPL?
Use [perl debugger](https://perldoc.perl.org/perldebug) `perl -de2` or one of the REPL (e.g. [reply](https://metacpan.org/pod/distribution/Reply/bin/reply))

### Is there any gemfile or requirements.txt?
[cpanfile](https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod) or [cpmfile](https://github.com/skaji/cpm/blob/master/cpm.yml) (NEW!)

(and more... e.g. with `dzil`)

### What is package.json?
[META.json](https://metacpan.org/source/INGY/Acme-1.11111111111/META.json) and [META.yml](https://metacpan.org/source/INGY/Acme-1.11111111111/META.yml) see [doc](https://metacpan.org/pod/CPAN::Meta::Spec)

### And gemfile.lock or package-lock.json?
[cpanfile.snapshot](https://metacpan.org/pod/cpanfile) or [carton.lock](https://metacpan.org/pod/Carton)

### And what about Virtualenv?
Virtual envs are not *as much vital* in Perl, but there is [plenv](https://github.com/tokuhirom/plenv) or [perlbrew](https://perlbrew.pl/)

### Bundler?
[carton](https://metacpan.org/release/carton)

### Other tips for Perl beginners
* Usually no variable methods (`variable.method`) but methods on variables (`method(variable)`) e.g. `split`
* `;` is mandatory (with few exceptions but please forget)
* Indentation not meaningful
