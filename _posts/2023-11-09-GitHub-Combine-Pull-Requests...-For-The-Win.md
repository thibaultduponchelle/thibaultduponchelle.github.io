---
layout: post
title: GitHub Combine Pull Requests... For The Win
date: 2023-11-09 17:03:20
---

![Cross](/assets/images/cross.png)

Picture from [Lance Grandahl](https://unsplash.com/photos/brown-metal-train-rail-near-rocky-mountain-during-daytime-nShLC-WruxQ)

In GitHub, whether you want to improve merge velocity, test interdependent changes or setup some sort of releasing model, you could be interested in grouping code changes.

It is called "bundling" or "combining" pull requests.

It allows multiple pull requests to be built and tested together (in CI) and qualified together (e.g. pre-production deployment with shadow traffic).

In order to achieve this easily, you would need some automation. You're lucky, I'm going to share an elegant solution to solve this.

(before we continue, also think about [GitHub merge queues](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue))

## Demo!
I have 2 pull requests (from forks) targeting `main`. They have passed minimal tests running on PR but I now would like to run _long_ and _consuming_ tests together. I also want to check they work well together without merging first one of them to `main` (or to a release branch).

My plan for the two following changes is to target the next release `v2.3`, so I added a label `v2.3` to the pull requests:

![Label v2.3](/assets/images/jwq8ug4jdxl7p32ceutm.png)

In order to trigger the bundle creation, I create the branch `v2.3` from `main`

![Create branch v2.3](/assets/images/m80bhb955e05b2bnsfx8.png)

Once I finished to create branch, it already started to run an action:

![Combining](/assets/images/n28c5ymg1baez2cet7n1.png)

After seconds, the run is finished:

![Combined](/assets/images/1v7p47nqbp32d8qsgedx.png)

A new pull requests (targeting `main`) appeared: 

![New PR](/assets/images/t6ogvak0e4ii2bs6b9dr.png) 

The pull requests contains well the 2 pull requests changes (and branch `v2.3` was updated):

![PR combined contains 2 PRs](/assets/images/60k5wz4ak1pb1glpgsz4.png)

Later, when the bundled pull request will be merged, the combined pull requests will be automatically merged:

![Remotely merged](/assets/images/1zyygr8qzgunxouryffy.png)

## Hello "combine-pull-requests"
This magic can happen thanks to the great [combine-pull-requests](https://github.com/bobvanderlinden/combine-pull-requests) :tada:

Thank you [Bob van der Linden](https://github.com/bobvanderlinden) for this :+1: :rocket:

This GitHub action makes it deadly simple to combine multiple pull requests based on their labels.

My preferred workflow consists in triggering bundle by branch creation (but you can use other events) then push and open a pull request to `main`.

I know you want to see the code, please find below my setup:
```yml
name: Combine
on: create
      
permissions: write-all
      
jobs:
  combine:
    runs-on: ubuntu-latest
    if: ${{ github.event.ref_type == 'branch'}}
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: bobvanderlinden/combine-pull-requests@master
        with:
          label: ${{ github.event.ref }}
          repo-token: ${{ secrets.GITHUB_TOKEN }}
      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          branch: ${{ github.event.ref }}
      - name: Create pull request
        uses: devops-infra/action-pull-request@v0.4.1
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          title: "[${{ github.event.ref }}] combined!"
          body: ""
          source_branch: ${{ github.event.ref }}
          target_branch: main
          template: .github/BUNDLE_TEMPLATE.md
          label: "bundle
```

Then you would probably put your build-test-deployment... at the end of this same workflow.

Or you can leave the responsibility to another workflow. There's various manners to differentiate the bundle from other pull requests, for instance you can filter the label `bundle`.

To give you an example on how you would run/skip a workflow based on PR having the label `bundle`:
```yml
on:
  pull_request:
    types:
      - opened
jobs:
  run_if:
    if: contains(github.event.pull_request.labels.*.name, 'bundle')
    runs-on: ubuntu-latest
    steps:
      - run: echo "This is a bundle, run more tests"
```

## What else? 
What if I pushed a new commit to one of the pull request? Just need to delete and recreate branch `v2.3`. Same procedure applies if I want to add or remove a pull request from the bundle.

Customize to your needs, you can listen to more events than only `on: create` :innocent:

Another great thing with labels is that same pull request can belong to multiple bundles :fire:

## Conclusion
You should design tooling and branching model that suits you the best, so maybe this is not for you, but I really like how elegant is this workflow and I needed to share.

I hope you can also find it useful for you. 

Then, now it only remains for me to wish you "happy hacking!" :grin:
