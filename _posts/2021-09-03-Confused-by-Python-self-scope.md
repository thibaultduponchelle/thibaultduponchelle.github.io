---
layout: post
title: Confused by Python self scope
date: 2021-09-03 13:28:17
---
*(picture from [Dex Ezekiel](https://unsplash.com/@dexezekiel))*

Today, I was playing with risky naming conflicting (that I generally avoid) and I get confused by a class method/attribute resolution in *python*.

Specifically I was playing with classes and code samples like the following:
```python 
# arg arg arg
class arg():
    def arg(self, arg=None):
        self.arg = arg
        print("arg")

arg = arg()
arg.arg()
```

And I was confused by the scope of `self`:
```python
class parent():
    def __init__(self):
        self.f() # Boom
    def f(self):
        return
    
class child(parent):
    def __init__(self):
        self.f = "not a method"
        super().__init__()
        
child() # Boom (see above)
```

I intended that `self.f()` in parent class would call the *parent* function but it first resolved to child *attribute* and produced and error:
```
Traceback (most recent call last):
  File "module.py", line 17, in <module>
    child()
  File "module.py", line 14, in __init__
    super().__init__("tib")
  File "module.py", line 6, in __init__
    self.f()
TypeError: 'str' object is not callable
```

It's not that strange when you think about it (to get the most "specialized" or "downward" method/attribute) but how do you restrict to the *parent* class scope with just no method resolution?

Do you know dear fellow python developers?

I don't need it, but I'm curious :smiley:

If yes, please comment! :smiley:


