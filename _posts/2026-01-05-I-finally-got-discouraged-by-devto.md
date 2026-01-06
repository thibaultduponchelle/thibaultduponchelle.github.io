---
layout: post
title: I finally got discouraged by DevTo
date: 2026-01-05 00:18:32
published: true
---

Years ago, I started to blog more seriously. Not for an online presence, not for fame, but for sharing (and writing).

I was blogging mainly about Perl.

I decided to use [DevTo](https://dev.to/).

5 years later, I lost hope and posted this on a Slack channel about Perl:

> My next blog post will be my 100th blog post on devto. With a vast majority about Perl. Despite my “call to Perl developers to post on devto”, I have to admit that devto is not the new eldorado and we failed to really build a strong “scene” here. [...]

### Escaping the Perl blogging scene ghetto
It was known at that time that Perl blogging scene had a "platform" problem, where people blogging about Perl were actually isolated from the rest of the world. 

In 2020, I chose [DevTo](https://dev.to/thibaultduponchelle), effectively joining the vibe (e.g. [1](https://blogs.perl.org/users/gabor_szabo/2020/11/perl-on-devto.html), [2](https://blogs.perl.org/users/joel_berger/2020/09/crosspost-nginxcertbot-recipe.html) and [3](https://perlhacks.com/2020/09/blogging-for-perl/)) and I even made a [call to Perl blogger to come on DevTo](https://dev.to/thibaultduponchelle/a-call-to-perl-bloggers-to-come-on-dev-to-27ee), with the hope to develop a "Perl blogging scene" here.

In 2021, it somehow [seemed to work](https://dev.to/thibaultduponchelle/6-months-of-blogging-the-onion-46i3) at first.

It was with great help of reposts from [the Perl Weekly Newsletter](https://perlweekly.com/) (thank you [Gabor](https://szabgab.com/)! thank you [Mohammad](https://whitecamel.org/p/mohammad_sajid_anwar.html)!) along with some other Perl figures posting on the platform.

But then it plateaued in 2022 and the trend even reversed in 2023.

If you want some insiders hints, here are stats of my top posts:

![Thibault Duponchelle DevTo leaderboard](/assets/images/devto-leaderboard.png)

(this is the top, most of my posts are in the range of 100~400 views)

In 2024, I got discouraged and stopped posting in DevTo (then migrated out).

I would argue that DevTo was an unsuspected poor move.

I will explain why now.

### The terrible shadow ban
If DevTo sounded a good choice of pluralism, I discovered later that it was shadow banned by most if not all newsfeeds.

What is *shadow ban*?

It consists in newsfeeds or forums (like HackerNews, Reddit, etc...) ignoring (silentely) your repost.

You post your blog entry on DevTo, go share on Reddit /r/perl or HackerNews and it never gets any vote.
You start to doubt, it's totally possible that's because it's low quality, or maybe it's your user?
You create another user, post again. Create yet another user from another device and never see the post to vote on.

This is annoying, in particular when you think that using DevTo was supposed to get us out of the "ghetto", but with the impossibility of sharing, we just moved into another echo chamber...

In 2023, you can see that later I accepted my fate:

When I tried to post [Open Letter To Tim O'Reilly To Free The Perl Camel](https://dev.to/thibaultduponchelle/open-letter-to-tim-oreilly-to-free-the-perl-camel-k3i) it got 1 point. OK, it's shadow banned. So I finally reposted the short post content into its own [HackerNews entry](https://news.ycombinator.com/item?id=36648949) and this time it made its way to the front page.

![DevTo shadow banned in Hacker News](/assets/images/devto-hackernews-shadowban.png)

### The low quality problem
For years, DevTo seemed to be filled with "5 best TypeScript frameworks that you need to know", "10 Kubernetes design patterns that you have to understand"... Clickbaits posts following the trend du jour.

The platform had a reputation of being junior oriented, so far so good no problem, but it somehow discouraged a bit to do deep research posts.

(Later?) DevTo added the possibility to flag post target audience (for selecting readers level to your posts) and also user level (for selecting posts appearing in the feed). But it seemed to never really fix anything.

edit: I can't find the post target audience setting anymore

### Spam spam spam everywhere
There's a sad truth, that DevTo was full of spam and spammers.

I was not only spectator of that, I did moderation for a while, but it was discouraging to see so many spam invading the platform, again and again.

Spam problem was not taken seriously for years.
I think this was addressed in 2025, seeing [several pull requests](https://github.com/forem/forem/pulls?q=is%3Apr+spam+is%3Aclosed) about that topic (?)

And I'm not even speaking of AI generated content. 

### DevTo broke my posts
Some time ago, I think DevTo migrated their image hosting from Cloudinary to Amazon S3 and broke posts, e.g. [My TPRCiC 2020 review](https://dev.to/thibaultduponchelle/my-tprcic-2020-review-1187) (that should look like [this](https://thibaultduponchelle.github.io/My-TPRCiC-2020-review)).

It looks like a bad `sed` produced this:
`https://res.cloudinary.com/practicaldev/image/fetch/s--eIfVFZsG--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/s34jbuc2ky9ic71ehy3j.jpg`

I can fix it one by one by editing my posts (or probably mass edit via API), but I simply lost confidence in the platform at that point.

### Good but not perfect at drafting
The platform has few other minor problems, like not being very "draft oriented": 
- When post goes out, it seems to get placed in the thread ordered by draft date and not published date, effectively making it out of anyone eyes (and it reflects in the reader stats)
- Draft gets easily mixed up even when not using multiple devices or browser windows.

This is minor.

### Conclusion
I don't want to be too harsh with DevTo, since they are running on a [free platform](https://github.com/forem/forem) and it's really cool.

You could also argue that I or "we" could run our own instance of it and get a taste of how difficult is moderation of content and defending reputation of the platform. Totally true! (and the free code permits that <3)

If its official *instance* DevTo had the room to be great, it failed for years, and now I can't see how it could escape from this state.

So, after more than 100 posts, after having fixed posts, moderated hundreds of others, flagged tens of spammers, I got discouraged and left.

Thank you for the fish, still, wish you the best DevTo, but I'm done.


