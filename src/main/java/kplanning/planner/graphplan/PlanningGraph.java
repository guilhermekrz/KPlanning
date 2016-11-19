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

// TODO: document requirements (complete README)
// TODO: add disjunctive preconditions, conditional effects support?
// TODO: allow disjuntive goals
// TODO: make a lifted planner? make a bitset planner?
// Assumption: AND goal
public class PlanningGraph {

	enum ActionSort {
		NONE, NUMBER_OF_PRECONDITIONS, ACTION_INDEX
	}

	private enum FactSort {
		NONE, NUMBER_OF_GENERATING_ACTIONS, LEVEL_COST
	}

	DomainProblemAdapter adapter;
	Set<Action> actions;
	List<StateLevel> stateLevels;
	List<ActionLevel> actionLevels;
	Map<Fact, Integer> levelCost;
	Map<Action, Integer> actionCost;

	ActionSort actionSort = ActionSort.ACTION_INDEX;
	FactSort factSort = FactSort.NUMBER_OF_GENERATING_ACTIONS;

	public PlanningGraph(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		stateLevels = new ArrayList<>();
		actionLevels = new ArrayList<>();
		populateActions();
		levelCost = new HashMap<>();
		actionCost = new HashMap<>();
		addInitialLevel();
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
		Set<Fact> initialStateFacts = adapter.getJavaffParser().getCompleteInitState().getFacts();
		stateLevels.add(new StateLevel(initialStateFacts, adapter));
		populateLevelCost(initialStateFacts, getCurrentLevel());

	}

	public boolean isGoalPossible() {
		Set<Fact> goalFacts = adapter.getJavaffParser().getGroundProblem().getGoal().getFacts();
		boolean goalsPossible = isGoalPossible(goalFacts);
		Logger.debug("Goals possible at level {}? {}", getCurrentLevel(), goalsPossible);
		return goalsPossible;
	}

	public boolean isGoalPossible(Set<Fact> facts) {
		return getLastStateLevel().isGoalPossible(facts);
	}

	public void expandGraph() {
		Logger.debug("Expanding Graph to Level {}", getCurrentLevel() + 1);
		StateLevel previousLevel = getLastStateLevel();
		Set<Action> applicableActions = new HashSet<>();
		Set<Fact> applicableActionsEffects = new HashSet<>();
		Map<Fact, Set<Action>> actionsThatAddFact = new HashMap<>();
		for(Action action : actions) {
			Set<Fact> preconditions = action.getPreconditions();
			if(previousLevel.getFacts().containsAll(preconditions) && !previousLevel.isFactsMutex(preconditions)) {
				applicableActions.add(action);
				applicableActionsEffects.addAll(action.getAddPropositions());
				applicableActionsEffects.addAll(action.getDeletePropositions());
				addActionToActionsThatAddFactMap(actionsThatAddFact, action);
				if(actionSort.equals(ActionSort.ACTION_INDEX)) {
					actionCost.putIfAbsent(action, getCurrentLevel());
				} else if(actionSort.equals(ActionSort.NUMBER_OF_PRECONDITIONS)) {
					if (actionCost.get(action) == null) {
						Integer l = 0;
						for (Fact f : action.getPreconditions()) {
							l += levelCost.get(f);
						}
						actionCost.put(action, l);
					}
				}
			}
		}
		ActionLevel actionLevel = new ActionLevel(getLastStateLevel(), getCurrentLevel(), applicableActions, this.actions);
		actionLevels.add(actionLevel);

		Set<Fact> nextLevelFacts = new HashSet<>();
		nextLevelFacts.addAll(previousLevel.getFacts());
		nextLevelFacts.addAll(applicableActionsEffects);
		StateLevel nextLevel = new StateLevel(getCurrentLevel() + 1, nextLevelFacts, actionsThatAddFact, actionLevel, adapter);
		stateLevels.add(nextLevel);
		populateLevelCost(nextLevelFacts, getCurrentLevel());
	}

	/**
	 * Same number of mutexes and no-goods as the previous level
	 */

	public boolean hasLevelledOff() {
		if(getCurrentLevel() == 0 || getCurrentLevel() == 1) {
			return false;
		}
		StateLevel previousStateLevel = stateLevels.get(stateLevels.size() - 2);
		StateLevel currentStateLevel = stateLevels.get(stateLevels.size() - 1);
		ActionLevel previousActionLevel = actionLevels.get(actionLevels.size() - 2);
		ActionLevel currentActionLevel = actionLevels.get(actionLevels.size() - 1);

		boolean hasLevelledOff = (previousStateLevel.getNumberOfNoGoods() == currentStateLevel.getNumberOfNoGoods()
				&& (previousActionLevel.getNumberOfMutexes() == currentActionLevel.getNumberOfMutexes()));
		Logger.debug("Graph has levelled off at level {}? {} - # noGoods  {} -> {} - # mutex {} -> {}",
				getCurrentLevel(), hasLevelledOff, previousStateLevel.getNumberOfNoGoods(), currentStateLevel.getNumberOfNoGoods(),
				previousActionLevel.getNumberOfMutexes(), currentActionLevel.getNumberOfMutexes());
		if(hasLevelledOff) {
			Logger.debug("Could not find a solution");
		}
		return hasLevelledOff;
	}

	/**
	 * Expand graph utils
	 */

	private Action getNoOpAction(Fact fact) {
		STRIPSInstantAction action = new STRIPSInstantAction(PlanUtil.INTERNAL_NOOP_ACTION_NAME + "_" + fact.toString().replace(" ", "_"));
		action.setCondition(new And(fact));
		action.addAddProposition(fact);
		return action;
	}

	private void addActionToActionsThatAddFactMap(Map<Fact, Set<Action>> actionsThatAddFact, Action action) {
		for(Fact fact: action.getAddPropositions()) {
			Set<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new HashSet<>(Collections.singletonList(action)));
			} else {
				actions.add(action);
				actionsThatAddFact.put(fact, actions);
			}
		}
		for(Fact fact: action.getDeletePropositions()) {
			Set<Action> actions = actionsThatAddFact.get(fact);
			if(actions == null) {
				actionsThatAddFact.put(fact, new HashSet<>(Collections.singletonList(action)));
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
		List<Fact> subgoalFactsList = new ArrayList<>(subgoalFacts);
		sortFacts(foundAllSolutions, getCurrentLevel(), subgoalFactsList);
		List<List<Set<Action>>> solutions = extractSolution(getCurrentLevel(), new HashSet<>(), new HashSet<>(), subgoalFactsList, foundAllSolutions);
		if(solutions != null) {
			Logger.debug("Extract solution FOUND solution at level {}", getCurrentLevel());
			PlanSolution planSolution = new PlanSolution(adapter, solutions);
			Logger.debug(planSolution);
			return planSolution;
		} else {
			Logger.debug("Extract solution did NOT found solution at level {}", getCurrentLevel());
			getLastStateLevel().addNoGood(subgoalFactsList);
			return null;
		}
	}

	/**
	 * Try to find a solution backwards
	 * Note that this method has two main functions:
	 * 1) Search backwards
	 * 2) Generate the set of actions that reaches the current subgoals
	 *
	 * First I tried to generate all solutions that reach a certain subgoals, but this was not efficient because:
	 * a) We first had to generate all possible combinations of actions, which can be huge for high levels;
	 * b) We could not fully benefit from mutex relations, to prune conflicting set of actions
	 * So this method became quite a ~mess~, trying to do two functions inside one method.
	 *
	 * @param level Current level being searched (starts at 0: stateLevel0, actionLevel0, stateLevel1, actionLevel1,...)
	 * @param actionSet Actions currently being tried in this level, to reach the current subgoals
	 * @param mutexSet Actions that can not occur simultaneously with any action in actionSet (we don't need to bother trying with these actions)
	 * @param subgoalFacts Current subgoals being considered
	 * @param foundAllSolutions Indicate if we want all possible solutions or not (note that, if we want all solutions, heuristics are not necessary)
	 * @return A list with all possible solutions, or null if there is no available solution given these constraints
	 */
	@Nullable
	List<List<Set<Action>>> extractSolution(int level, Set<Action> actionSet, Set<Action> mutexSet, List<Fact> subgoalFacts, boolean foundAllSolutions) {
		if (level == 0) {
			// If we reached level 0, we just need to check if the initial level has all the subgoals, and return accordingly
			StateLevel stateLevel = stateLevels.get(level);
			if (stateLevel.getFacts().containsAll(subgoalFacts)) {
				// Goals are possible
				return Collections.emptyList();
			} else {
				// Goals are not possible
				return null;
			}
		}

		if(subgoalFacts.isEmpty()) {
			// When subgoal is empty, it means that we are ready to try to go to the next level (previous level), trying to find a solution backwards
			List<List<Set<Action>>> solutions = new ArrayList<>();
			StateLevel previousStateLevel = stateLevels.get(level - 1);

			// New subgoals became current actions preconditions (these actions are already conflict-free, so we do not need to check this here)
			List<Fact> newSubgoalFacts = getNewSubGoals(foundAllSolutions, level - 1, actionSet);

			// We need to check if these new subgoals are not mutex, and also if they are not "noGoods" (if we already failed to find a solution for them for the previous level)
			if (previousStateLevel.isGoalPossible(newSubgoalFacts) && !previousStateLevel.isNoGood(newSubgoalFacts)) {
				// Try to find a solution, in the previous level, for these new subgoals
				// sortFacts(foundAllSolutions, level, newSubgoalFacts);
				List<List<Set<Action>>> listsFromPreviousLevel = extractSolution(level - 1, new HashSet<>(), new HashSet<>(), newSubgoalFacts, foundAllSolutions);

				if (listsFromPreviousLevel != null) {
					// If we have found a solution (or many solutions), add this level action set to the end of each solution (plan)
					if (listsFromPreviousLevel.isEmpty()) {
						List<Set<Action>> l = new ArrayList<>();
						l.add(actionSet);
						solutions.add(l);
					} else {
						for (List<Set<Action>> l : listsFromPreviousLevel) {
							l.add(actionSet);
						}
						solutions.addAll(listsFromPreviousLevel);
					}
				} else {
					// If we have not found a solution, then this new subgoals are "noGoods" at the previous level
					previousStateLevel.addNoGood(newSubgoalFacts);
				}
			}

			if (solutions.isEmpty()) {
				// We haven't found any solution
				return null;
			} else {
				// Returning all found solutions
				return solutions;
			}
		} else {
			// All found solutions
			List<List<Set<Action>>> solutions = new ArrayList<>();

			// We need to consider which actions to try
			ActionLevel previousActionLevel = actionLevels.get(level - 1);

			// Find all actions that reaches first current subgoal
			Fact firstSubgoal = subgoalFacts.get(0);
			List<Action> possibleActions = stateLevels.get(level).getSortedActionsThatAddFact(firstSubgoal, foundAllSolutions, actionSort, levelCost, actionCost);
//			System.out.println(level + " " + firstSubgoal + " - subgoals size: " + subgoalFacts.size() + " - action set: " + actionSet);
			for (Action possibleAction : possibleActions) {
				if (!mutexSet.contains(possibleAction)) {
					// If this actions is not mutex with the previous selected actions, then add this to the new action set and construct a new mutex set
					Set<Action> newActionSet = new HashSet<>(actionSet);
					newActionSet.add(possibleAction);

					Set<Action> newMutexSet = new HashSet<>(mutexSet);
					newMutexSet.addAll(previousActionLevel.getMutex(possibleAction));

					// Get new subgoals based on the effects that this action achieves (or deletes) - a single action can achieve more than one subgoal!
					List<Fact> newSubgoalSet = getNewSubGoals(possibleAction, subgoalFacts);

					if (needToBackUp(level, newSubgoalSet, newMutexSet)) {
						// There is no way to extract a solution with this selected action
						continue;
					}

					// Call recursively extract solutions, with the smaller new subgoals, and the new action set
					List<List<Set<Action>>> tempSolutions = extractSolution(level, newActionSet, newMutexSet, newSubgoalSet, foundAllSolutions);
					if (tempSolutions != null) {
						solutions.addAll(tempSolutions);

						if (!foundAllSolutions) {
							return solutions;
						}
					}
				}
			}

			if(!solutions.isEmpty()) {
				return solutions;
			} else {
				return null;
			}
		}
	}

	private void sortFacts(boolean foundAllSolutions, int level, List<Fact> subgoalFacts) {
		if(!foundAllSolutions && !factSort.equals(FactSort.NONE)) {
			StateLevel stateLevel = stateLevels.get(level);
			subgoalFacts.sort((fact1, fact2) -> {
				if(factSort.equals(FactSort.NUMBER_OF_GENERATING_ACTIONS)) {
					if(level != 0) {
						return Integer.compare(stateLevel.getNumberOfActionsThatAddFact(fact1), stateLevel.getNumberOfActionsThatAddFact(fact2));
					} else {
						return 0;
					}
				} else if(factSort.equals(FactSort.LEVEL_COST)) {
					Integer l1 = levelCost.get(fact1);
					Integer l2 = levelCost.get(fact2);
					return l2.compareTo(l1);
				} else {
					return 0;
				}
			});
		}
	}

	List<Fact> getNewSubGoals(boolean foundAllSolutions, int level, Set<Action> actionSet) {
		Set<Fact> newSubgoalFactsSet = new HashSet<>();
		for (Action action : actionSet) {
			newSubgoalFactsSet.addAll(action.getPreconditions());
		}
		List<Fact> newSubgoalFacts = new ArrayList<>(newSubgoalFactsSet);
		sortFacts(foundAllSolutions, level, newSubgoalFacts);
		return newSubgoalFacts;
	}

	List<Fact> getNewSubGoals(Action action, List<Fact> currentSubgoals) {
		List<Fact> newSubgoals = new ArrayList<>();
		for(Fact fact : currentSubgoals) {
			if(fact instanceof Not) {
				if(!action.getDeletePropositions().contains(fact)) {
					newSubgoals.add(fact);
				}
			} else {
				if(!action.getAddPropositions().contains(fact)) {
					newSubgoals.add(fact);
				}
			}
		}
		return newSubgoals;
	}

	// Perform forward-checking (pg 289 of "Fast planning through planning graph analysis)
	boolean needToBackUp(int level, List<Fact> newSubgoalSet, Set<Action> newMutexSet) {
		for(Fact f : newSubgoalSet) {
			Set<Action> actionsThatAddFact = stateLevels.get(level).getActionsThatAddFact(f);
			Set<Action> a = new HashSet<>(actionsThatAddFact);
			a.removeAll(newMutexSet);
			if(a.isEmpty()) {
				// All the actions creating this subgoal are exclusive of actions we have currently selected (use new mutex set)
				return true;
			}
		}
		return false;
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

	private void populateLevelCost(Set<Fact> facts, int level) {
		for(Fact fact : facts) {
			levelCost.putIfAbsent(fact, level);
		}
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
