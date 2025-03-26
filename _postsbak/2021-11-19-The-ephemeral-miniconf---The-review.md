---
layout: post
title: The ephemeral miniconf - The review
date: 2021-11-19 09:26:55
---
**The ephemeral miniconf** just ended, it was a real success :grinning: and I want now to share my review of the event (like I did for [TPRCiC 2021](https://dev.to/thibaultduponchelle/tprcic-2021-review-56k3) and [TPRCiC 2020](https://dev.to/thibaultduponchelle/my-tprcic-2020-review-1187))

Let's call it **TEM 2021** then :grinning: even if I promised it would be the first an *last* edition of this miniconf :scream:

This review is of course a bit *different* from others since this time I attented, spoke, but most of all **I was the organizer**...:muscle:

## Start of the miniconf
The miniconf started on time by a quick introduction that people would kill for (:grinning:).

I think I shared planning links, some "thanks" and few utils infos for the meeting ("remind me to record").

## Final planning
(See it on the [website](https://thibaultduponchelle.github.io/the-ephemeral-miniconf/) if you prefer)

| Date                | Title                                                   | Speaker                    |
|---------------------|---------------------------------------------------------|----------------------------|
| 18/11/2021 - 15h00  | Keynote                                                 | Thibault Duponchelle       |
| 18/11/2021 - 15h10  | Native GitHub actions in Perl                           | Juan Julián Merelo Guervós |
| 18/11/2021 - 15h40  | Do you really know XML?                                 | Thibault Duponchelle       |
| 18/11/2021 - 16h10  | Automatic Observability                                 | José Joaquín Atria         |
| 18/11/2021 - 16h40  | Raku Quiz                                               | Group                      |
| 18/11/2021 - 16h50  | Open Food Facts                                         | Stéphane Gigandet          |
| 18/11/2021 - 17h20  | Cunningham's Law: A Year of Being Wrong on the Internet | Mark Gardner               |
| 18/11/2021 - 17h50  | Perl Quiz                                               | Group                      |
| 18/11/2021 - 18h00  | LemonLDAP::NG                                           | Clément Oudot              |
| 18/11/2021 - 18h30  | Once Upon Perl Acronyms                                 | Thibault Duponchelle       |
| 18/11/2021 - 18h40  | End                                                     | Thibault Duponchelle       |

## Native GitHub actions in Perl 	

[Juan Julián Merelo Guervós](https://dev.to/thibaultduponchelle/the-ephemeral-miniconf-speaker-annoucement-4n8f) presented maybe the more "Devops" talk of the miniconf (competing with José Joaquín Atria) about GitHub actions and containers. Perl is originally probably the best tool for sysadmin and devops (because it's close to system, very UNIX oriented, easy to deal with processus and files...) and GitHub actions (or Orb or whatever) provide a fantastic facility (with `perl` always there) for continuous integration, continuous test and CD/CD. 

![JJ Merelo](images/d3mzibsitm8pe74dggf7.png)

I'm personally well versed in this area, but it has to be spread more generally in the Perl community (I see you @szabgab)

It was a very clean and professional talk, did I say we had only experienced speakers?

## Do you really know XML?
This title probably makes you not dream that much but during the creation of an [XML module for minification](https://metacpan.org/pod/XML::Minifier), I had to dig very deep in XML features and spec (and libxml2 code) to cover all cases. 

This presentation requires you to know XML (who does not!) to look with me at "corner invalid syntax things" (nested comments, duplicate attribute...), security (Billion Laughs attack, XXE injections, Quadratic blowup...), "lesser known" XML features (xml::space, DTD default attribute). 
![Tib](images/92sfn0i2ail9vn7a2e1m.png)
Then I browsed all possible libxml2 parsed node types spending more time on the ones that are "mysterious" (because this is where is the fun actually) and finally talked about how do I managed (DWIM) XML minification.

## Automatic Observability
[José Joaquín Atria](https://dev.to/thibaultduponchelle/the-ephemeral-miniconf-jose-joaquin-atria-2m5h) came with a solid technical talk about Perl and [NewRelic](https://newrelic.com/) monitoring. His talk is built upon the creation of [NewFangle::Agent](https://github.com/cv-library/NewFangle-Agent) which allows you to easily monitor deep Perl trace events in NewRelic. 
![Automatic Observability](images/f15szyzf9qydgn6v26bs.png)
As I said, very solid talk (he is experienced), I always enjoy native topics (I'm hanging out on [#native channel on IRC](https://www.irc.perl.org/channels.html) :grinning:)

## Raku Quiz
After these first great talks, there was a **QUIZ** or as we tend to call it "a Kahoot"! 

Questions were about Raku, from really easy to some harder ones about Raku internals. It was fun...:+1:

![Raku Quiz](images/j4uq2nc2zc5z3lrv2ic0.png)

And at the end, @sjn won:
![Podium](images/rb1sorv1qhc71gcjrqdr.png)

## Open Food Facts
As I said and repeat, [Open Food Facts](https://fr.openfoodfacts.org/) is a real Perl flagship. It's for me a model of successful Free Software project, and a very pragmatic one above all.

The project was presented by [Stephane Gigandet](https://dev.to/thibaultduponchelle/the-ephemeral-miniconf-speaker-annoucement-314d):
![Open Food Facts](images/pgk7uqtp5e5465al13un.png)

Very good talk, this project is cool and looking for manpower! What are you waiting for?

## Cunningham's Law: A Year of Being Wrong on the Internet
[Mark Gardner](https://dev.to/thibaultduponchelle/the-ephemeral-miniconf-speaker-presentation-i0e) kindly accepted to speak at **The ephemeral miniconf** and I thank him like every other speakers.

His talk was about some technical errors that have slipped into his numerous blog posts. Since he is a senior Perl programmer, these errors are traps (not language misunderstanding) and very interesting to analyze in a follow-up!

![Being wrong](images/g8u7d0qqvgzvbwxv23m6.png)

EDIT: I forgot to mention that while sharing his talk subject on twitter, Mark has got an hilarious answer from [Ward Cunningham](https://en.wikipedia.org/wiki/Ward_Cunningham) himself! :flushed: :scream:

![The ephemeral miniconf and Ward Cunningham](images/46qnorgdn0otr96q1jzu.png)

## Perl Quiz
It was time for a second quiz!
![Perl quiz](images/en9ugtdmveapv8y3h6hv.png)

This time about Perl with more questions, and the podium was  bitterly disputed :grinning:

This time, @mjgardner won! Congrats :tada:

## LemonLDAP::NG
[Clément Oudot](https://dev.to/thibaultduponchelle/the-ephemeral-miniconf-clement-oudot-2a1a) kindly accepted to present [LemonLDAP::NG](https://lemonldap-ng.org/welcome/) from which he is one of the main core maintainers.

His talks was very much appreciated and he presented a lot LDAP and "auth" concepts.

![Clement LDAP](images/sy0oxgiry7jp4g7zobm7.png)

And guess what, he came with a ukulele and sang a LDAP song :scream:
![Ukulele](images/s4y3d20gqcgohk66zm0u.png)
(I don't have the picture of him singing)

Here is the song lyrics:
![Song](images/iqx47x8lyggzxwqg2kjm.png)

## Once Upon Perl Acronyms
I prepared a second talk, this time more "fluffy". It was lightweight but worked well and people enjoyed :grinning:
![Once Upon Perl Acronyms](images/6hl5ufeyx0pk9fe38pkf.png)

And it was a nice way to conclude **The ephemeral miniconf**!

We then opened mics and put cameras on and talked briefly, then I said I was proud of what we achieved together.

And FWIW here is a well deserved GIF:
![Camel GIF](images/7ywrmbxuy9hosgdlfh1h.gif)





