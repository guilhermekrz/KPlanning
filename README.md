# KPlanning [![Build Status](https://travis-ci.com/guilhermekrz/KPlanning.svg?token=VBgyk5JAs3dn31fkKpxS&branch=master)](https://travis-ci.com/guilhermekrz/KPlanning)

Repository containing some Planning Utils, to serve as a base of new projects. 

I admit that this can be a *little* cumbersome, but I think in this way it is easier to get new projects running without much initial setup.

Important to note that the main idea is to use JavaFF data structure as a base, so this drives some architectural decisions.

Currently we are supporting (i.e. encapsulating) the following:

* Parsers: 
    * PDDL4J
    * JavaFF

Including a class to convert some objects from PDDL4J to JavaFF.

* Planners
    * Graphplan