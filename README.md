# KPlanning [![Build Status](https://travis-ci.com/guilhermekrz/KPlanning.svg?token=VBgyk5JAs3dn31fkKpxS&branch=master)](https://travis-ci.com/guilhermekrz/KPlanning)

Repository containing some Planning Utils, to serve as a base of new projects. 

I admit that this can be a *little* cumbersome, but I think in this way it is easier to get new projects running without much initial setup.

Important to note that the main idea is to use JavaFF data structure as a base, so this drives some architectural decisions.

Currently we are supporting (i.e. encapsulating) the following:

* Parser
    * [PDDL4J](https://github.com/pellierd/pddl4j)
    * [JavaFF](https://github.com/guilhermekrz/JavaFF)
    * Including a class to convert some objects from PDDL4J to JavaFF.

* Planner
    * BFS search using BitSet
    * Graphplan (our implementation)
    * [JavaGP](https://github.com/pucrs-automated-planning/javagp)
    * [JavaFF Graphplan](https://github.com/guilhermekrz/JavaFF)
    
Performance tests (in ms)
        
| Problem/Planner       | Graphplan | JavaGP | JavaFF Graphplan | JavaFF |
| -------------         |:---------:|:------:|:----------------:|:------:|
| Blocksworld (1 to 7)  | 1500      | 1196   | 8617             | 330    |
| Blocksworld 8         | 1700      | 1329   | NC               | 680    |
| DWR (2 to 6 - 5)      | 14250     | 10000  | -                | 650    |

NC = Not completed in 30 minutes

* Norm parser
    * Conditional norm
    * LTL norm
    
* Problem generator
* Retrieve reachable states