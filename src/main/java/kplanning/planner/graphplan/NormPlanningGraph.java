package kplanning.planner.graphplan;

import javaff.data.Action;
import javaff.data.Fact;
import kplanning.DomainProblemAdapter;
import kplanning.norm.ConditionalNorm;
import kplanning.norm.LtlNorm;
import kplanning.norm.Norm;
import org.jetbrains.annotations.Nullable;
import org.pmw.tinylog.Logger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.*;

public class NormPlanningGraph extends PlanningGraph {

	private boolean returnNormCompliantPlans;
	private Set<? extends Norm> norms;

	public NormPlanningGraph(DomainProblemAdapter adapter, Set<? extends Norm> norms) {
		super(adapter);
		this.returnNormCompliantPlans = true;
		this.norms = norms;
	}

	@Override
	public boolean hasLevelledOff() {
		boolean hasLevelledOff = super.hasLevelledOff();
		if(!hasLevelledOff && !returnNormCompliantPlans) {
			if(getCurrentLevel() > 200) {
				Logger.debug("Could not find a solution - Reached maximum level 200");
				hasLevelledOff = true;
			}
		}
		return hasLevelledOff;
	}

	public void setReturnNormCompliantPlans(boolean returnNormCompliantPlans) {
		this.returnNormCompliantPlans = returnNormCompliantPlans;
	}

	private boolean isViolation(Set<Action> possibleActions, Collection<Fact> subgoalsFactSet) {
		for(Norm norm : norms) {
			if(norm instanceof ConditionalNorm) {
				ConditionalNorm conditionalNorm = (ConditionalNorm) norm;
				for (Action possibleAction : possibleActions) {
					if (conditionalNorm.isPossibleViolationAction(possibleAction)) {
						if (conditionalNorm.isPossibleViolationState(subgoalsFactSet)) {
							return true;
						}
					}
				}
			} else if(norm instanceof LtlNorm) {
				// TODO: implement
				throw new NotImplementedException();
			} else {
				throw new IllegalStateException("Only supported ConditionalNorms or LtlNorms: " + norm);
			}
		}
		return false;
	}

	private boolean isViolation(Action possibleAction, Set<Action> actionSet) {
		for(Norm norm : norms) {
			if(norm instanceof ConditionalNorm) {
				ConditionalNorm conditionalNorm = (ConditionalNorm) norm;
				if (conditionalNorm.isPossibleViolationAction(possibleAction)) {
					Set<Fact> newSubgoalFactsSet = new HashSet<>();
					for (Action action : actionSet) {
						newSubgoalFactsSet.addAll(action.getPreconditions());
					}

					if (conditionalNorm.isPossibleViolationState(newSubgoalFactsSet)) {
						return true;
					}
				}
			} else if(norm instanceof LtlNorm) {
				// TODO: implement
				throw new NotImplementedException();
			} else {
				throw new IllegalStateException("Only supported ConditionalNorms or LtlNorms: " + norm);
			}
		}
		return false;
	}

	@Nullable
	List<List<Set<Action>>> extractSolution(int level, Set<Action> actionSet, Set<Action> mutexSet, List<Fact> subgoalFacts, boolean foundAllSolutions) {
		return extractSolution(level, actionSet, mutexSet, subgoalFacts, foundAllSolutions, false);
	}

	private List<List<Set<Action>>> extractSolution(int level, Set<Action> actionSet, Set<Action> mutexSet, List<Fact> subgoalFacts, boolean foundAllSolutions, boolean isViolationPlan) {
		if (level == 0) {
			if(!returnNormCompliantPlans && !isViolationPlan) {
				// This plan does not violate a norm
				return null;
			}

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
				boolean isViolation = isViolation(actionSet, newSubgoalFacts);

				//noinspection SimplifiableBooleanExpression
				if((returnNormCompliantPlans && !isViolation) || !returnNormCompliantPlans) {
					// Try to find a solution, in the previous level, for these new subgoals
//				    sortFacts(foundAllSolutions, level, newSubgoalFacts);
					boolean newViolation = isViolation | isViolationPlan;
					List<List<Set<Action>>> listsFromPreviousLevel = extractSolution(level - 1, new HashSet<>(), new HashSet<>(), newSubgoalFacts, foundAllSolutions, newViolation);

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
						addNoGoods(previousStateLevel, newSubgoalFacts);
					}
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

					boolean isViolation = isViolation(possibleAction, newActionSet);

					//noinspection SimplifiableBooleanExpression
					if((returnNormCompliantPlans && !isViolation) || !returnNormCompliantPlans) {
						Set<Action> newMutexSet = new HashSet<>(mutexSet);
						newMutexSet.addAll(previousActionLevel.getMutex(possibleAction));

						// Get new subgoals based on the effects that this action achieves (or deletes) - a single action can achieve more than one subgoal!
						List<Fact> newSubgoalSet = getNewSubGoals(possibleAction, subgoalFacts);

						if (needToBackUp(level, newSubgoalSet, newMutexSet)) {
							// There is no way to extract a solution with this selected action
							continue;
						}

						boolean newViolation = isViolation | isViolationPlan;

						// Call recursively extract solutions, with the smaller new subgoals, and the new action set
						List<List<Set<Action>>> tempSolutions = extractSolution(level, newActionSet, newMutexSet, newSubgoalSet, foundAllSolutions, newViolation);
						if (tempSolutions != null) {
							solutions.addAll(tempSolutions);

							if (!foundAllSolutions) {
								return solutions;
							}
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
}
