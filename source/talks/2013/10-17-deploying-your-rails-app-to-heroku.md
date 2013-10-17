---
title: Deploying Rails apps to Heroku.
layout: talk
author: Abhinav Keswani
venue: Christchurch Ruby
intro: An introduction to a deployment platform commonly used for Rails apps..
---

*This upcoming talk was given on October 17th at [Newbie Night](http://christchurch.ruby.org.nz/).*

*The code for the example app used during the demo, and all instructions to deploy an app to heroku can be found [here](http://devcenter.heroku.com/articles/queuing-ruby-resque).*

After punching ducks, patching monkeys, getting all meta and getting some
quick and dirty Rails action happening ... you are going to want to put that shiz
on the web somewhere to show your hip(ster) finery off.

Heroku is a popular and commonly used cloud platform - used by many Rails
developers to host their apps such that they can conduct user acceptance
testing, through to running their apps in production mode.

This talk aims to describe:

* the way in which apps can be deployed (git)
* definition of Heroku resources (dynos, processes, process types and the Procfile)
* commonly used 'addons' including the heroku-postgres offering
* a quick description of the common pattern of handling asynchronous workloads (resque)

After this talk, over a beer, I am more than happy to talk about preparing an
app for production mode.

