---
layout: post
title: A call to Perl bloggers to come on dev.to
date: 2020-12-02 12:02:31
---
## Some history 
Perl has its own platform for blogging with Perl specifics posts only. It is maybe a particularity of Perl community, even if I'm not sure about that. 

From what I know, between 2001 and 2010, Perl developers were initially blogging on [use.perl.org](https://use-perl.github.io/) that was decommissioned in 2010.

![use.perl.org](images/bi4x42r6jth3jynfsy38.png)

Then they moved (partially) to [blogs.perl.org](http://blogs.perl.org/) or as some people call it "BPO".

![blogs.perl.org](images/1w6qc7veih2083muj74m.png)

I like the principle to have a dedicated place where you come to check Perl related posts... but unfortunately there seems to be long standing problems with [blogs.perl.org](http://blogs.perl.org/) :confused:

People report technical problems :
* Problems with authentication and/or reset password
* Problems with posting comments 
* Design outdated
* User experience when writing posts
* No easy upgrade path since it is based on an old derived/forked version of [MovableType](https://www.movabletype.org/) 

Before I continue, I just wanted to say « thank you » to all volunteers that are running BPO. The imperfections do not remove their effort to bring this valuable platform to the Perl community :+1:

## BPO revamping trials
There were already TPF 2 grants :
- 2015 - [Revitalize blogs.perl.org](https://news.perlfoundation.org/post/grant_proposal_revitalize_blog) - Jeffrey Goff (RIP)
- 2017 - [Revitalize blogs.perl.org](https://news.perlfoundation.org/post/grant_proposal_revitalize_blog_1) - Andre Walker

A "grant" is a mission paid by [The Perl Foundation](https://www.perlfoundation.org/) 

Both grants were trying to migrate to [PerlBee](https://github.com/Perl-Evozon/PearlBee) that is a blog engine written in Perl.

#### What went wrong ? What is the difficulty ? 
I don't know exactly, but I believe without any doubt that there were several problems that make it not straightforward at all and make these grants fail.

## What about now ? 
Despite these numerous problems, **BPO** is up and running, with reduced posting traffic (maybe 5 posts a week).

One of the former admin behind BPO seem [pushing](https://perlhacks.com/2020/09/blogging-for-perl/) to make people migrate elsewhere but without making it read-only or cutting the power (so far). They obviously don't want to invest any support in BPO since it is in a kind of "decommissioning" state.

Are bloggers happy or they tolerates the drawbacks ? I don't know.

**I WAS** a fervent supporter of keeping this "concept" running... 

...until recently :persevere:

I was even about to drop a [new idea](https://github.com/metacpan/prepan) on the table of possible replacements, but I finally refrained and time gave me the answer :smile:

I will elaborate below.

## #MyLife
Concerning blogs, I'm more a reader than a writer, and if I call Perl bloggers to come on DevTo, it is because I'm eager to read *your* posts. 

Anyway, recently I tried to write a bit more.

I found this schema on [rakhim.org](https://rakhim.org) and I found it very true :) 

(I circled where I'm standing)
![Blogs](images/yhzk2xbcsejivs4t2wbg.jpg)

Yes, I wrote a static website generator (in Perl) that is so quick and dirty and not generic that I will never made it public :D 

The main part looks like this :

```perl
my $n = 0;
sub build_site(\%$) {
	my $p = shift;
	my $dir = shift;
	$indent .= " ";
	for my $k (sort keys %$p) {
		if(ref $p->{$k} eq ref {}) {
			build_site($p->{$k}, "$dir/$k");
		} elsif($p->{$k}) {
			my @s = split('\.', $k);
			my $title =  shift @s;
			my $ext =  shift @s;
			if($ext eq "md") {
				$n++;
				print "Processing $dir/$k... ($n)\n";
				my $body = `perl Markdown.pl $dir/$k`;
				open($FH, ">", "$dir/$title.html");
				print $FH create_head($title);
				print $FH create_header();
				print $FH $menu;
				print $FH create_submenu($dir);
				print $FH $body;
				print $FH $ga;
				print $FH create_footer();
				print $FH create_foot();
				close($FH);
			}
		}
	}
}


build_site(%menu, ".");
```

And I also used [hugo](https://gohugo.io/) and I still use it for instance when contributing to [perl.com](https://www.perl.com/)

I recently also set up a blog using [jekyll](https://jekyllrb.com/) and [github pages](https://pages.github.com/)

And of course I used a customized-custom theme from [Project VeXed](https://github.com/akiritsu/pRoJEct-VeXEd)

If I "customized" it, it was mainly to make it more ["Perlish"](https://thibaultduponchelle.github.io/wawawa/pmtrx/) :smile:

![My blog](images/9tjua0xvfifv91wfjw04.png)
(do not look for this blog, I killed it some days ago)

Finally I spent the whole paragraph about the setup of blogs  so I should get extra points :smile:

![Elaborate on blog setup](images/0uw7rx2236jyorrzkxi0.jpg)

The #MyLife section stops here. The conclusion is that I experimented some solutions before to call people to join me here.

## Why I recommend DevTo
The user experience when writing is very good (to be honest, Medium and Wordpress are even better, but it is good enough).

Why not using medium then ? There is no [#perl tag](https://medium.com/tag/perl) and I feel like Medium is less a *developer* hub than DevTo.

There are also already some traffic here (at least as much as BPO) and some brand names.

The [#perl tag](https://dev.to/t/perl) is already administrated (by [Gabor Szabo](https://dev.to/szabgab) ! :))

The format is **Markdown** which is generally a good point (but not always, I can understand).

## The ghetto
BPO is a "Perl ghetto" which is both good and bad. Good because this is a what some readers are actually looking for, and bad because of non exposure to programming world. 

When you think that the biggest flaw of Perl is its reputation... :worried:

DevTo greatly offers the best of both. Your blog posts are open to broad (technical) audience but the [#perl tag](https://dev.to/t/perl) fully recreates the "ghetto" use case from an reader point of view (and it really works well).

## Conclusion
I'm not the first one to promote DevTo actually, I'm joining the call from [Gabor Szabo](http://blogs.perl.org/users/gabor_szabo/2020/11/perl-on-devto.html), [Joel Berger](http://blogs.perl.org/users/joel_berger/2020/09/crosspost-nginxcertbot-recipe.html) and [Dave Cross](https://perlhacks.com/2020/09/blogging-for-perl/) to ask you to build together the future of Perl blogging on DevTo !

Whatever you decide, "Happy Perl !" and please keep posting so I can continue to read you :smile:

(I was not paid by [DevTo](https://dev.to/) :smile:)



 





