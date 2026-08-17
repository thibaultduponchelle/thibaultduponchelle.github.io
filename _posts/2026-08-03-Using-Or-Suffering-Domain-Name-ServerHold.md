---
layout: post
title: Using Or Suffering (Domain Name) ServerHold
date: 2026-08-03 00:18:32
published: true
---

![](/assets/images/serverhold/stop.jpg)

Picture from [here](https://www.pexels.com/photo/wet-road-with-painted-yellow-stop-sign-29407196/), courtesy of [Jan van der Wolf](https://www.pexels.com/@jan-van-der-wolf-11680885/) (thank you!)

To get context, I'm an experienced [Domains Portfolio Manager](/Unsuspected-role-of-domains-portfolio-manager) and we really need to talk about the very strong [**serverHold**](https://www.icann.org/resources/pages/epp-status-codes-2014-06-16-en#serverHold) EPP status code!

## The EPP status codes
EPP status codes, also known as "domain name status code" indicate the status of a domain. They really signal where a domain name stands into its lifecyle (e.g. `pendingTransfer`, `renewPeriod`), how much it is protected (e.g. `client*Prohibited`, `server*Prohibited`) and sometimes, problems.

The strongest (and most worrying) codes are the ones starting with `server*` since they are status from the *registry* hence the entity ultimately managing the domain name.

As domain owners (end users), we can not retrieve EPP status codes for all domains, neither all TLDs (registries) behave the same regarding the EPP statuses, but most of them behave more or less the same regarding some major EPP status codes.

## The EPP serverHold
From all those EPP status codes, there's one that is terrible, powerful like the Thanos Gauntlet: that's **serverHold**.

This status has the effect to prevent the DNS resolution (hence the `DNS_PROBE_FINISHED_NXDOMAIN` when accessing), making a domain actually obsolete. 

For a long time, I considered this status as an ally, since it was set to a domain after we disputed it, hence to our advantage.

The usual processus would have looked like this:
1. Dispute domain name using UDRP
2. After few weeks, scammer's domain is suspended, domain does not resolve with status serverHold
3. After few months, domain is released (or transferred directly to us)

Please note that 1 and 2 can fit URS for a rapid suspension, but it's only a nice to have.

But serverHold is not always an ally and can strike in a more unpredictable and annoying way. 

## serverHold and the domain reputation

As I said, I used to appreciate the power of serverHold, since it played in our team of a long time, but then we got it backfire against us.
Indeed, when we decided to use a young domain, the low reputation made the registry suspend the domain DNS resolution. 

In practice, it consists in block lists flagging the domain as malicious (surfacing in [VirusTotal](https://www.virustotal.com/gui/domain/example.com)):

![virustotal](/assets/images/serverhold/virustotal-flags.png)


Or even in the report of [radar.cloudflare.com](https://radar.cloudflare.com/domains/domain/example.com):

![](/assets/images/serverhold/radar-cloudflare-categorization.png)

## Factors impacting domain name reputation 
Beyond bad luck, some missing precautions can lead to this situation:
- A young domain name
- Past record of domain name being flagged
- Low reputation naming (domain name and TLD)
- Low reputation hosting, like pointing apex to a shared service like vercel or ngrok
- Low reputation of registrar
- Not matching the TLD use case
- Low reputation registry (weak/uncommon registry)

Ideally, production websites should not land on "bought last week" domain names and young (or fragile) domain names should follow a warm up phase (clean apex, email records, TXT records verifying against webmaster tools and third parties, etc... for a very minimum of 6 months)

## How to fix a serverHold (resulting from domain reputation defect)
First, contact your registrar for help, but it really depends the level of support they want to provide. In clear, a MarkMonitor, NameShield, LexSynergy would help where GoDaddy, Cloudflare will not.
Second, contact the registry to understand the serverHold and ask for removal. The registry will probably point you to the third party security vendors that flagged the domain. 

Then you have to contact each third party security vendor to fix the false positive flagging. 

Monitor in VirusTotal how it improves, it's likely a matter of weeks in order to drop down to 0.

Don't forget to rescan domain in VirusTotal or you will end up with outdated informations:

![VirusTotal analysis date](/assets/images/serverhold/virustotal-analysis-date.png)

Check also [SpamHaus reputation](https://www.spamhaus.org/domain-reputation/) (but it has delay) and [Cloudflare Radar](https://radar.cloudflare.com/) (and submit recategorization if needed).

Once domain is not flagged anymore, contact again the registry to ask for removal of serverHold.

## Other considerations regarding domain reputation
It is difficult to fully fix a reputation defect. Even after restoring reputation, it can remain fragile and keep scars. Maybe better change the domain name (if young domain and recent product launch)?

I recommend to also prepare a backup domain (another TLD) and grow its reputation in parallel.

## Fighting a serverHold from dispute
I don't have experience in domain dispute against me, so take those informations with relative trust.

During dispute, you should receive a formal notification that would leave you 20 days to dispute the dispute.
In particular, you could challenge the following criterias:
- The domain is not confusing with attacker
- You have right or legitimate interest in using the domain
- It is used in good faith

Contact the entity mandated for the UDRP procedure and share your proof(s) regarding those.

If you can defend well one of them, then you should be able to stop the UDRP before your domain get suspended (hence the **serverHold**).

## Conclusion
The **serverHold** status can be your ally or your ennemy, depending on which side you position, but in any case, this EPP status is equivalent of a nuke and I wanted to share my experience about it, having lived both sides.




