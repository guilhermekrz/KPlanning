package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static kplanning.planner.graphplan.MutexHelper.INCONSISTENT_SUPPORT;
import static kplanning.planner.graphplan.MutexHelper.NO_MUTEX;

class StateLevel {
	private MutexHelper mutexKeeper;
	private Set<Fact> facts;
	private Map<Fact, List<Action>> actionsThatAddFacts;
	private int[][] mutex;
	private int level;
	private ActionLevel previousActionLevel;

	StateLevel(MutexHelper mutexKeeper, Set<Fact> facts) {
		this(mutexKeeper, 0, facts, null, null);
	}

	StateLevel(MutexHelper mutexKeeper, int level, Set<Fact> facts, Map<Fact, List<Action>> actionsThatAddFacts, ActionLevel previousActionLevel) {
		this.mutexKeeper = mutexKeeper;
		this.previousActionLevel = previousActionLevel;
		this.level = level;
		this.facts = facts;
		this.actionsThatAddFacts = actionsThatAddFacts;
		populateMutex();
	}

	private void populateMutex() {
		mutex = mutexKeeper.getBasicFactMutex();
		// TODO: we could construct a mutex with size*size/2 cells...
		if(level != 0) {
			for (Fact fact1 : facts) {
				for (Fact fact2 : facts) {
					if (!fact1.equals(fact2)) {
						List<Action> actions1 = actionsThatAddFacts.get(fact1);
						List<Action> actions2 = actionsThatAddFacts.get(fact2);

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
							mutex[index(fact1)][index(fact2)] = mutex[index(fact1)][index(fact2)] | INCONSISTENT_SUPPORT;
							mutex[index(fact2)][index(fact1)] = mutex[index(fact2)][index(fact1)] | INCONSISTENT_SUPPORT;
						}
					}
				}
			}
		}
	}

	Set<Fact> getFacts() {
		return Collections.unmodifiableSet(facts);
	}

	Map<Fact, List<Action>> getActionsThatAddFacts() {
		return Collections.unmodifiableMap(actionsThatAddFacts);
	}

	boolean isFactsMutex(Set<Fact> factsMutex) {
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
		return mutex[index(fact1)][index(fact2)] != NO_MUTEX || mutex[index(fact2)][index(fact1)] != NO_MUTEX;
	}

	boolean hasCompetingNeeds(Action action1, Action action2) {
		for(Fact fact1 : action1.getPreconditions()) {
			for(Fact fact2 : action2.getPreconditions()) {
				if(mutex[index(fact1)][index(fact2)] != NO_MUTEX || mutex[index(fact2)][index(fact1)] != NO_MUTEX) {
					return true;
				}
			}
		}
		return false;
	}

	private int index(Fact fact) {
		return mutexKeeper.index(fact);
	}

	@Override
	public String toString() {
		return facts.toString();
	}
}
