---
layout: post
title: Book review "Perl For System Administration"
date: 2020-12-04 07:57:29
---
![Perl Sysadmin](images/3ahkuxfyxed7dwkrr8n3.jpg)

## Intro
Yet another book review ! \o/  

This book was released in Y2K. Seems like there was no new edition since then.

**Perl for System Administration** is written by **David N. Blank-Edelman**.

## Very cool 
### Old bits
Some fun facts about how *old* is the book : 
* The book mentions **"Perl is not ubiquitous"** as a weakness 
when having to choose between Perl and other scripts languages.
* The author thanks Usenix, SAGE and LISA conferences.
* Recommends search.cpan.org :smile:
* "NTFS driver will be integrated in Linux kernel 2.2"... ah memories

### Security 
Security is always one of the numerous hats of a System Administrator...

![Security](images/s94r2hu2yes0f11qz1ai.jpg)

Here are some notions explained in the book :
* Poison null byte (still possible in 2020 ?)
* `open(TEMPFILE, ">/tmp/tmp.$$);` Predicatble `$$` on multi user machine, 
a malicious user can predict and *steal* a temp file and write custom text/command to force
reader to execute what he wants
* I discovered that "..." ". " were valid filenames (for bad people).
* Interesting exercise with system monitoring (dates, content, DNS dump...) 
* The idea of Postmortem, long time before devops mindset :D
* Classic DDoS SYN flood attack (I think the first time I heard about it was in a story about Kevin Mitnick)
* Cool part mentioning "John the ripper", "Crack" or "L0phtCrack". "libcrack" and "npasswd" :skull:

### Things I discovered 
I learnt also : 
* A lot of things about PPM.
* A lot about macperl : cpan-mac and **installme** where you can drag and drop tarballs to install 

### Chapter about file systems
Very cool !

* How MAC is different (data fork, resource fork)
* How Windows is LOL (vfat = how to build something on top of a technical debt)

### Corrupted check file
* The sample code is cool
* The sysread trick vs < > (read sequentially and stop at first error)

In general, how the author tells a story and explains sysadmin concepts each time is very cool -- I LOVE IT --

### Quotas
How quotas are explained is very cool.

Quotas edition samples are a bit hacky and brittle (not by the fault of the author) but proves "how to get the job done" with Perl.

### Handling users
Some tips detailed:
* GID is primary group
* We can have a group password 
* Password `*` to disable login
* `$<` and `$>` and `$)` and `$(` for real/effective user/group

####  Windows
* Windows : RID + DID = SID 
* Impossible to recreate same user then computer owner change implies to rename user
* Windows cannot *give* ownership, we can only *take* ownership

#### Unix vs Win
* There is a password hash incompatibility (algorithm)
* On Unix there is a superuser whereas on Windows it's more like super-heros (users with super powers)

### Sysadmin mindset
Sysadmins have their own mindset (and the ones I know have a great sense of humor).

![Sysadmin starter pack](images/hzypd39kfrex3vb1883r.jpg)

* "Nothing is foolproof because fools are so ingenious"
* "Something is wrong and I have no idea what" (how some users report problems) lol
* "Sysadmins are log file linguists"
* "Handle with pack and unpack - this way lies madness and misery" :smiley:
* "There are times where death is too good for a process"
* "Security is continuum"
* "You can be more secure but you will never be 100% secure" and in the same theme "It is always possible to find more to fear"
* "Oog's password to get back into the clan's cave was probably "oog" " (about weak passwords)
* "Detect local signs of perils" (nothing special but it sounds good to me :smile:)
* "Learn something from incident instead of only loosing time and effort"
* "An user does not login from a lot of different places" (probably still true today even in the "mobility world" that we know today)

### Process handling
Very nice chapter !
* Inspect process with `/dev/kmem`, `Proc::ProcessTable`, `ps`, `proc`
* Filewatcher windows very contemporary

### Directories services
* finger
* whois
* LDAP (LDIF)
* Active Directory (ADSI, DCOM, OLE)

Caracteristics : structured or not, some implementation details etc...

Networked, remote, hierarchical, structured, read many write few...

Very good chapter about LDAP, I skipped some parts at the end, but at least I have ready to use code if needed.

### Other cool things
* Control Windows windows with API !
* Security bits
* References at the end of chapter, original but cool
* Very nice chapter about DNS

## Not cool 
* Not for Perl beginners, sometimes complex notions are thrown without any explanation (`@`, `\%`, `keys`, `map`, `$_`, `refs`)
* Sometimes too much details that will be outdated one day after the book is released (a bug in a very specific version of `Net::NIS`...)
* Sometimes too much code (one snippet was 5 pages long, tldr;)
* Lost with chapter about XML, not clear
* SNMP and LDAP are probably not so well explained

## Various Tips and tricks
* Compare 2 tabs that contains numbers `if("@arr[1..12]" ne "@arr2")` nice Perl idiom (slice then convert to string to compare).
* Do you know the SQL "SELECT ... *INTO* ..." ? Me not ! :grin:
* Good idea to compare SQL operators to Perl regex operators !

## Appendix 
There are really short introductions, quality depends the topic:
* XS and XML intros are cool. 
* LDAP and SNMP intros are too hard.

## Conclusion
Very pleasant to let the author give a tour of Operating Systems for us for each topic, even (especially) if I'm less interested in some OS.

You should read this book! Definitely ! :+1:
