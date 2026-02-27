---
layout: post
title: 4 Shades of CPAN Patching
date: 2026-02-26 00:18:32
published: true
---

For the sake of security but also fixing breakage or anything, I started to think about how to fight the CPAN ecosystem inertia.

Looking at [CPAN Report 2026](https://neilb.org/2026/01/13/cpan-report-2026.html) seems to point that it could be an increasing problem (even if I consider the report itself as positively plateau-ing).

A practical example is distributions on CPAN with long standing defects (preventing the build!), sometimes with trivial fix, never updated because of AUTHOR inactivity. When it comes to a security vulnerability, criticality is even well more serious.

Please note that it's not something we should reduce as a CPAN problem. CPAN is not particularly more impacted than other ecosystems, reading forums will give you similar frustrations from PyPI or RubyGems users. 

Furthermore, CPAN maintainers are also recognized for high sense of duty and respecting retro compatibility and stability, which makes it so pleasant to rely on bits from CPAN compared to other ecosystems.

Still, we can always aim for more, so read below if you want to know more about what are some options I explored to adress the CPAN intertia.

## 4 shades of patching

### Patching at the origin
I named it "CPAN Lieutenenant" in my [3 original Perl CPAN social concepts](https://thibaultduponchelle.github.io/3-original-Perl-CPAN-social-concepts) and if the exact implementation (if we even were willing to implement that, which I'm not convinced) is not defined, it basically consists in relaxing handover or co-sharing ownership.

My self assessment of this approach:
- I like this idea because it fixes upsteam.
- I don't like it because it only applies to CPAN (source of truth) and ignoring/desyncing source repo.
- I don't like neither because it breaks the [PAUSE operational model](https://pause.perl.org/pause/query?ACTION=pause_operating_model) and social contract with authors.
- I don't like because it's a big change, changing social tested and historical operating model

Notes: Please note that `Alt::` or [Developer releases](https://pause.perl.org/pause/query?ACTION=pause_operating_model) are already a lever to achieve that, but it's not patching the origin (different namespace or need to force dev releases).


### Patching in the installer
Then if we don't patch the origin, we can maybe patch during install?

`cpan` installer already has its patching facilities (via DistroPrefs) but what about other installers (mainly thinking about `cpanm` and `cpm`.

What should look like a patching mechanism?
- A very minimum code change into the installer
- Not being an hard requirement but runtime optional one
- Patch tooling in a separate module
- Patches stored elsewhere (website, github repo or a dedicated module)

This is what I implemented via the [Patch Tooling Proof Of Concept](https://github.com/thibaultduponchelle/archives/tree/main/cpansec-patch-tooling-poc) with an optional requirement of [CPAN::Patches](https://metacpan.org/pod/CPAN::Patches) (already existing module from [JKUTEJ](https://metacpan.org/author/JKUTEJ)). Patches are externally stored in another distribution (that can be uploaded by producer independently and updated by consumer each `cpm` run, or not).
The whole thing being hidden in `cpm` that is enabled via `--with-security-fixes`.

Like the following:
```bash
$ cpm install Acme::LSD --with-security-fixes
```

Ideally, I should have used DistroPrefs instead CPAN::Patches to buy compatibility with CPAN (and one less dependency), but that was and will remain a quick and dirty Proof Of Concept :)

My self assessment of this approach:
- I like this idea because it does not hurt operational model.
- I don't like it because it *still* requires changes in installer.

### The CPAN++
Sorry, no `cpanplus` was injured during this blog entry writing.

We could introduce an alternative version of distributions, being origin artifact + patch(es). but ready to be consumed.

It could be either hosted in MetaCPAN or another webserver. It should be opt-in in installers, either via alternative index and mirror or by specifying a flavor (like current "dev" flag).

This looks like pretty much what Linux distributions are doing.
This prevents forking at namespace level but introduces something like forking at CPAN level. (your humble servant is sweating after writing these words)

My self assessment of this approach:
- I like it because of the relatively more upstream position of it.
- I don't like it because it introduces yet another layer (CPAN, Linux distribution patches, DistroPrefs, CPAN++).
- I don't like it because it can end up with just forking CPAN

### The crazy idea
I remember exactly the time I got this idea, not because it's brilliant, but because I find it ingenious and crazy.
But I was not sure if it was actually good idea... or an abomination.

What if we patch "on-the-fly"?

Not via a forked CPAN nor a patcher inside installer, but something in between?

In practice in means proxying CPAN, so we can apply patches between CPAN and installer, with no installer code change (but opt-in).

And I produced in very few lines of code, a almost complete solution:

```perl
#!/usr/bin/env perl
use Mojolicious::Lite;
use Mojo::UserAgent;
use Archive::Tar;
use IO::Compress::Gzip qw(gzip $GzipError);
use IO::Uncompress::Gunzip qw(gunzip $GunzipError);
use File::Temp qw(tempfile);
use File::Copy;
use Cwd;

use CPAN::Tarball::Patch; 

my $ua = Mojo::UserAgent->new;

# Reverse proxy route
get '/*distpath' => sub {
    my $c    = shift;
    my $distpath = $c->param('distpath');

    # Fetch upstream file
    my $tx = $ua->get("https://cpan.metacpan.org/$distpath")->result;
    return $c->render(text => "Upstream fetch error", status => 502)
        unless $tx->is_success;

    my $body = $tx->body;

    my ($AUTHOR, $filename) = (split '/', $distpath)[-2, -1];
    my $tarball = join '/', $AUTHOR, $filename;

    
    # Only patch tarballs (.tar.gz)
    if ($distpath =~ /\.tar\.gz$/) {

	# ---- Write body to local file ----
	my ($fh, $filename) = tempfile(
		"rprox-XXXXXX",
		SUFFIX => ".tar.gz",
		TMPDIR => 1,
		UNLINK => 1,   # auto-delete on close
	);

	binmode $fh;
	print $fh $body;
	close $fh;

	print "Create $AUTHOR dir if not already existing\n";
	mkdir $AUTHOR if ! -d $AUTHOR;

	print "Copy $filename to $tarball\n";
	copy($filename, $tarball);
  
	my $patcher = CPAN::Tarball::Patch->new("/home/tib/rprox/prefs/", "/home/tib/rprox/patches/");

	print "Patch $tarball\n";
        $patcher->patch($tarball);
	
	print "Return raw stream of $tarball\n";
	my $patched_raw = Archive::Tar->new($tarball, 1)->write;
	my $gzipped;
        gzip \$patched_raw => \$gzipped
            or return $c->render(text => "Gzip failed", status => 500);

        $body = $gzipped;
    }

    # Propagate content type
    $c->res->headers->content_type($tx->headers->content_type);
    $c->render(data => $body, status => 200);
};

app->start;
```

In addition to `Mojolicious` and `Mojo::UserAgent`, this is relying on [CPAN::Tarball::Patch](https://metacpan.org/dist/CPAN-Tarball-Patch), a new module of mine to patch tarballs using match mechanism of venerable DistroPrefs.

It is important to note that [CPAN::DistroPrefs](https://metacpan.org/pod/CPAN::Distroprefs) is a core module, part of CPAN but with a public interface, please see [A CPAN DistroPrefs Example](https://briandfoy.github.io/a-cpan-distroprefs-example/) for learning more about concrete usage. 

It is also compatible out of the box with installers, because it relies on alternate mirror capability (not even index!).

The "prefs" are located in `~/rprox/prefs` and look like this:
```yaml
---
comment: "Patch Acme::LSD 0.04"
match:
  distribution: "^CONTRA/Acme-LSD-0.04.tar.gz"
patches:
  - "Acme-LSD-0.04-TIB-01.patch"
```
(adding that prefs are very powerful and customizable way to match a distribution)

And a patch like this:
```diff
--- /lib/Acme/LSD.pm.orig       2020-03-12 18:07:00.000000000 +0100
+++ /lib/Acme/LSD.pm    2025-05-12 07:33:33.010780504 +0200
@@ -19,7 +19,7 @@ sub PRINT {
         my $copy = $str;
         $copy =~ s/[^\w']/ /g;   # convert all non-words into spaces
         $copy =~ s/ +/ /g;       # convert all multiple spaces into single space
-        $copy =~ tr/A-Z/a-z/;    # convert all words to lowercase
+        $copy =~ tr/a-z/A-Z/;    # convert all words to uppercase
         foreach my $char (split(//, $copy)) {
             my $r = int(rand(6)) + 31;
             my $s = int(rand(8));
```

A simple `--mirror` is enough to tell `cpanm` or `cpm` to use proxy.

With `cpanm`:
```bash 
$ cpanm -Llocal --mirror http://localhost:3000 Acme::LSD
--> Working on Acme::LSD
Fetching http://localhost:3000/authors/id/C/CO/CONTRA/Acme-LSD-0.04.tar.gz ... OK
...
Successfully installed Acme-LSD-0.04
5 distributions installed
```

With `cpm`:
```bash
$ cpm install -Llocal --mirror http://localhost:3000 Acme::LSD
DONE install Acme-LSD-0.04
1 distribution installed.
```

On the proxy side, the proxy download, extract, patch, compress the artifact:
```bash
$ morbo rprox.pl 
Web application available at http://127.0.0.1:3000
[2026-02-27 17:21:04.87137] [344416] [trace] [juolRtwLbUw7] GET "/authors/id/C/CO/CONTRA/Acme-LSD-0.04.tar.gz"
[2026-02-27 17:21:04.87249] [344416] [trace] [juolRtwLbUw7] Routing to a callback
Create CONTRA dir if not already existing
Copy /tmp/rprox-ktUaEb.tar.gz to CONTRA/Acme-LSD-0.04.tar.gz
Patch CONTRA/Acme-LSD-0.04.tar.gz
Prefs /home/tib/rprox/prefs/
Patch with Acme-LSD-0.04-TIB-01.patch
Patching CONTRA/Acme-LSD-0.04.tar.gz with /home/tib/rprox/patches/Acme-LSD-0.04-TIB-01.patch
Return raw stream of CONTRA/Acme-LSD-0.04.tar.gz
```

Proxy is only a pass-through for distributions not matching any distroprefs.

It is totally a Man In The Middle approach, but not more than Cloudflare is.
Also it remains a totally opt-in choice to the user to use this "proxy".

It could be used as a local proxy, or hosted via a `patchpan.org` or something.

Of course it needs it needs to handle HTTPS (and handle TLS temination).
Also it needs to handle more formats, not just tar.gz

Also, it needs to rewrite signature when using with `cpan`, or you will get:
```bash
Checksum mismatch for distribution file. Please investigate.
```

My self assessment of this approach:
- I like it because no change on installers
- I like it because it does not look like forking CPAN
- I don't have any negative for it

I don't know what I will do next.
