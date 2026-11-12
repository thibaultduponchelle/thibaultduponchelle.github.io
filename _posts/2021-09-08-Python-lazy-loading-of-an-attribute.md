---
layout: post
title: Python lazy loading of an attribute
date: 2021-09-08 16:04:07
---
*(Image from [Adrian Swancar](https://unsplash.com/@a_d_s_w))*

It's not something complex but it's very useful anyway to do not wait or stress your infrastructure... for nothing!

## Lazy loading (and caching) of an attribute
The idea is to have an empty attribute that will get its value only when accessed the first time. To illustrate, I used a class **Gift** with an attribute **price** that is slow to compute:
```python
import time

class Gift():
    _price = None

    def __init__(self, what):
        self.what = what

    def costly_computation(self):
        print("Costly computation")
        time.sleep(2)
        return 10

    @property
    def price(self):
        if not self._price:
            self._price = self.costly_computation()
        return self._price
```
The costly computation will only affect when accessing the attribute, and it will happen only one time (first access) :smiley:

## See it in action
```
>>> from gift import *
>>> g = Gift("Sunglasses")
>>> g.price
Costly computation
# ...
# ... freezes a bit
# ...
10
>>> g.price
10
```

That's all :kissing_smiling_eyes: