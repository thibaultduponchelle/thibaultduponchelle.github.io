---
layout: post
title: Asking about what it is for you to be SRE
date: 2018-05-18 00:18:32
published: true
---

Years ago, when SRE was more a new thing, I did ask colleagues about "how it was to be SRE?" in short interviews. 

Here is the output :)

# SRE mindset from apprentice SREs
From some time now I'm doing SRE DevOps but with a more important part of SRE, which is clearly not my initial job.
I'm thinking a lot about this new role and mainly about what qualities and mindset makes you a good SRE. I spend some time to think about it and asked some more experienced people to give their opinion, here it is!

## Thibault - SRE Devops
Before joining SRE Devops, my vision of SRE mindset was almost limited to "No friday deployment" and "Stressing environment".

While it's true, I would add some more qualities that I learned or people told me from being SRE Devops:

* Prod first! Prod as priority over everything
* I plan my tasks, prepare my environment and visualize the steps before starting (as of today with manual deployments, not true with full CICDCD)
* I personally try to be more safe than fast
* I try to reduce risks and stress (I do rehearsals, I think before typing)
* Reliability as in SRE, I'm responsible to protect prod from unstable code (e.g. not sufficiently battle-tested), unstable environment (e.g. when Artifactory/VCS has hiccups)
* I need multiple monitors

## M. - SRE Devops
In addition to my list, M. reported these qualities:
* He is always aware of the impacts of his actions
* He follows closely procedures because forgetting a step can cost hours and efforts
* He values a lot documentation and writes a lot of it
* Do not stress
    
## J. - SRE Devops
* Problem solving: don't put anything under the carpet
* Automatization: a manual fix is faster/easier in the short term but has a cost that needs to be managed in the long term. Fix the tools/automations instead
* "Craftmanship" approach for dev, "Industrial" approach for operations. Dev: crafted with love, code reusable and readable. Operations: all is prepared in advance/automated
* Not sensitive to pressure
* Be curious: As a bonus to bring fresh ideas, new technologies and make our tooling/process evolves

What we can get from these "interviews" is that vision is not exactly the same (J. thinks more about full CI/CD/CD therefore no manual deployments which is our mid-term goal, while I think more about what we have today) and also that every of us mentioned the stress management.

It would be interesting to do the same excersise with long time legacy SREs... Maybe for another post?

