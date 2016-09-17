package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.Not;
import kplanning.util.ArrayUtil;

import java.util.Collections;
import java.util.Set;

import static kplanning.planner.graphplan.MutexHelper.*;

class ActionLevel {
	private StateLevel previousStateLevel;
	private MutexHelper mutexKeeper;
	private Set<Action> actions;
	private static int[][] basicActionMutex;
	private static int numberOfBasicMutexes;
	private int[][] mutex;
	private int numberOfMutexes;
	private int level;

	ActionLevel(StateLevel previousStateLevel, MutexHelper mutexKeeper, int level, Set<Action> applicableActions, Set<Action> allActions) {
		this.previousStateLevel = previousStateLevel;
		this.mutexKeeper = mutexKeeper;
		this.level = level;
		this.actions = applicableActions;
		if(this.level == 0) {
			populateBasicActionMutex(allActions);
		}
		populateMutex();
	}

	private void populateMutex() {
		mutex = getBasicActionMutex();
		numberOfMutexes = numberOfBasicMutexes;

		// The only action mutex that can exists, besides the basic action mutexes, are COMPETING_NEEDS mutexes due to Fact mutexes in this state level
		for(Action action1 : actions) {
			for (Action action2 : actions) {
				if(previousStateLevel.hasCompetingNeeds(action1, action2)) {
					if(mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] == NO_MUTEX) {
						// This is not a basic mutex, so increment one mutex
						numberOfMutexes++;
					}
					mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] = mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] | COMPETING_NEEDS;
					mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] = mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] | COMPETING_NEEDS;
				}
			}
		}
	}

	public Set<Action> getActions() {
		return Collections.unmodifiableSet(actions);
	}

	int getNumberOfMutexes() {
		return numberOfMutexes;
	}

	boolean isActionsMutex(Set<Action> actions) {
		for(Action action1 : actions) {
			for(Action action2 : actions) {
				if(isActionMutex(action1, action2)) {
					return true;
				}
			}
		}
		return false;
	}

	boolean isActionMutex(Action action1, Action action2) {
		return mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] != MutexHelper.NO_MUTEX || mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] != MutexHelper.NO_MUTEX;
	}

	/**
	 * Basic action mutex
	 */

	private int[][] getBasicActionMutex() {
		return ArrayUtil.cloneArray(basicActionMutex);
	}

	private void populateBasicActionMutex(Set<Action> actions) {
		basicActionMutex = new int[actions.size()][actions.size()];
		numberOfBasicMutexes = 0;
		// TODO: we could construct a mutex with size*size/2 cells...
		for(Action action1 : actions) {
			for(Action action2 : actions) {
				if(!action1.equals(action2)) {
					boolean shouldAdd = false;
					if(hasInconsistentEffects(action1, action2)) {
						shouldAdd = true;
						basicActionMutex[index(action1)][index(action2)] = basicActionMutex[index(action1)][index(action2)] | INCONSISTENT_EFFECTS;
						basicActionMutex[index(action2)][index(action1)] = basicActionMutex[index(action2)][index(action1)] | INCONSISTENT_EFFECTS;
					}
					if(hasInterference(action1, action2)) {
						shouldAdd = true;
						basicActionMutex[index(action1)][index(action2)] = basicActionMutex[index(action1)][index(action2)] | INTERFERENCE;
						basicActionMutex[index(action2)][index(action1)] = basicActionMutex[index(action2)][index(action1)] | INTERFERENCE;
					}
					if(this.previousStateLevel.hasCompetingNeeds(action1, action2)) {
						shouldAdd = true;
						basicActionMutex[index(action1)][index(action2)] = basicActionMutex[index(action1)][index(action2)] | COMPETING_NEEDS;
						basicActionMutex[index(action2)][index(action1)] = basicActionMutex[index(action2)][index(action1)] | COMPETING_NEEDS;
					}
					if(shouldAdd) {
						numberOfBasicMutexes++;
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

	private int index(Action action) {
		return mutexKeeper.index(action);
	}

	@Override
	public String toString() {
		return actions.toString();
	}

	// For test purposes
	boolean isInconsistentEffectsMutex(Action action1, Action action2) {
		return ((mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] & INCONSISTENT_EFFECTS) != 0) || ((mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] & INCONSISTENT_EFFECTS) != 0);
	}

	boolean isInterferenceMutex(Action action1, Action action2) {
		return ((mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] & INTERFERENCE) != 0) || ((mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] & INTERFERENCE) != 0);
	}

	boolean isCompetingNeedsMutex(Action action1, Action action2) {
		return ((mutex[mutexKeeper.index(action1)][mutexKeeper.index(action2)] & COMPETING_NEEDS) != 0) || ((mutex[mutexKeeper.index(action2)][mutexKeeper.index(action1)] & COMPETING_NEEDS) != 0);
	}
}
