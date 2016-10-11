package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Not;
import kplanning.DomainProblemAdapter;

import java.util.*;

class StateLevel {
	private Set<Fact> facts;
	private Map<Fact, Set<Action>> actionsThatAddFacts;
	private Map<Fact, List<Action>> sortedActionsThatAddFacts;
	private int level;
	private ActionLevel previousActionLevel;
	private Set<Set<Fact>> noGoods;
	private Map<Fact, Set<Fact>> mutexes;
	private static Map<Fact, Set<Fact>> staticMutexes;

	StateLevel(Set<Fact> facts, DomainProblemAdapter adapter) {
		this(0, facts, null, null, adapter);
	}

	StateLevel(int level, Set<Fact> facts, Map<Fact, Set<Action>> actionsThatAddFacts, ActionLevel previousActionLevel, DomainProblemAdapter adapter) {
		this.previousActionLevel = previousActionLevel;
		this.level = level;
		this.facts = facts;
		this.mutexes = new HashMap<>();
		this.actionsThatAddFacts = actionsThatAddFacts;
		this.sortedActionsThatAddFacts = new HashMap<>();
		if(this.level == 0) {
			populateStaticFactMutex(adapter);
		}
		populateMutex();
		this.noGoods = new HashSet<>();
	}

	Set<Fact> getFacts() {
		return Collections.unmodifiableSet(facts);
	}

	boolean isGoalPossible(Collection<Fact> goalFacts) {
		return this.facts.containsAll(goalFacts)
				&& !isFactsMutex(goalFacts);
	}

	boolean isFactsMutex(Collection<Fact> factsMutex) {
		for(Fact fact1 : factsMutex) {
			for(Fact fact2 : factsMutex) {
				if(isFactMutex(fact1, fact2)) {
					return true;
				}
			}
		}
		return false;
	}

	private boolean isFactMutex(Fact fact1, Fact fact2) {
		return mutexes.containsKey(fact1) && mutexes.get(fact1).contains(fact2);
	}

	/**
	 * Actions that add facts
	 */

	Set<Action> getActionsThatAddFact(Fact fact) {
		return actionsThatAddFacts.get(fact);
	}

	List<Action> getSortedActionsThatAddFact(Fact fact, boolean foundAllSolutions, PlanningGraph.ActionSort actionSort, Map<Fact, Integer> levelCost, Map<Action, Integer> actionCost) {
		if(sortedActionsThatAddFacts.get(fact) == null) {
			Set<Action> actionSet = actionsThatAddFacts.get(fact);
			List<Action> actionSetSorted = getSortedActions(foundAllSolutions, actionSet, actionSort, levelCost, actionCost);
			sortedActionsThatAddFacts.put(fact, actionSetSorted);
		}
		return sortedActionsThatAddFacts.get(fact);
	}

	private List<Action> getSortedActions(boolean foundAllSolutions, Set<Action> actions, PlanningGraph.ActionSort actionSort, Map<Fact, Integer> levelCost, Map<Action, Integer> actionCost) {
		// 2. To achieve that literal, prefer actions with easier preconditions.
		// That is, choose an action such that the sum (or maximum) of the level costs of its preconditions is smallest.
		List<Action> set = new ArrayList<>(actions);
		if(!foundAllSolutions && !actionSort.equals(PlanningGraph.ActionSort.NONE)) {
			set.sort((a1, a2) -> {
				if(actionSort.equals(PlanningGraph.ActionSort.ACTION_INDEX)) {
					return actionCost.get(a1).compareTo(actionCost.get(a2));
				} else if(actionSort.equals(PlanningGraph.ActionSort.NUMBER_OF_PRECONDITIONS)) {
					return actionCost.get(a1).compareTo(actionCost.get(a2));
				} else {
					return 0;
				}
			});
		}
		return set;
	}

	int getNumberOfActionsThatAddFact(Fact fact) {
		return actionsThatAddFacts.get(fact).size();
	}

	/**
	 * Mutexes
	 */

	private void populateMutex() {
		for(Fact fact1 : facts) {
			for(Fact fact2 : facts) {
				if(!fact1.equals(fact2)) {
					if(staticMutexes.containsKey(fact1) && staticMutexes.get(fact1).contains(fact2)) {
						addMutex(fact1, fact2);
					} else if(level != 0) {
						Set<Action> actions1 = actionsThatAddFacts.get(fact1);
						Set<Action> actions2 = actionsThatAddFacts.get(fact2);

						boolean isMutex = true;
						for (Action a1 : actions1) {
							for (Action a2 : actions2) {
								if (!previousActionLevel.isActionMutex(a1, a2)) {
									// Found a pair of actions that adds these facts, so they are not mutex
									isMutex = false;
									break;
								}
							}
							if (!isMutex) {
								break;
							}
						}

						if (isMutex) {
							addMutex(fact1, fact2);
						}
					}
				} else {
					// We can stop when we reach the same fact, as in addMutex we are adding mutex in both ways
					break;
				}
			}
		}
	}

	private void addMutex(Fact fact1, Fact fact2) {
		if(!this.mutexes.containsKey(fact1)) {
			this.mutexes.put(fact1, new HashSet<>(Collections.singletonList(fact2)));
		} else {
			this.mutexes.get(fact1).add(fact2);
		}

		if(!this.mutexes.containsKey(fact2)) {
			this.mutexes.put(fact2, new HashSet<>(Collections.singletonList(fact1)));
		} else {
			this.mutexes.get(fact2).add(fact1);
		}
	}

	private void populateStaticFactMutex(DomainProblemAdapter adapter) {
		staticMutexes = new HashMap<>();

		for(Fact fact : adapter.getJavaffParser().getGroundedPropositions()) {
			staticMutexes.put(fact, new HashSet<>(Collections.singletonList(new Not(fact))));
			staticMutexes.put(new Not(fact), new HashSet<>(Collections.singletonList(fact)));
		}
	}

	boolean hasCompetingNeeds(Action action1, Action action2) {
		for(Fact fact1 : action1.getPreconditions()) {
			for(Fact fact2 : action2.getPreconditions()) {
				if(isFactMutex(fact1, fact2)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * No goods
	 */

	int getNumberOfNoGoods() {
		return noGoods.size();
	}

	boolean isNoGood(List<Fact> subgoalFacts) {
		return noGoods.contains(new HashSet<>(subgoalFacts));
	}

	void addNoGood(List<Fact> subgoalFacts) {
		noGoods.add(new HashSet<>(subgoalFacts));
//		Logger.debug("Adding NoGoods - Level {} with subgoals {}", level, subgoalFacts);
	}

	/**
	 * Utils
	 */

	@Override
	public String toString() {
		return facts.toString();
	}
}
