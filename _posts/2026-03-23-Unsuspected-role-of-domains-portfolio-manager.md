---
layout: post
title: The unsuspected role of Domains Portfolio Manager
date: 2026-03-23 00:18:32
published: true
---

In almost every company exists an unsuspected role at the cross roads of operations (DNS/infrastructure/security), corporate governance and legal. This is a role that nobody actually suspects: 

**Domain Portfolio Manager**

Managing domains is a huge responsibility since it's even more than critical: Failing here can lead to the company disparition.
It's possible that a stolen domain takes weeks or month to get back (if any) and that company never overcome the reputation loss. 

## Glossary
- **Registrant**: Owner (e.g. "Your Company")
- **Registry**: Entity managing the TLD (e.g. Verisign for .com)
- **Registrar**: Accredited entity between company and registry (e.g. GoDaddy)
- **Reseller**: A possible intermediary (can be a registrar)
- **TLDs**: Generic name of a domain suffix 
- **gTLDs**: Generic top-level domain (e.g. .com), subgroup of TLDs
- **nTLDs**: Generic top-level domain (e.g. .guru), subgroup of gTLDs
- **ccTLDs**: Country specific top-level domain (e.g. .uk)
- **ccSLDs**: Country specific second-level domain (e.g. .co.uk) 
- **ICANN**: Non-profit organization managing ~~TLDs~~ registries (but *not* all)
- **IANA**: Organization managing resource allocations
- **NIC**: Often synonym of registry
- **WHOIS**: Query protocol to retrieve owner and details of a domain (but *not* all)
- **RDAP**: Standardized WHOIS
- **RDDS**: Registration Data Directory Services (comprise WHOIS and RDAP)
- **EPP**: Protocol used by registars to interact with registries

## How do we buy a domain?
- We don't buy domain, only rent
- Via registrars
- From 1 up to 10 years
- Then revew at birthdate
- At purchase cost

## Then...

"Let's renew all domains for 10 years and call it a day?"

![](/assets/images/domains/no.jpg)

If only... but NO

(very few TLDs are compatible)

## How much costs a domain?
- It depends the TLD 
- It depends the registrar
- It depends the name (flagged premium by registry?)
- It depends the reseller, if any
- It depends the current registrant (= owner), if any

## Examples
- example.com - USD 9 per year
- example.com in B2B registrar- USD 70 per year
- example.jobs (TLD)- USD 400 per year
- example.bank (TLD) - USD 1,200 per year
- example.game (not premium) - USD 300 per year
- money.game (premium) - USD 1,300 per year
- example.trade (auction) - USD 3,500 (one time fee) then USD 8 per year

## Price != Value
- Most valuable TLD remains .com but it solely costs USD 9 per year!
- Some registries want to make you believe their TLDs are valuable... 

**Don't be fooled!**

## How to transfer a domain?

![](/assets/images/domains/transfer.png)

1. Unlock domain
2. Share secret code (retrieved from loosing registrar) to welcoming registrar
3. Wait (up to 7 days)

(in general)

Risky operation... 🥵

## How to protect a domain
- Solid registrar (B2B, certifications, no past record of being hijacked...)
- Registry lock
- Secure access to registar (IP restrictions, 2FA, etc...)
- Scarce access to registrar and owner email (secret transfer code...)
- Keep whois email up to date
- Ensure auto-renewal of domains (but a serious registrar will imply it)
- Monitor payment failures and card expiration (or better: use wire transfer if B2B registrar)

## What possible registrar portfolio distribution?
### Small size company 
Not really a concern, any approach can make it

### Mid size company
- A B2B registar like **MarkMonitor**, **ComLaude**, **CSC Global** or **NameShield** for critical domains
- **Cloudflare** for non critical domains and low prices (retail prices, unbeattable)
- **GoDaddy** or **Gandi** (registrar is their business) for more TLD-compatibility and still low prices
- Another B2B registrar like **SafeBrands** or **LexSynergy** for exotic (not critical) domains

Clean, optimized for lowering risks, maintenance and bill

(you can pay me a beer for this)

### Big company
Same than mid size (with bigger team on company side) or think about going for single registrar approach (but expensive!).

## Realize the effort
- Hundreds of domains will renew all along the year (week end, vacations, Christmas, New Year's Eve, etc...)
- They will produce thousands of emails each year, and you have to review them carefully!
- Registrant details updates
- Almost each TLD (in particular ccTLDs) has its own rules for registration and renewal

Looks a job for automation and AI! But whois limitations (e.g. try to whois for example.mt) and risks associated with API makes it difficult to *fully* automate. 

## There are so many registrars
```Ionos, OVH, GoDaddy, NameCheap, Cloudflare, EuroDNS, Nic.ae, MyNIC, Gandi,  UnstoppableDomains, OnlyDomains, NIC-MT, WhoGoHost, EuropeRegistry, Enom, ExaBytes, EnCirca, NIC.cy, IPServerOne, Marcaria, MyNIC, Afternic, BulkRegister, OpenSRS, Dominder, BlueHost, AsiaRegister, Hover, BlackNight, JapanDomains, SafeBrands, AfriRegister, TuCows...```

Your early ccTLDs purchases would likely fall into the trap of local registrars...

## Strategic coverage and defensive registrations
Starting from mid size company, you need to work on strategic coverage and defensive registration.

Following options are good to explore:
- ccTLDs of countries where you have an office
- ccTLDs of countries considered possible markets
- ccTLDs almost considered gTLDs
- nTLDs sounding relevant to our business
- gTLDs with common typos 
- gTLDs homonyms/homoglyphs
- gTLDs brand + relevant keyword combinations
- Block lists (check list if valuable for you?)
- Dispute scammers domains (WIPO + UDRP, URS, TMCH)

Even if domains are not really expensive by design, you still need to balance with budget

Deciding when to stop is a typical job of domain portfolio manager

## Why balancing?
Sure you want to strenghten the brand.

But you could spend all your money and it would still remain partial coverage.

Because defensive registration is a "lost battle" 😔

(I estimate buying all *available* TLDs for a name to cost between $100K and $200K per year)

## The importance of registrant *email*
- **Zero compromise on registrant *email***, of the utmost importance!
- **Zero compromise on registrant *email***, of the utmost importance!
- **Zero compromise on registrant *email***, of the utmost importance!
- **Zero compromise on registrant *email***, of the utmost importance!
- ...

Owning the email = owning the domain, don't mess with it

## The importance of registrant *details*
- Local presence (registry requirement)
- ~~OV/EV SSL certificate *issuance*~~ (no longer true since 2025)
- Audits (regulator can request screenshot)
- ICANN policy ("must to be up to date")
- Disputes (against company)

So we want registrant *details* to be up to date all the time, right? 🤓

## Yes, *in theory*
But also consider that:
- Once issued, certificate authorities don't monitor registrant (no revocation)
- Once audited, regulator don't monitor registrant
- ICANN don't enforce policy (beyond registrant *email*)
- Change has costs (fee + think registry lock)
- Also **Change = Risk** 😬 (triggers verifications: "COR", "RAA", etc...)

![](/assets/images/domains/touching-domains-can-awake-the-dragons.png)

And you don't want to awake the dragons!

## Still better to update registrant details
- With extra care
- Also remember that change generally locks the domain for 60 days

## DNS != Domain
- You generally want a DNS service independent from registrar
- Not the main purpose but it helps with transfers

## But registrar "pilots" DNS
- Set NameServers via registrar
- Glue records (conceptual example: nameserver.example.com)
- DNSSEC:
  - Set DS record via registrar
  - Not all registrars are compatible (beware when transferring!)

## "ConsoliDate"
- Align domains renewal date, when registry and registrar implement that

## Conclusion
I hope you enjoyed this tour in the shoes of a domain portfolio manager.

This is an extremly vital role in a company, dealing with risks and vital assets. 
