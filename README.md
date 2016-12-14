# KPlanning [![Build Status](https://travis-ci.com/guilhermekrz/KPlanning.svg?token=VBgyk5JAs3dn31fkKpxS&branch=master)](https://travis-ci.com/guilhermekrz/KPlanning)

Repository containing some Planning Utils, to serve as a base of new projects. 

I admit that this can be a *little* cumbersome, but I think in this way it is easier to get new projects running without much initial setup.

Important to note that the main idea is to use JavaFF data structure as a base, so this drives some architectural decisions.

## Representation

We use [PDDL](https://en.wikipedia.org/wiki/Planning_Domain_Definition_Language) as our planning representation.
This means that the planning problem is composed of (1) domain description and (2) problem description.

We encapsule the following parsers for this:
* [PDDL4J](https://github.com/pellierd/pddl4j)
* [JavaFF](https://github.com/guilhermekrz/JavaFF)

We also include:
* A [class](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/parser/Pddl4jToJavaffConverter.java) to convert some objects from PDDL4J to JavaFF
* A module to encode facts and actions as [BitSets](https://github.com/guilhermekrz/KPlanning/tree/master/src/main/java/kplanning/bitset), which uses JavaFF facts and actions

## Planner

The planning process, i.e. the decision of which sequence of actions to follow, traditionally only considers the initial and the goal states, but additions in sub-sequent versions of PDDL allows the specification of plan metrics and preferences.

A [PlanSolution](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/plan/PlanSolution.java) can contain multiple [Plans](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/plan/Plan.java); additionally, a plan solution can be of three types: PARALLEL_SOLUTIONS, SEQUENTIAL_SOLUTIONS or NO_SOLUTION.
All planners must extend from the basic [Planner](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/Planner.java), and implement the following method:
* internalPlan(boolean foundAllSolutions, int l):PlanSolution
    * if foundAllSolutions is false, then return the first found solution
    * if foundAllSolutions is true, then return all solutions from the first found solution until "l" levels.
        * "l" levels is planner-dependent, i.e. in Graphplan is the number of state levels, in BFS is the current depth,... 

We encapsule the following planners:
* [JavaGP](https://github.com/pucrs-automated-planning/javagp) - [here](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/GraphplanAdapter.java)
* [JavaFF Planner](https://github.com/guilhermekrz/JavaFF) - [here](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/JavaffPlanner.java)
* [JavaFF Graphplan](https://github.com/guilhermekrz/JavaFF) - [here](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/JavaffGraphplanPlanner.java)

And implement the following:
* [BFS search using BitSet](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/BFSSearchPlanner.java)
* [Graphplan (our implementation)](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/GraphplanPlanner.java)

### Support 

| Support/Planner           | JavaGP | JavaFF Graphplan | BFS | Graphplan |
| -------------             |:------:|:------:|:----------------:|:------:|
| foundAllSolutions=false   | X      | X   | X             | X    |
| foundAllSolutions=true    | X      | O   | O               | X    |

### Performance tests (in ms)
        
| Problem/Planner       | Graphplan | JavaGP | JavaFF Graphplan | JavaFF |
| -------------         |:---------:|:------:|:----------------:|:------:|
| Blocksworld (1 to 7)  | 1200      | 1196   | 8617             | 330    |
| Blocksworld 8         | 1450      | 1329   | NC               | 680    |
| DWR (2 to 6 - 5)      | 12750     | 10000  | -                | 650    |

NC = Not completed in 30 minutes

## Norms

[Norms](https://en.wikipedia.org/wiki/Norm_(social)) are "informal understandings that govern the behavior of members of a society".

### Formalization

There are many different ways to formalize norms, but most of them use deontic logic to express the norm’s modality, i.e. if a norm is an obligation, a permission or a prohibition.\
We support two different types of norm formalization.

TODO
* Conditional norm
* LTL norm

### Planning
TODO

## Others

* [Problem generator](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/generator/GenerateProblems.java)
* [Norm generator](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/generator/GenerateNorms.java)
* [Retrieve reachable states](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/reachableStates/GetReachableStatesStrategy.java)
    * [Fastest](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/reachableStates/ActionsReachableStatesStrategy.java): Generates all reachable states, starting from the initial state and applying available actions
    * [Fastest](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/reachableStates/BitSetReachableStatesStrategy.java) : Generates all reachable states, starting from the initial state and applying available actions - using BitSet
    * Uses the levelled planning graph of Graphplan, to assert if a given possible state is mutex free.
    If it is, then it is a reachable state. 
    This method gives some false positives, mainly states where all predicates are false (not).
        * [Graphplan](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/reachableStates/GraphplanReachableStatesStrategy.java)
        * [JavaGP](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/reachableStates/JavagpReachableStatesStrategy.java)