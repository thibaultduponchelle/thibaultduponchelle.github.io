---
layout: post
title: Migrate to Mojolicious 9 - Quick feedback
date: 2021-03-25 07:11:59
---
Today I migrated one application to [Mojolicious 9](https://mojolicious.org/) :tada:

![Mojolicious 9](/assets/images/0wk9a9c05a3sntlwkydv.png)

Since I had some errors, I just wanted to share if it could help others to migrate quickly.

EDIT: as commented by @grinnz, there is the [upgrading document](https://github.com/mojolicious/mojo/wiki/Upgrading) that should be checked for tips before any attempt to migrate.

It's not a big application (~2000 lines of code) but it has authentication, external calls, DB access and a flat config loaded at startup. It uses some plugins like [Authentication](https://metacpan.org/pod/Mojolicious::Plugin::Authentication), [Status](https://metacpan.org/pod/Mojolicious::Plugin::Status), [Config](https://metacpan.org/pod/Mojolicious::Plugin::Config) and [AccessLog](https://metacpan.org/pod/Mojolicious::Plugin::AccessLog). 

I like to think it is a *small but good coverage* of Mojolicious features.

I said I had errors, but actually very few and I will give my solutions right below.

#### Can't locate object method "route" via package "Mojolicious::Routes"

In my case it was a matter of replacing something like:
```perl
my $auth = $r->route('/members')->over(authenticated => 1);
```
per something like:
```perl
my $auth = $r->under('/members')->requires(authenticated => 1);
```
I wonder if code snippets shown on [Mojolicious::Plugin::Authentication doc](https://metacpan.org/pod/Mojolicious::Plugin::Authentication) are still valid for Mojolicious 9 (?).

#### Undefined subroutine &App::Controller::App::decode_json called

This sub seems to have moved, I fixed by simply adding:

```perl
use Mojo::JSON qw(decode_json encode_json);
```

## Conclusion
I like Mojolicious :heart: and the way it is so actively developed. It's true that there is sometimes some small breakages (I remember in the past a breakage about [slurp](https://github.com/mimosinnet/presentation/pull/1/files)) but it is always well documented and painless :+1:

Long live to [Mojolicious](https://mojolicious.org/)!