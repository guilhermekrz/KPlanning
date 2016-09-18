package kplanning.reachableStates;

import graphplan.graph.planning.PlanningGraph;
import javaff.data.Fact;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * This strategy takes a look into the levelled planning graph of JavaGP - Graphplan, to assert if a given possible state is mutex free.
 * If it is, then it is a reachable state.
 * This method gives some false positives, mainly states where all predicates are false (not).
 */
public class JavagpReachableStatesStrategy implements GetReachableStatesStrategy {

	@Override
	public Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter) {
		PlanningGraph levelledPlanningGraph = adapter.getGraphplanAdapter().getGraphplan().getLevelledPlanningGraph();
		Set<STRIPSState> allPossibleStates = adapter.getJavaffParser().getAllPossibleStates();
		Set<STRIPSState> reachableStates = new HashSet<>();
		for(STRIPSState state : allPossibleStates) {
			if(isReachable(adapter, state, levelledPlanningGraph)) {
				reachableStates.add(state);
			}
		}
		return reachableStates;
	}

	private boolean isReachable(DomainProblemAdapter adapter, STRIPSState state, PlanningGraph levelledPlanningGraph) {
		List<graphplan.domain.Proposition> propositions = new ArrayList<>();
		for(Fact fact : state.getFacts()) {
			propositions.add(adapter.getGraphplanJavaffConverter().getProposition(fact));
		}
		return levelledPlanningGraph.goalsPossible(propositions, levelledPlanningGraph.getLastGraphLevel().getIndex());
	}
}
