package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.Set;

public interface GetReachableStatesStrategy {
	Set<STRIPSState> getReachableStates(DomainProblemAdapter adapter);
}
