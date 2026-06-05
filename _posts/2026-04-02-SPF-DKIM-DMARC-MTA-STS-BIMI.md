---
layout: post
title: SPF DKIM DMARC BIMI VMC MTA-STS TLS-RPT...
date: 2026-04-03 00:18:32
published: true
---

With constant phishing attemps, it becomes increasingly important to protect emails.
There are mechanisms for this, both for inbound and outbound as well as authenticating more with BIMI against your customers.

In addition, email providers pushed very hard for DMARC (in 2024, Gmail and Yahoo enforced it), effectively forcing everyone to get interested in this topic!

Let's embark with me on everything you need to know to implement this end to end.

## Glossary
- **Inbound**: when we receive an email
- **Outbound**: when we send email
- **Deliverability**: ability for an email to reaches destination
- **MTA**: Mail Transfer Agent (e.g. postfix)
- **MSA**: Mail Submission Agent (e.g. postfix)
- **MUA**: Mail User Agent (e.g. gmail)
- **SPF**: Sender Policy Framework
- **DKIM**: DomainKeys Identified Mail
- **DMARC**: Domain-based Message Authentication, Reporting, and Conformance
- **ARC**: Authenticated Received Chain
- **BIMI**: Brand Indicators for Message Identification
- **VMC**: Verified Mark Certificate
- **STARTTLS**: opportunistic encryption
- **SMTPS**: implicit encryption
- **MTA-STS**: SMTP MTA Strict Transport Security
- **TLS-RPT**: TLS Reporting
- **MAILFROM**: "routing" FROM
- **Header FROM**: "signature" FROM (easily spoofed or aliased)

The very minimum triplet is SPF/DKIM/DMARC, let's start with this.

## SPF
- Sender designates autorized senders (IPs) in DNS TXT record
- Receiver checks if sender is authorized

#### Setup SPF
- DNS TXT record
- `v=spf1 -all` - "I don't send any email"
- `v=spf1 ip4:104.18.26.120 -all`

#### Setup SPF Examples
- TXT record example.com resolving to `v=spf1 include:_spf.google.com [...] -all`
- `_spf.google.com` resolving to `v=spf1 ip4:74.125.0.0/16 [...] ~all`

#### More about SPF
- Includes (that can includes)
- Can be delegated (not common)
- Various level of fails (- or ~)

## DKIM
- Sender signs email
- Receiver verify with public key found in DNS TXT record
- Can be delegated (not common)

#### Setup DKIM
1. Get DKIM (pubkey) from provider (Google, Mailgun, etc...)
2. Install DKIM as TXT record selector._domainkey

#### Setup DKIM Examples
- DNS TXT record
- `v=DKIM1; k=rsa; p=MIIB...IDAQAB`
- In email, `DKIM-Signature: d=example.com; b=Ms9[...]PpQ4==`

## ARC
ARC is involved in forwarding only, it's very possible that you never have to care about that.

This is my case, so I won't give any detail on it.

## DMARC
- Policy on top of SPF and DKIM
- Can be delegated (VERY common)

#### Setup DMARC
- DNS TXT record
- `v=DMARC1; p=reject; rua=mailto:dmarc@example.com;`

1. DMARC enabled
2. Failing DMARC are rejected (can be none or quarantine)
3. Send aggregated reports to dmarc@example.com
4. Optionally: Send forensic reports (detailed failure)

#### Setup DMARC Reporting
- Fields `rua` and `ruf` in `_dmarc`
- Can be sent to external email deliverability SaaS (e.g. Cloudflare, MXToolbox, etc...)
- If different domain, receiving domain should advertise that it allows receving reports on behalf

![](/assets/images/emails/example-reports-ok.png)

#### Cloudflare DMARC Management

![](/assets/images/emails/dmarc-management.png)

#### DMARC alignment 
- DMARC relies on SPF and/or DKIM
- But it only considers ... those that are aligned
- DMARC uses "Header From"
- SPF uses "MAIL FROM" (that can be equal to "Header From")
- DKIM uses "Header From"

#### MAILFROM
- SMTP FROM
- Envelope FROM
- Return-Path
- smtp.from
- mail.from
- smtp.mailfrom

#### Header FROM
- From
- Reply-To
- header.From
- RFC5322.from

#### DMARC Alignment Examples
- @example.com - MAIL FROM/Header From aligned - Need valid SPF or DKIM
- @mailgun.example.com - Header From aligned - Need valid DKIM

#### DMARC Trap
- SPF appears PASS
- But SPF result is ignored by DMARC (alignment)

#### Subdomains Inheritance? (DNS)
- SPF: No
- DKIM: No
- DMARC: Yes (if not taken)

#### Subdomains Inheritance? (Header From / Mail FROM)
- DMARC `sp`
- DMARC `adkim` and `aspf`

#### DMARC Pitfalls
- Don't get bitten by SPF lookup limit!
- Multiple rua are not always honored (read the RFC)
- Beware the account takeover (e.g. Mailgun)
- Don't break syntax of records
- Don't be too zealous (DMARC) and break emails :/

#### DMARC Tips
- Verify syntax before applying any DNS change
- Read raw emails
- If needed, use GenAI for interpretation 

## Setup Gmail
1. Add domain to Google Workspace (inbound/outbound)
2. Verify domain ownership via TXT record (inbound/outbound)
3. Add MX records (inbound)
4. Google generates signing keys (outbound)
5. Add signing key DKIM to DNS (outbound)
6. Allow Google as authorized sender via SPF (outbound)
7. User adds alias

## BIMI
BIMI helps indentifying you and get more trust from receivers.

In particular, it will print a logo and blue check in your header email:

![](/assets/images/emails/bimi-tib.png)

#### Setup BIMI
1. Prepare a SVG logo
2. Send to DigiCert (or similar), prove ownership and get VMC (pem file)
3. Host logo
4. Host VMC cert
5. Create record `v=BIMI1;l=.../example-bimi.svg;a=.../example_vmc.pem;`

#### More About BIMI
- Cert renewal yearly (I think not impacted by [TLS lifetime reduction](https://www.digicert.com/blog/tls-certificate-lifetimes-will-officially-reduce-to-47-days))
- Also need DMARC or noop
- Retroactive

#### BIMI alignment
- BIMI uses header.From

## MTA-STS
- Purpose: prevent "Man In The Middle" attack
- Because SMTP is "insecure by default"

#### Setup MTA-STS
1. Enable MTA-STS
2. Point mta-sts subdomain to some hosting
3. Publish policy file
4. Advertise where to send reports

#### MTA-STS Policy
TXT record to advertise policy file:

![](/assets/images/emails/mta-sts-1.png)

Host policy file at `mta-sts.example.com`:

![](/assets/images/emails/mta-sts-2.png)

And the policy file:

![](/assets/images/emails/mta-sts-3.png)

## TLS RPT
- Advertise senders where to send MTA-STS reports

#### Setup TLS RPT
- DNS TXT record
- `v=TLSRPTv1; rua=mailto:sysadmin@example.com`

#### TLS RPT Example
Received email:

![](/assets/images/emails/tls-rpt-report-mail.png)

With enclosed report:

![](/assets/images/emails/tls-rpt-report.png)

## Conclusion
It was a bit "too much informations" density post :D

I hope it can help you in securing your inbound/outbound emails as well as improving your reputation and deliverability!






