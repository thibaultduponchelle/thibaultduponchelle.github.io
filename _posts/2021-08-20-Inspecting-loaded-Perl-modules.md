---
layout: post
title: Inspecting loaded Perl modules
date: 2021-08-20 12:03:59
---
```perl
#!/usr/bin/env perl

use Acme::Prereq::F; 

while (($k, $v) = each (%INC)) { 
    print "$k => $v\n";
}
```
That produces:
```bash
strict.pm => /usr/share/perl/5.26/strict.pm
warnings.pm => /usr/share/perl/5.26/warnings.pm
Acme/Prereq/F.pm => /usr/local/share/perl/5.26.1/Acme/Prereq/F.pm
```

# :tada: