---
layout: post
title: Check markdown links with github action
date: 2021-02-08 16:19:26
---
In a previous [blog post](https://dev.to/thibaultduponchelle/check-links-programmatically-with-perl-1a14), I discussed checking links with Perl and [LWP::Simple](https://metacpan.org/pod/LWP::Simple) then [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent).

My original idea was to keep [perlres](https://github.com/thibaultduponchelle/perlres) (a directory of Perl resources) up to date.

My previous post discussed the links checker but ignored the markdown parsing. This time, I propose to use a github action that will do the whole thing, elegantly.

During my research, I found 2 github actions to check links in markdown files, both based on markdown parser written in javascript.

[lychee-action](https://github.com/lycheeverse/lychee-action) based on [lychee](https://github.com/lycheeverse/lychee-action) and [github-action-markdown-links-check](https://github.com/gaurav-nelson/github-action-markdown-link-check) based on [markdown-links-check](https://github.com/tcort/markdown-link-check).

I tried the second one, that has more "stars" :grinning:

# The code
Simple, I just copy pasted the code provided by the maintainer !

```yaml
name: Check Markdown links

on: push

jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: gaurav-nelson/github-action-markdown-link-check@v1
```

In a file `.github/workflow/checklinks.yml` and on a branch `checklinks` (to test my stuff before integrating in the main branch).

I push the code, it starts testing, freezes a moment without logs (about 700 links to check) and fails admirably.

Yes, this github action fails on dead links ([lychee-action](https://github.com/lycheeverse/lychee-action) seems to behaves differently on this point)

## Do not fail on error
First, I have some "flaky" links, so I would prefer to not fail but only report.

The solution is `continue-on-error: true`

So this first customization is fine but my action is still not perfect.

## Do not run on every push
I often edit 3 typos in a row of 3 commits, it's too brutal to run at each code push, I would prefer to schedule it once a week:

```yaml
on:
  schedule:
  - cron: "0 13 * * 1"
```

See this other [post](https://geoffhudik.com/tech/2020/10/05/automate-checking-markdown-links-with-github-actions/) from where I extracted the cron line.

## 429 Too Many Requests
This is the typical github answer after too much requests, so I would like to ignore this status when it happens.

To achieve this, I added a `mlc_config.json` to my root git directory and added this config inside:

```json
{
  "aliveStatusCodes": [429, 200]
}
```

And finally look at our nice report:
![Links](images/qxo8uke58alz3vkyyhol.png)

And the errors:
![Errors](images/8x2dogbksbf997zpx1js.png)

# Conclusion
You can see my addition in this [Pull Request](https://github.com/thibaultduponchelle/perlres/pull/25/files)

The final action code is:
```yaml
name: Check Markdown links

on:
  schedule:
  - cron: "0 13 * * 1"

jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: gaurav-nelson/github-action-markdown-link-check@v1
      continue-on-error: true
```

With `mlc_config.json`:
```json
{
  "aliveStatusCodes": [429, 200]
}
```




