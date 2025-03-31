---
layout: post
title: A little story about dependencies
date: 2025-04-29 18:18:32
published: false
---

### A little technical and social story about dependency management

Let me tell you a little story.

It all starts with a library that you write and depends on some other libraries (or modules/gem/wheels…).

Your library A depends on B and C. All is well compatible and working.

On the same machine is installed library Y that also depends on C.

At this point, all is working correctly.

After some time, the maintainer of C prepares a new version 2 with breaking API changes, requiring code change from consumers.

If library A embraces the change and release a new A, explicitly depending on library C ≥ 2

Library Y decide to short term (or forever) fix by adding a upper bound and depends on library C < 2.

In order to library A and Y work on the same system, the said system has to allow multiple version of same library/module/gem/wheel to be simultaneously installed. It’s sometimes the case but not always.

#### Divide and Conquer

Easy fix is easy!  
Some ecosystems are supporting to “Environment-ize” (Virtual Env in Python, Local::Lib in Perl, etc…) so that you can install both dependency trees and run both application.

#### Finding the solution

It’s also possible that some combination of versions would work, technically it means solving a satisfiability problem. Fill a matrix with requirements and try to fill the blanks.  
It works, but can sometimes go wrong (NP-Problem).  
Here are heuristics to help avoid worst case scenarios

#### Dynamic vs Static

Dependencies does not always announce in advance their requirements.  
It’s often need to run a script (e.g. setup.py, Makefile.PL…) to compute dependencies. It means our satisfiability matrix is full of ?

And that installers needs to download/configure modules and possibly do backtracking.

#### Different ecosystem, different approach

We can’t fix social problem with technical solution.

#### Non Deterministic install

