---
layout: post
title: Do you really need to merge docker layers ?
date: 2021-01-05 17:24:32
---
![Rainbow cake](/assets/images/7rtqbz5ifdhgqe1b5knq.jpg)

Do you need to merge layers as much as possible, or is it possibly a "false good idea" ?

## Yes because of lost space
Layers can eat even your deleted datas...

This is very bad:
```dockerfile
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz 
...
# untar and install
...
RUN rm gcc-9.2.0.tar.gz
```
If you do not remove in the same layer, it's too late :grinning: 

The same problem occurs with package manager caching:
```dockerfile
FROM ubuntu

RUN apt-get update && \
    apt-get install -y tree
RUN rm -rf /var/lib/apt/lists/*

CMD ["bash"]
```
Will increase size *a lot*: 
![Bad layer](/assets/images/l2yhs8z4vdzouhs4kb5o.png)

Where a merged "fetch/install/clean" layer:
```dockerfile
FROM ubuntu

RUN apt-get update && \
    apt-get install -y tree && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
```

Will only add the size of `tree` to the image:
![Good layer](/assets/images/i4sbbix5a8rbrhrmi23p.png)

I won't explain in details, there is a lot of good resources about it for instance [how to improve docker image size with layers](https://medium.com/better-programming/how-to-improve-docker-image-size-with-layers-3ad62be0da9b)

## Yes because of wanting a fresh cache
Again, this is very bad:
```dockerfile
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx
```
First, there is the same problem of space lost than what I just described earlier.

But not only, there is also a problem of **fresh cache** !

If you edit it to give to `apt-get install` one more package :

```dockerfile
FROM ubuntu

RUN apt-get update # Will use cached layer if exists 
RUN apt-get install -y nginx tree # Install tree also
```
Your `docker build` will possibly reuse the apt-get cache from last time it ran (maybe 1 year ago...).

Instead, you should merge the two commands in a single RUN step:
```dockerfile
FROM ubuntu

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*
```
And do not forget to remove cache

## No because it breaks layer caching
Layers are your friends :copyright: 

This is why you should split your Dockerfile in multiple layers:
- Downloading/extracting big layers is slower than small layers
- Download one big layer can't be parallelized and it gives a big penalty
- One big layer, nothing is never shared

As soon as you have multiple variants of same docker image basis or frequent rebuilds, before you consider flattening all your layers with `docker build --squash`, `docker export` or **multistage**, think about twice.

See for instance ["don't use a signle layer image" (Red Hat)](https://developers.redhat.com/blog/2016/02/24/10-things-to-avoid-in-docker-containers/)

## No because it will slow the (re)build
Depending your working habits, maybe the end users of your docker image will never run `docker build`... but you and your CI will...

Therefore, your slow layers should be :
* **First** - few or no other layers can trigger it
* **Alone** - to cache it and because then no other task on the same layer can't trigger it

See the [response to "should I minimize the number of docker layers?"](https://stackoverflow.com/a/47166120)

See also the [third antipattern of common dockerfile mistakes](https://runnable.com/blog/9-common-dockerfile-mistakes)

## What about layer metadata overhead ?
Recent `docker` produces less layers (few commands are generating them) and in general, the overhead is very small so don't take it into account.

## Conclusion
Reducing the number of layers should not be a goal by itself but should serve to reduce size.

It is unfortunate that it can degrade the build time and even the pull time !

Find the right balance :smiley:

