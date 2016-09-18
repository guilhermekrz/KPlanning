package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.planner.GraphplanPlanner;
import kplanning.planner.graphplan.PlanningGraph;

import java.util.HashSet;
import java.util.Set;

/**
 * This strategy takes a look into the levelled planning graph of Graphplan, to assert if a given possible state is mutex free.
 * If it is, then it is a reachable state.
 * This method gives some false positives, mainly states where all predicates are false (not).
 */
public class GraphplanReachableStatesStrategy implements GetReachableStatesStrategy {

	@Override
	public Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter) {
		GraphplanPlanner planner = new GraphplanPlanner(adapter);
		PlanningGraph levelledOffPlanningGraph = planner.getLevelledOffPlanningGraph();
		Set<STRIPSState> allPossibleStates = adapter.getJavaffParser().getAllPossibleStates();
		Set<STRIPSState> reachableStates = new HashSet<>();
		for(STRIPSState state : allPossibleStates) {
			if(isReachable(state, levelledOffPlanningGraph)) {
				reachableStates.add(state);
			}
		}
		return reachableStates;
	}

	private boolean isReachable(STRIPSState state, PlanningGraph levelledOffPlanningGraph) {
		return levelledOffPlanningGraph.isGoalPossible(state.getFacts());
	}
}
