package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.bitset.BitSetAction;

import java.util.BitSet;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * This strategy generates all reachable states, starting from the initial state and applying available actions - using BitSets!
 * Empirically this seems to be the fastest strategy we have implemented.
 */
public class BitSetReachableStatesStrategy implements GetReachableStatesStrategy {

	@Override
	public Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter) {
		Set<BitSet> reachableBitSetStates = new HashSet<>();
		reachableBitSetStates.add(adapter.getBitSetAdapter().getCompleteInitState());
		Set<BitSetAction> actions = adapter.getBitSetAdapter().getActions();

		while(true) {
			Set<BitSet> temp = new HashSet<>();
			for(BitSet state : reachableBitSetStates) {
				for(BitSetAction action : actions) {
					if(action.isApplicable(state)) {
						temp.add(action.applyActionToState(state));
					}
				}
			}
			if(!reachableBitSetStates.addAll(temp)) {
				// If we did not found a new state, we have already stabilized
				break;
			}
		}
		return reachableBitSetStates.stream().map(bitSet -> adapter.getBitSetAdapter().getStateFromBitSet(bitSet)).collect(Collectors.toSet());
	}
}
