---
layout: post
title: Show progress with Log::Progress (Perl)
date: 2021-03-06 18:25:14
---
[Log::Progess](https://metacpan.org/pod/Log::Progress) is Perl module to display progress in a configurable manner.

# Install Log::Progress
Install as usual with `cpanm Log::Progress`:
```
$ cpanm Log::Progress
Fetching http://www.cpan.org/authors/id/N/NE/NERDVANA/Log-Progress-0.12.tar.gz ... OK
Configuring Log-Progress-0.12 ... OK
Building and testing Log-Progress-0.12 ... OK
Successfully installed Log-Progress-0.12
1 distribution installed
```

At this point you shoule be able to `use Log::Progress` in your program without any complaints from `perl` :grin:

# Report progress

This is what contains my sample below:
1. Creation of a progress
2. Configure when to report progress
3. Set the max and current progress
4. Actually progress (and let `Log::Progress` report when appropriate)

```perl
use Log::Progress;

my $progress= Log::Progress->new();
$progress->squelch(.1); # Only emit messages every 10%
my $max = 20;
$progress->at(0, $max); # Set current progress and target

for (my $i = 1; $i <= $max; $i++) {
  sleep 1;
  $progress->at($i); # Will not report each time
}
```

And then I get this progress report:

![Log](/assets/images/8s0zny9k88uqi241ct2c.gif)

That's all!

![House](/assets/images/884k6dg22dk09jyub61z.jpg)
