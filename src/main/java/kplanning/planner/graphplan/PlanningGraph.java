package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import javaff.data.strips.And;
import javaff.data.strips.Not;
import javaff.data.strips.Proposition;
import javaff.data.strips.STRIPSInstantAction;
import kplanning.DomainProblemAdapter;
import kplanning.plan.PlanSolution;
import kplanning.plan.PlanUtil;
import org.jetbrains.annotations.Nullable;
import org.pmw.tinylog.Logger;

import java.util.*;

// Assumption: AND goal
public class PlanningGraph {

	private DomainProblemAdapter adapter;
	private Set<Action> actions;
	private List<StateLevel> stateLevels;
	private List<ActionLevel> actionLevels;
	private MutexHelper mutexKeeper;
	private Set<Pair<Integer, Set<Fact>>> noGoods;
	private Map<Integer, Integer> noGoodsCount; // level, no goods count

	public PlanningGraph(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		stateLevels = new ArrayList<>();
		actionLevels = new ArrayList<>();
		populateActions();
		mutexKeeper = new MutexHelper(adapter, actions);
		addInitialLevel();
		noGoods = new HashSet<>();
		noGoodsCount = new HashMap<>();
	}

	private void populateActions() {
		actions = new HashSet<>();
		actions.addAll(adapter.getJavaffParser().getGroundProblem().getActions());
		Set<Proposition> groundedPropositions = adapter.getJavaffParser().getGroundedPropositions();
		for(Proposition proposition : groundedPropositions) {
			actions.add(getNoOpAction(proposition));
			actions.add(getNoOpAction(new Not(proposition)));
		}
	}

	private void addInitialLevel() {
		stateLevels.add(new StateLevel(mutexKeeper, adapter.getJavaffParser().getCompleteInitState()));
	}

	public boolean isGoalPossible() {
		Set<Fact> goalFacts = adapter.getJavaffParser().getGroundProblem().getGoal().getFacts();
		boolean goalsPossible = getLastStateLevel().getFacts().containsAll(goalFacts)
				&& !getLastStateLevel().isFactsMutex(goalFacts);
		Logger.debug("Goals possible at level {}? {}", getCurrentLevel(), goalsPossible);
		return goalsPossible;
	}

	public void expandGraph() {
		Logger.debug("Expanding Graph to Level {}", getCurrentLevel() + 1);
		StateLevel previousLevel = getLastStateLevel();
		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		Set<Action> applicableActions = new HashSet<>();
		Set<Fact> applicableActionsEffects = new HashSet<>();
		Map<Fact, List<Action>> actionsThatAddFact = new HashMap<>();
		for(Action action : actions) {
			Set<Fact> preconditions = action.getPreconditions();
			if(previousLevel.getFacts().containsAll(preconditions)) {
				applicableActions.add(action);
				applicableActionsEffects.addAll(action.getAddPropositions());
				applicableActionsEffects.addAll(action.getDeletePropositions());
				addActionToActionsThatAddFactMap(actionsThatAddFact, action);
			}
		}
		addNoOpActions(actionsThatAddFact, previousLevel.getFacts());
		ActionLevel actionLevel = new ActionLevel(getLastStateLevel(), mutexKeeper, getCurrentLevel(), applicableActions, this.actions);
		actionLevels.add(actionLevel);

		Set<Fact> nextLevelFacts = new HashSet<>();
		nextLevelFacts.addAll(previousLevel.getFacts());
		nextLevelFacts.addAll(applicableActionsEffects);
		StateLevel nextLevel = new StateLevel(mutexKeeper, getCurrentLevel() + 1, nextLevelFacts, actionsThatAddFact, actionLevel);
		stateLevels.add(nextLevel);
	}

	/**
	 * Same number of mutexes and no-goods as the previous level
	 */

	public boolean hasLevelledOff() {
		if(getCurrentLevel() == 0 || getCurrentLevel() == 1) {
			return false;
		}
		Integer numNoGoodsAtPreviousLevel = noGoodsCount.get(getCurrentLevel() - 1);
		Integer numNoGoodsAtCurrentLevel = noGoodsCount.get(getCurrentLevel());
		ActionLevel previousActionLevel = actionLevels.get(actionLevels.size() - 2);
		ActionLevel currentActionLevel = actionLevels.get(actionLevels.size() - 1);
		boolean hasLevelledOff = (Objects.equals(numNoGoodsAtPreviousLevel, numNoGoodsAtCurrentLevel))
				&& previousActionLevel.getNumberOfMutexes() == currentActionLevel.getNumberOfMutexes();
		Logger.debug("Graph has levelled off at level {}? {} - # noGoods  {} -> {} - # mutex {} -> {}",
				getCurrentLevel(), hasLevelledOff, numNoGoodsAtPreviousLevel, numNoGoodsAtCurrentLevel,
				previousActionLevel.getNumberOfMutexes(), currentActionLevel.getNumberOfMutexes());
		return hasLevelledOff;
	}

	/**
	 * Expand graph utils
	 */

	private void addNoOpActions(Map<Fact, List<Action>> actionsThatAddFact, Set<Fact> facts) {
		for(Fact fact : facts) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(getNoOpAction(fact))));
			} else {
				actions.add(getNoOpAction(fact));
				actionsThatAddFact.put(fact, actions);
			}
		}
	}

	private Action getNoOpAction(Fact fact) {
		STRIPSInstantAction action = new STRIPSInstantAction(PlanUtil.INTERNAL_NOOP_ACTION_NAME + "_" + fact.toString().replace(" ", "_"));
		action.setCondition(new And(fact));
		action.addAddProposition(fact);
		return action;
	}

	private void addActionToActionsThatAddFactMap(Map<Fact, List<Action>> actionsThatAddFact, Action action) {
		for(Fact fact: action.getAddPropositions()) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(action)));
			} else {
				actions.add(action);
				actionsThatAddFact.put(fact, actions);
			}
		}
		for(Fact fact: action.getDeletePropositions()) {
			List<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new ArrayList<>(Collections.singletonList(action)));
			} else {
				actions.add(action);
				actionsThatAddFact.put(fact, actions);
			}
		}
	}

	/**
	 * Extract solution
	 */

	@Nullable
	public PlanSolution extractSolution(boolean foundAllSolutions) {
		Set<Fact> subgoalFacts = adapter.getJavaffParser().getGroundProblem().getGoal().getFacts();
		Set<List<Set<Action>>> solutions = extractSolution(getCurrentLevel(), subgoalFacts, foundAllSolutions);
		if(solutions != null) {
			Logger.debug("Extract solution FOUND solution at level {}", getCurrentLevel());
			return new PlanSolution(adapter, solutions);
		} else {
			Logger.debug("Extract solution did NOT found solution at level {}", getCurrentLevel());
			return null;
		}
	}

	@Nullable
	private Set<List<Set<Action>>> extractSolution(int level, Set<Fact> subgoalFacts, boolean foundAllSolutions) {
		if(level == 0) {
			StateLevel stateLevel = stateLevels.get(level);
			if(stateLevel.getFacts().containsAll(subgoalFacts)) {
				// Goals are possible
				return Collections.emptySet();
			} else {
				// Goals are not possible
				return null;
			}
		}

		if(noGoods.contains(new Pair<>(level, subgoalFacts))) {
//			Logger.debug("Pruning NoGoods - Level {} with subgoals {}", level, subgoalFacts);
			return null;
		}

		Map<Fact, List<Action>> actionsThatAddFacts = stateLevels.get(level).getActionsThatAddFacts();
		Map<Fact, List<Action>> actionsThatAddFactsMutable = new HashMap<>(actionsThatAddFacts);
		Set<List<Action>> allActions = new HashSet<>();
		for(Fact fact : subgoalFacts) {
			allActions.add(actionsThatAddFactsMutable.get(fact));
		}
		Set<Set<Action>> sets = generateAllPossibleSolutions(allActions);

		Set<List<Set<Action>>> ret = new HashSet<>();
		ActionLevel previousActionLevel = actionLevels.get(level - 1);
		StateLevel currentStateLevel = getLastStateLevel();

		for(Set<Action> set : sets) {
			if(!previousActionLevel.isActionsMutex(set)) {
				Set<Fact> newSubgoalFacts = new HashSet<>();
				for (Action action : set) {
					newSubgoalFacts.addAll(action.getPreconditions());
				}

				if(!currentStateLevel.isFactsMutex(newSubgoalFacts)) {
					Set<List<Set<Action>>> listsFromPreviousLevel = extractSolution(level - 1, newSubgoalFacts, foundAllSolutions);
					if (listsFromPreviousLevel != null) {
						if (listsFromPreviousLevel.isEmpty()) {
							List<Set<Action>> l = new ArrayList<>();
							l.add(set);
							ret.add(l);
							if(!foundAllSolutions) {
								break;
							}
						} else {
							for (List<Set<Action>> l : listsFromPreviousLevel) {
								l.add(set);
							}
							ret.addAll(listsFromPreviousLevel);
							if(!foundAllSolutions) {
								break;
							}
						}
					}
				}
			}
		}

		if(ret.isEmpty()) {
			addNoGood(subgoalFacts, level);
			return null;
		} else {
			return ret;
		}
	}

	private void addNoGood(Set<Fact> subgoalFacts, int level) {
		noGoods.add(new Pair<>(level, subgoalFacts));
		Integer count = noGoodsCount.get(level);
		if(count == null) {
			count = 0;
		}
		noGoodsCount.put(level, count + 1);
//		Logger.debug("Adding NoGoods - Level {} with subgoals {}", level, subgoalFacts);
	}

	// TODO: our algorithm should work inside here if we want to return just the optimal solution
	// Use (page 385): 1. Pick first the literal with the highest level cost.
	// 2. To achieve that literal, prefer actions with easier preconditions. That is, choose an action such that the sum (or maximum) of the level costs of its preconditions is smallest.
	private Set<Set<Action>> generateAllPossibleSolutions(Set<List<Action>> allActions) {
		if(allActions.iterator().hasNext()) {
			Set<Set<Action>> r = new HashSet<>();
			List<Action> list = allActions.iterator().next();
			allActions.remove(list);
			Set<Set<Action>> result = generateAllPossibleSolutions(allActions);
			for(Action action : list) {
				Set<Set<Action>> temp = new HashSet<>(result);
				if(temp.isEmpty()) {
					r.add(new HashSet<>(Collections.singletonList(action)));
				} else {
					for (Set<Action> set : temp) {
						Set<Action> newSet = new HashSet<>(set);
						newSet.add(action);
						r.add(newSet);
					}
				}
			}
			return r;
		} else {
			return Collections.emptySet();
		}
	}

	/**
	 * Utils
	 */

	private int getCurrentLevel() {
		return stateLevels.size() - 1;
	}

	private StateLevel getLastStateLevel() {
		return stateLevels.get(getCurrentLevel());
	}

	// For tests
	ActionLevel getActionLevel(int level) {
		return actionLevels.get(level);
	}

	@Override
	public String toString() {
		String s = "";
		for(int i=0;i<stateLevels.size() || i < actionLevels.size(); i++) {
			if(i<stateLevels.size()) {
				s += "State" + i + ": " + stateLevels.get(i) + "\n";
			}
			if(i<actionLevels.size()) {
				s += "Action" + i + ": " + actionLevels.get(i) + "\n";
			}
		}
		return s;
	}
}
