---
layout: post
title: Web3 Domains, Unstoppable Domains and a bit of IPFS
date: 2026-08-13 00:18:32
published: true
---

![](/assets/images/web3/web3.jpg)

Picture from [here](https://pixabay.com/fr/illustrations/web-3-avenir-la-technologie-6909512/), courtesy of [emrhakarakas](https://pixabay.com/fr/users/emrahkarakas-19331833/) (thank you!)

Years ago I started becoming Domain Portfolio Manager and we had a bunch of Web3 domains lying around.

Those assets (`.crypto`, `.nft`, `.dao` etc...) were "owned for life" and unused so I mainly ignored them for a very long time.

Recently, I gave a closer look to them, in order to leave the shadow on their functionning.

Those assets behave differently than usual domain names and appear to be cryptic at first.

Now that I have clear picture, I will share details to decipher them for you also.

## Disclaimer 
The Web3 domain landscape is a mess and I will limit to a few TLDs managed in Unstoppable Domains registrar.

To give a taste of how much different standards exist, there are TLDs living on [Ethereum Name Service (ENS)](https://wikitia.com/wiki/Ethereum_Name_Service) with `.eth` ending, yearly renewal, minted in Ethereum blockchain, with ENS as resolver.

There are [D3](https://d3.com/) managed domains, with the goal of attaching a classic domain name (e.g. `example.com`) to blockchain. If you ask about how they ensure about minting the Web3 to the correct owner, it seems to require a DNS verification (but what about later drift?).

Then there's [freename](https://freename.com/home/) that lets you create any TLD you want. I could for instance go and buy `tib.tib` (OK it's cheap as $25,000) but I changed my mind and won't.

Note that [HandShake (HNS)](https://handshake.org/) also seem to offer the same feature.

Finally I need to at least mention [Space ID](https://www.space.id/) actor, supporting Web2 domains like D3 and multi blockchain.

And there are others!

So... It's a mess, there's no "one single Web3 technology" but a myriad.

## The raison d'etre of Web3 domains
Web3 domains goal is to solve the following limitation of standard domain names:
- True ownership
- Identity resolution
- Decentralized web

### True ownership 
A Web3 domain purchase and belonging does not use the usual middlemen (registar and registry) but is "minted".

Actually, it does not mean that registry does not exists (it is the on-chain "database") neither the registrar (Unstoppable Domain) but a Web3 domain ultimately does not rely on them for ownership.

So technically, as long as you have your credentials and the blockchain exist, your web3 domain is guaranteed to be yours.

But I think it does not guarantee that your name can be minted in different blockchains...

### Identity
Web3 domains are meant to attach wallet id so we can pass an human friendly `example.crypto` or `example.wallet` to people sending crypto instead of long cryptic chain.

They also intended to provide "reverse resolving" but in practice it's really left to implementers.

### Decentralized web
The Web3 domains also come with promises of decentralized web (censorship resistence, p2p protocol...).

It is achieved with the help of new resolution services and new hosting technologies and protocols.

## Let's give a closer look 
I mentionned [UnstoppableDomains](https://unstoppabledomains.com/) so let's have a look now.

UnstoppableDomain can be seen more like a registrar, offering facilities to register and manage Web3 domain names.

It actually has more than that single hat, providing resolution API but it is not acting as a registry (which is actually the Polygon blockchain)

### The list of domains
This is the list of domains as appearing in the registrar web view:

![](/assets/images/web3/ud-list.png)

It is listing the domains we own. 

For the record, price acquiring those domains varied a lot depending the length and name.

Each domain is linked ("minted") into a wallet, the same Metamask wallet in this case.

Those Web3 TLDs are owned for life, no need to monitor them for expiration/renewal! 
Please note that this is not the case for all Web3 TLDs, for instance `.eth` living in Ethereum Name Service (ENS) are subject to a yearly fee.

Also, if the Web3 domains are attached to a crypto wallet, they are/were not necessarily paid with crypto.

### Resolving a Web3 domain to a wallet
One interesting, maybe the most interesting, feature of Web3 domain is to attach identities to it.

In practice, you can attach wallets id to a domain:

![](/assets/images/web3/ud-resolve-to-wallets.png)

Wallet ids can be different for different blockchains. 

With this setup, you can later share `example.nft` to people to send crypto to you. Handy! :)

You can see wallets attached to a Web3 domains using external services like for instance [web3.bio money.nft](https://web3.bio/?s=money.nft) (and see that multiple Web3 domains point to this wallet).


### Resolving a wallet to a Web3 domain
Having a wallet id pointing to a Web3 domain is also possible, it is called "reverse resolution".

![](/assets/images/web3/ud-reverse-resolve.png)

This seems to be very few or not supported by any online viewers, so I can't share any link for you to show that asking for a wallet can return you that Web3 domain.

### IPFS
The decentralized nature of Web3 domains means they don't actually follow the "classic" internet rules of DNS and hosting.

It means that a Web3 domain website won't resolve via usual DNS mechanism, but via a service ("Web3 resolver"). 

Publishing a website via [InterPlanetary File System](https://en.wikipedia.org/wiki/InterPlanetary_File_System) means in practice uploading files or archive that will be attached to nodes. 

![](/assets/images/web3/ud-ipfs.png)

Having a website published won't make your website easily accessible, because of the resolution barrier.

For instance, the website `vitalik.eth` is valid, but won't resolve in your browser. It will, if you use brave and install a browser plugin.
Then it will transform it into a `cid` like `xt4hluh....byui` then can be served by a proxy like `https://cid.ipfs.inbrowser.link`. 

Another proxy (for `eth`) is [eth.limo](https://eth.limo/). It will resolve and serve `.eth` website, see for instance [vitalik.eth via limo](https://vitalik.eth.limo/)!

## About Web3 in general
UnstoppableDomains looks like the major actor (registrar of `.bitcoin`, `.blockchain`, `.crypto`, `.dao`, `.nft`, `.wallet`). `.blockchain` is co-managed (registrar) with [blockchain.com](https://www.blockchain.com/).
Unstoppable Domains were also allowing to manage `.eth` but stopped (and [kicked people](https://www.reddit.com/r/Domains/comments/1rxj0s7/unstoppable_domains_auctioning_my_web3_domans/) few months ago).
`.eth` are subject to renewals and living in [Ethereum Name Service (ENS)](https://wikitia.com/wiki/Ethereum_Name_Service)

Recent news about Web3 domains are not great, with [Web3 “domains” are dead](https://domainnamewire.com/2026/03/19/web3-domains-are-dead/) and CEO of Unstoppable Domains [stopping believing in Web3 domain future](https://x.com/mattgould/status/2033684862964519041)

![](/assets/images/web3/ud-pivot.png)

So UnstoppabbleDomains is pivoting: recently (Dec 2025) opened platform to traditional ICANN accredited TLDs and now applying for `.bitcoin`, `.crypto`, `.dao`, `.nft` and `.wallet` to become traditional ICANN accredited gTLDs (then probably `.blockchain` will follow).

After transitioning to regular domains, domains will become normally resolvable (DNS) while continuing to be purchased and managed in blockchain along with IPFS still working (possibility to serve different website between those 2 protocols/networks?).

## Conclusion
I hope you get better understanding of the Web3 domain functionning. 

Still, it's a fragmented ecosystem with uncertain future.

But that's cool technologies to dig and at some point, as a Domain portfolio Manager, you would probably end having some Web3 domains in your portfolio, at least for the wallet identity use case, if that makes sense for you.
