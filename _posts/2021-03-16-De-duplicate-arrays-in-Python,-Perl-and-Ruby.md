---
layout: post
title: De-duplicate arrays in Python, Perl and Ruby
date: 2021-03-16 18:33:03
---
![Duplicate](/assets/images/9bl8efyc0c6kllhtsx8c.png)

Today some short codes for the essential task that is de-duplication! :smile:

## Python
Starting with python, we use the properties of data containers. Here using an intermediate dictionary: 
```python
array = [1, 2, 1, 2, 1, 2]
array = list(dict.fromkeys(array))
```

Or similar approach using a `set`:
```python
array = [1, 2, 1, 2, 1, 2]
array = list(set(array))
```

## Perl
The elegant `uniq` method:
```perl
my @dups = (1, 2, 1, 2, 1, 2);
@nodup = uniq @dups;
```
You have to install and `use` [List::MoreUtils](https://metacpan.org/pod/List::MoreUtils) which is a VERY famous Perl CPAN module.

But if you want to do not use a module, here is my "go-to" (no-module) trick:
```perl
my @dups = (1, 2, 1, 2, 1, 2);
my @nodup = do { my %seen; grep { !$seen{$_}++ } @dups };
```

The idea behind is like the first Python (intermediate hash).

## Ruby
Ruby takes adventage of the "almost everything in ruby is an object" so it's simple with the [uniq](https://apidock.com/ruby/Array/uniq) method:
```ruby
array = [1, 2, 1, 2, 1, 2]
nodup = array.uniq
```

## It's your turn

Please comment yours :smile: in Python, Perl, Ruby or any other language!
