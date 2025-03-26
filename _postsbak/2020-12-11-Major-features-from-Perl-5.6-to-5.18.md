---
layout: post
title: Major features from Perl 5.6 to 5.18
date: 2020-12-11 13:38:55
---
I just wanted to drop a list of (mainly high-level) changes from 5.6 to 5.18, in bulk :smile:

I think I've got this list from taking note watching a rjbs presentation + reddit posts/comments.

For non Perl people, these versions are already old.

## 5.6
- unicode !

## 5.8
- new implementation of threads

## 5.10.0
- use feature
- perl -E
- defined or //=
- named captures
- state vars
- $* and $# deprecated

## 5.10.1 
- resolve issue 5.10.0 (yes deserve a major feature entry)

## 5.12
- change releasing flow
- pkg name version
- pluggable keywords
- version number format
- parent.pm in core
- links in POD L<>

## 5.14
- s//r/r
- block package syntax
- custom ops

## 5.16
- big unicode improvement : e.g. unicode in symbol names
- fc

## 5.18
- experimental warnings
- hash randomization
- regex sets
- lexical subs
- qw() without parenthesis fail

## Conclusion
That's all folks !

![In Perl We Trust](images/fnwvzitp9wf7kj8xh8ja.jpg)

EDIT: Check the new book [Perl new features](https://perlschool.com/books/perl-new-features/) from **brian d foy**  