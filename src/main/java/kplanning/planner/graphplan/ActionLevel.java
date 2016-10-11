package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Not;

import java.util.*;

class ActionLevel {
	private StateLevel previousStateLevel;
	private Set<Action> actions;
	private Map<Action, Set<Action>> mutexes;
	private static Map<Action, Set<Action>> staticMutexes;
	private int level;

	ActionLevel(StateLevel previousStateLevel, int level, Set<Action> applicableActions, Set<Action> allActions) {
		this.previousStateLevel = previousStateLevel;
		this.level = level;
		this.mutexes = new HashMap<>();
		this.actions = applicableActions;
		if(this.level == 0) {
			populateStaticActionMutex(allActions);
		}
		populateMutex();
	}

	/**
	 * Mutexes
	 */

	boolean isActionMutex(Action action1, Action action2) {
		return mutexes.containsKey(action1) && mutexes.get(action1).contains(action2);
	}

	Set<Action> getMutex(Action action) {
		return this.mutexes.containsKey(action)? this.mutexes.get(action) : Collections.emptySet();
	}

	int getNumberOfMutexes() {
		int res = 0;
		for (Set<Action> mutex : mutexes.values()) {
			res += mutex.size();
		}
		return res;
	}

	private void populateMutex() {
		// The only action mutex that can exists, besides the basic action mutexes, are COMPETING_NEEDS mutexes due to Fact mutexes in this state level
		for(Action action1 : this.actions) {
			for (Action action2 : this.actions) {
				if(!action1.equals(action2)) {
					if(staticMutexes.containsKey(action1) && staticMutexes.get(action1).contains(action2)) {
						addMutex(action1, action2);
					} else if (previousStateLevel.hasCompetingNeeds(action1, action2)) {
						addMutex(action1, action2);
					}
				} else {
					// We can stop when we reach the same action, as in addMutex we are adding mutex in both ways
					break;
				}
			}
		}
	}

	private void addMutex(Action action1, Action action2) {
		if(!this.mutexes.containsKey(action1)) {
			this.mutexes.put(action1, new HashSet<>(Collections.singletonList(action2)));
		} else {
			this.mutexes.get(action1).add(action2);
		}

		if(!this.mutexes.containsKey(action2)) {
			this.mutexes.put(action2, new HashSet<>(Collections.singletonList(action1)));
		} else {
			this.mutexes.get(action2).add(action1);
		}
	}

	private void populateStaticActionMutex(Set<Action> allActions) {
		staticMutexes = new HashMap<>();

		for(Action action1 : allActions) {
			for(Action action2 : allActions) {
				if(!action1.equals(action2)) {
					if(hasInconsistentEffects(action1, action2) || hasInterference(action1, action2) || this.previousStateLevel.hasCompetingNeeds(action1, action2)) {
						if(!staticMutexes.containsKey(action1)) {
							staticMutexes.put(action1, new HashSet<>(Collections.singletonList(action2)));
						} else {
							staticMutexes.get(action1).add(action2);
						}
					}
				}
			}
		}
	}

	/**
	 * Inconsistent effects
	 */

	private boolean hasInconsistentEffects(Action action1, Action action2) {
		return hasInconsistentEffects(action1.getAddPropositions(), action2.getDeletePropositions())
				|| hasInconsistentEffects(action2.getAddPropositions(), action1.getDeletePropositions());
	}

	private boolean hasInconsistentEffects(Set<Fact> addPropositions, Set<Not> deletePropositions) {
		for(Fact fact1 : addPropositions) {
			for(Not notFact2 : deletePropositions) {
				if(fact1.equals(notFact2.getLiteral())) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Interference
	 */

	private boolean hasInterference(Action action1, Action action2) {
		return hasInterference(action1, action2.getPreconditions()) || hasInterference(action2, action1.getPreconditions());
	}

	private boolean hasInterference(Action action, Set<Fact> preconditions) {
		for(Fact p : preconditions) {
			if(p instanceof Not) {
				for(Fact e : action.getAddPropositions()) {
					if(e.equals(((Not) p).getLiteral())) {
						return true;
					}
				}
			} else {
				for(Fact n : action.getDeletePropositions()) {
					if(((Not) n).getLiteral().equals(p)) {
						return true;
					}
				}
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return actions.toString();
	}
}
