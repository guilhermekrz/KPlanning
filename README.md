# KPlanning [![Build Status](https://travis-ci.org/guilhermekrz/KPlanning.svg?branch=master)](https://travis-ci.org/guilhermekrz/KPlanning)

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

There are many different ways to formalize norms, but most of them use deontic logic to express the norm’s modality, i.e. if a norm is an obligation, a permission or a prohibition.
We support two different types of norm formalization.

* Conditional norm - Based on [Oren at al. 2009](https://link.springer.com/chapter/10.1007/978-3-642-00443-8_11#page-1)
    * Consists of:
        * μ ∈ {obligation, prohibition} represents the norm’s modality
        * X is a set of ground predicates that represents the context to which a norm applies
        * ρ is an action representing the object of the norm’s modality
        * Penalty (cost) incurred to an agent when this norm is violated
    * It is violated in state s if s |= X and agent a either: executes action ρ in state s and μ =prohibition; or does not execute action ρ in state s and μ = obligation
* LTL norm - Based on [Gerevini and Long 2005](http://strathprints.strath.ac.uk/3149/)
    * Expressed using one of the following modal operators, where φ and ψ are atomic formulae and t is a number:
        * (at end φ) - φ must be true in the final state
        * (always φ) - φ must be true in all states in the plan
        * (sometime φ) - φ must be true in at least one state in the plan
        * (at-most-once φ) - φ must be true in at most one state in the plan
        * (sometime-after φ ψ) - whenever φ is true in a state s, there must be a state s' equal to or after s where ψ is true
        * (sometime-before φ ψ) - whenever φ is true in a state s, there must be a state s' before s where ψ is true
        * (always-within t φ ψ) - whenever φ is true in a state s, there must be a state s' at most t steps after s where ψ is true
    * Although modal operators can be nested, in the current work we are considering only not nested operators, for simplicity. A LTL norm is violated if its interpretation is not true in a given plan.

These two norm formalization have different complexities.
While the first one can be checked in a single state, the second one needs to be checked along a path (i.e. a sequence of states, a finite trajectory).

In our implementation we have a base [Norm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/Norm.java) class, and classes that extends this class must implement isViolationPlan(Plan plan): boolean method.
We have four implementations: [ConditionalNorm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/ConditionalNorm.java) and its grounded counterpart [GroundConditionalNorm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/GroundConditionalNorm.java),
and [LTLNorm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/LtlNorm.java) and [GroundLtlNorm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/GroundLtlNorm.java).
Also, we have a [NormAdapter](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/NormAdapter.java) class responsible to populate norms from input files,
and [PlanNorm](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/norm/PlanNorm.java) which enables to get violation and non-violation plans.


### Planning

A [planner](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/NormPlanner.java) is responsible for finding a solution, i.e. a sequence of actions, that leads from the initial to the goal state.
When considering norms, this solution can be either norm-compliant or norm-violation; the planner can also find solutions that minimize the cost of both actions and penalty costs relative to norm violations.

* Graphplan
    * [Naive Graphplan](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/NaiveGraphplanNormPlanner.java)
        * The simplest way to modify the Graphplan algorithm is to discard found solutions if they violate or if they do not violate the norms. In order to do this we perform the extract solution phase of the algorithm to find all possible solutions at the current level; then we iterate through each solution checking norm-compliant or norm-violation.
    * [Graphplan](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/GraphplanNormPlanner.java)
        * The solution as outlined above does not take advantage of the fact that it is possible, for conditional norms, to prune partial solutions during the backward search. The conditions to prune are the following:
            * It is a conditional norm
            * We want to find a norm-compliant plan and it is occurring a violation
            * We know the truth value of the propositions of the norm 
        * These conditions are necessary because we only have partial information during this phase of the backward search; more specifically, we know the sub-goals we are trying to achieve and the set of actions that can partially or fully achieve the propositions from the sub-goals. With this information we cannot, for most of the LTL norms 2 , detect a violation; for conditional norms, if the set of action preconditions include the context of the norm, we are able to detect a norm violation. Note that, if we want to find a norm-violation plan, we cannot prune solutions if we did not find any violations so far, because they still can occur at some later time.
* [Forward state-space search - Using UCS](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/ForwardNormPlanner.java)
    * [Build the current partial plan and check for norm-violation](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/RuntimeNormSearchNode.java)
    * [Keep track of norm-violation in the search nodes, and update them as we choose new actions](https://github.com/guilhermekrz/KPlanning/blob/master/src/main/java/kplanning/planner/normPlanner/NormKeeperSearchNode.java)
   
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
