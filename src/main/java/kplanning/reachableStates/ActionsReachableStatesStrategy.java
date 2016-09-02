package kplanning.reachableStates;

import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.HashSet;
import java.util.Set;

/**
 * This strategy generates all reachable states, starting from the initial state and applying available actions.
 * Empirically this seems to be the fastest strategy we have implemented.
 */
public class ActionsReachableStatesStrategy implements GetReachableStatesStrategy {
	@Override
	public Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter) {
		Set<STRIPSState> reachableStates = new HashSet<>();
		reachableStates.add(adapter.getJavaffParser().getCompleteInitState());
		Set<Action> actions = adapter.getJavaffParser().getGroundProblem().getActions();
		while(true) {
			Set<STRIPSState> temp = new HashSet<>();
			for(STRIPSState stripsState : reachableStates) {
				for(Action action : actions) {
					if(action.isApplicable(stripsState)) {
						temp.add((STRIPSState) stripsState.apply(action));
					}
				}
			}
			if(!reachableStates.addAll(temp)) {
				// If we did not found a new state, we have already stabilized
				break;
			}
		}
		return reachableStates;
	}
}
