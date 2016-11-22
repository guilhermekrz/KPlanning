package kplanning.planner.normPlanner;

import javaff.data.Action;
import javaff.data.GroundFact;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.norm.Norm;
import kplanning.plan.Plan;
import kplanning.plan.PlanSolution;
import org.jetbrains.annotations.Nullable;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.HashSet;
import java.util.PriorityQueue;
import java.util.Set;

// Solution from the other paper is quite clever, because it uses the already implemented mechanism to perform this...
class ForwardNormPlanner extends NormPlanner {

	private boolean useNormKeeper = false;

	public ForwardNormPlanner(DomainProblemAdapter adapter, boolean useNormKeeper, Set<? extends Norm> norms) {
		super(adapter, norms);
		this.useNormKeeper = useNormKeeper;
	}

	@Override
	public @Nullable PlanSolution planNormCompliant(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, true);
	}

	@Override
	public @Nullable PlanSolution planNormViolation(boolean foundAllSolutions, int levels) {
		return planNormAware(foundAllSolutions, levels, false);
	}

	@Override
	public @Nullable PlanSolution plan(boolean foundAllSolutions, int levels) {
		throw new NotImplementedException();
	}

	private @Nullable PlanSolution planNormAware(boolean foundAllSolutions, int levels, boolean returnNormCompliant) {
		if(foundAllSolutions || levels > 0) {
			// TODO: implement found all solutions to bfs search
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

		if(goalGroundFact.isTrue(completeInitState)) {
			return solution(searchNode);
		}

		PriorityQueue<NormSearchNode> frontier = new PriorityQueue<>((s1, s2) -> Integer.compare(s1.getCurrentCost(), s2.getCurrentCost()));
		frontier.add(searchNode);

		Set<STRIPSState> explored = new HashSet<>();

		while(true) {
			if(frontier.isEmpty()) {
				return null;
			}
			searchNode = frontier.remove();
			explored.add(searchNode.getState());
			for(Action action : actions) {
				if(action.isApplicable(searchNode.getState())) {
					STRIPSState newState = (STRIPSState) searchNode.getState().clone();
					action.apply(newState);

					NormSearchNode childNode;
					if(useNormKeeper) {
						childNode = new NormKeeperSearchNode(searchNode, action, newState, adapter.getNormAdapter().getLtlNorms());
					} else {
						childNode = new RuntimeNormSearchNode(searchNode, action, newState, adapter.getNormAdapter().getLtlNorms());
					}

					if (!frontier.contains(childNode) && !explored.contains(childNode.getState())) {
						// If norm compliant
						//noinspection SimplifiableBooleanExpression
						if(returnNormCompliant) {
							if(!childNode.isAbsoluteViolation()) {
								if (goalGroundFact.isTrue(childNode.getState()) && !childNode.isCurrentlyViolation()) {
									return solution(childNode);
								}
								frontier.add(childNode);
							}
						} else {
							// !returnNormCompliant
							if (goalGroundFact.isTrue(childNode.getState()) && childNode.isCurrentlyViolation()) {
								return solution(childNode);
							}
							frontier.add(childNode);
						}
					}
				}
			}
		}
	}

	private PlanSolution solution(NormSearchNode searchNode) {
		// TODO: return this NormKeeper in Plan Solution!!!
//		System.out.println(searchNode.getNormKeeper());
		return new PlanSolution(adapter, Plan.newPlanFromActions(searchNode.getActions(), adapter));
	}
}
