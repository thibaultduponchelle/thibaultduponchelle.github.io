---
layout: post
title: Inspect Perl values prettily with Data::Printer
date: 2021-03-04 08:07:35
---
# A word about complex structures and debugging
In Perl (as in majority of other programming languages), you can construct **complex data structures**. By complex, I mean *mixed* hash and arrays or *nested* (hash of hashes, array of hashes etc...).

Then it typically requires time and effort to do **"printf debugging"** on these complex structures so that's the reason why **data dumpers** exist!

So let's go with the code!

## First fill a variable to dump
I propose this small snippet to create and fill an array with some content:
```perl
#!/usr/bin/env perl

my @array = ();
push @array, "apple";
push @array, "banana";
push @array, "strawberry";
push @array, { name => "tib", color => "blue" };
push @array, { name => "bob", color => "red" };
```

An array with items where some of them are hashes (refs).

## Data::Dumper
First I will dump with the classic [Data::Dumper](https://metacpan.org/pod/Data::Dumper) :smiley:

```perl
use Data::Dumper;
print Dumper(@array);
```

The output is already not bad (hash is indented):
![Data::Dumper](/assets/images/phw94z8n0r2p83v84pbm.png)

To improve output, we can tweak a bit the [behavior of Data::Dumper](https://metacpan.org/pod/Data::Dumper#Configuration-Variables-or-Methods) but if you want my opinion there is a better option...

## Data::Printer
First, install [Data::Printer](https://metacpan.org/pod/Data::Printer) with a CPAN client `cpanm Data::Printer`.

**Data::Printer** is not in the core (**Data::Dumper** is) but has no "non-core" dependencies! :dancer: 

```perl
use DDP;
p @array;
```

And tadaa! A nicely formatted and colored data dump :+1:
![Data::Printer](/assets/images/tvi6qez55zantjt7edi7.png)


