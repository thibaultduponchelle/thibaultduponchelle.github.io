---
layout: post
title: Notes About SSL Certificates, Cloudflare and Monitoring
date: 2026-04-05 00:18:32
published: true
---

## Types of certificates
- Domain Validation (DV) - automatable and free
- Organization Validation (OV) - e.g. identity...
- Extended Validation (EV) - e.g. phone call...
- VMC (EV++) - e.g. trademark verification...

## CN / SAN
- To what (domain) this certificate is attached to
- Wildcard certs (e.g. `example.com` and `*.example.com`)

## Proxy VS not proxy

![](/assets/images/ssl/cf-proxy.png)

## Edge certificates
- The one visible from customer
- Generally Let's Encrypt or Google Trust Services

## Cloudflare SSL Modes
- Off
- Flexible
- **Full**
- Full (strict)
- Strict

## Full
![](/assets/images/ssl/cf-full.png)

You should rely on this flexibility

Connection is encrypted

## CloudFlare Automatic SSL/TLS
- Probe regularly to "upgrade" the SSL Mode
- We don't like it and force mode to "Full"

## CF Advanced/Custom Cert
-  Provide certificates ourself
- More fine grained management
- We don't use those services

## Client certificates and mTLS
- The other direction

## CF Origin Certificates
- Free
- Up to 15 years
- Self signed (valid behind proxy)

## Encryption VS validation
- A SSL cert is needed to encrypt
- Whether valid or not

## The case Cloudflare Pages
- Edge certificate managed by Cloudflare
- Origin certificate managed by Cloudflare

## The case Another Hosting
- Edge certificate managed by Cloudflare
- Method A - Cloudflare origin certificate (added in Hosting Provider) 
- Method B - Hosting Provider managed certificate (using DCV) 

## Check SSL certificate

### It's only the "edge" cert
- Always valid
- Always short

## Check origin certificate
`openssl s_client -servername example.com -connect foobarbaz.com:443 -showcerts < /dev/null 2>/dev/null`

## Datadog SSL Monitoring
- Beware the costs - 2 locations, weekly
- Datadog fixed it this week!

## A simple SSL monitor
![](/assets/images/ssl/cf-syn-proxy.png)

## An "origin" monitor
![](/assets/images/ssl/cf-syn-no-proxy.png)

## Notes
- Monitoring proxy cert is generally useless
- Monitoring origin cert is not always possible
- Monitoring origin cert is not always meaningful

## More
- Certificate chain / CA Bundle
- Private key
- Lists of revoked certs (CRL, OCSP)

## TLS lifetime planned reduction
![](/assets/images/ssl/lifetime.png)

## Solving the TLS lifetime planned reduction problem
- Cloudflare Origin Certificates! Mode Full! Everywhere
- Automate few residuals hosts (ACM, acme.sh...)
