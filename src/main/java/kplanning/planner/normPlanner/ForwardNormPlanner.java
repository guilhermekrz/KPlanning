package kplanning.planner.normPlanner;

import javaff.data.Action;
import javaff.data.GroundFact;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import org.jetbrains.annotations.NotNull;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.HashSet;
import java.util.PriorityQueue;
import java.util.Set;

// TODO: implement a BitSet forward norm planner
public class ForwardNormPlanner extends NormPlanner {

	private boolean useNormKeeper = false;

	public ForwardNormPlanner(DomainProblemAdapter adapter, boolean useNormKeeper, Set<? extends Norm> norms) {
		super(adapter, norms);
		this.useNormKeeper = useNormKeeper;
	}

	@Override
	public @NotNull PlanSolution internalPlan(boolean foundAllSolutions, int levels) {
		throw new NotImplementedException();
	}

	public @NotNull PlanSolution internalPlanNorm(NormPlannerType normPlannerType, boolean foundAllSolutions, int levels) {
		if(foundAllSolutions || levels > 0) {
			// TODO: implement found all solutions
			throw new NotImplementedException();
		}

		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		GroundFact goalGroundFact = adapter.getJavaffParser().getGroundProblem().getGoal();

		STRIPSState completeInitState = adapter.getJavaffParser().getCompleteInitState();
		NormSearchNode searchNode;
		if(useNormKeeper) {
			searchNode = new NormKeeperSearchNode(completeInitState, norms);
		} else {
			searchNode = new RuntimeNormSearchNode(completeInitState, norms);
		}

		PriorityQueue<NormSearchNode> frontier = new PriorityQueue<>((s1, s2) -> Integer.compare(s1.getCurrentCost(), s2.getCurrentCost()));
		frontier.add(searchNode);

		Set<NormSearchNode> explored = new HashSet<>();

		while(true) {
			if(frontier.isEmpty()) {
				return PlanSolution.getNoSolutionPlanSolution(adapter);
			}
			searchNode = frontier.remove();

			// TODO: refactor this. Mainly the way we keep track of norm violations...
			if (goalGroundFact.isTrue(searchNode.getState())) {
				if(normPlannerType.equals(NormPlannerType.NORM_COMPLIANT)) {
					if(!searchNode.isCurrentlyViolation()) {
						// A valid solution must NOT be currently violation
						return solution(searchNode);
					}
				} else if(normPlannerType.equals(NormPlannerType.NORM_VIOLATION)) {
					if(searchNode.isCurrentlyViolation()) {
						// A valid solution MUST be currently violation
						if (searchNode.hasCurrentCostInTotalCost()) {
							// Cost already counts current norm cost
							return solution(searchNode);
						} else {
							// Cost does not count current cost
							searchNode.setCurrentCost(searchNode.getActionCost() + searchNode.getTotalNormCost());
							searchNode.setHasCurrentCostInTotalCost(true);
							frontier.add(searchNode);
							explored.remove(searchNode);
						}
					}
				} else if(normPlannerType.equals(NormPlannerType.NORM_MINIMUM_COST)) {
					if(searchNode.isCurrentlyViolation()) {
						if (searchNode.hasCurrentCostInTotalCost()) {
							// Cost already counts current norm cost
							return solution(searchNode);
						} else {
							// Cost does not count current cost
							searchNode.setCurrentCost(searchNode.getActionCost() + searchNode.getTotalNormCost());
							searchNode.setHasCurrentCostInTotalCost(true);
							frontier.add(searchNode);
							explored.remove(searchNode);
						}
					} else {
						return solution(searchNode);
					}
				} else {
					throw new IllegalStateException("Unrecognized norm type: " + normPlannerType);
				}
			}

			if(explored.contains(searchNode)) {
				// This check is made because we allow nodes already in frontier be added again;
				// we did this in order to allow lower cost search nodes to be added to the priority queue.
				// As we are using a version of a Priority Queue that does not allow removal of arbitrary elements,
				// we cannot follow exactly the algorithm proposed in the paper (with the replace); but this is equivalent.
				continue;
			}

			explored.add(searchNode);

			for(Action action : actions) {
				if(action.isApplicable(searchNode.getState())) {
					STRIPSState newState = (STRIPSState) searchNode.getState().clone();
					action.apply(newState);

					NormSearchNode childNode;
					if(useNormKeeper) {
						childNode = new NormKeeperSearchNode(searchNode, action, newState, adapter.getNormAdapter().getGroundLtlNorms());
					} else {
						childNode = new RuntimeNormSearchNode(searchNode, action, newState, adapter.getNormAdapter().getGroundLtlNorms());
					}

					if (!explored.contains(childNode)) {
						if(normPlannerType.equals(NormPlannerType.NORM_COMPLIANT)) {
							// Discard absolute violation plans
							if(!childNode.isAbsoluteViolation()) {
								// Allow current violation plans to be added to the frontier
								childNode.setCurrentCost(childNode.getActionCost());
								frontier.add(childNode);
							}
						} else if(normPlannerType.equals(NormPlannerType.NORM_VIOLATION) || normPlannerType.equals(NormPlannerType.NORM_MINIMUM_COST)) {
							// Allow all nodes to be added to the frontier
							if(childNode.isAbsoluteViolation()) {
								childNode.setCurrentCost(childNode.getActionCost() + childNode.getAbsoluteNormCost());
							} else {
								childNode.setCurrentCost(childNode.getActionCost());
							}
							frontier.add(childNode);
						} else {
							throw new IllegalStateException("Unrecognized norm type: " + normPlannerType);
						}
					}
				}
			}
		}
	}

	private PlanSolution solution(NormSearchNode searchNode) {
		return new PlanSolution(adapter, Plan.newPlanFromActions(searchNode.getActions(), adapter));
	}
}
