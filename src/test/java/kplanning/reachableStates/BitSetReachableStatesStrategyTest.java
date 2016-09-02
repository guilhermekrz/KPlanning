package kplanning.reachableStates;

import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import java.util.Set;

public class BitSetReachableStatesStrategyTest {

	@Test
	public void getReachableStates1() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		Set<STRIPSState> allReachableStates = adapter.getJavaffParser().getAllReachableStates(new BitSetReachableStatesStrategy());
		StrategyTestUtil.assertReachableStatesOfProblem1(adapter, allReachableStates);
	}

	@Test
	public void getReachableStates3() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 3));
		Set<STRIPSState> allReachableStates = adapter.getJavaffParser().getAllReachableStates(new BitSetReachableStatesStrategy());
		StrategyTestUtil.assertReachableStatesOfProblem3(adapter, allReachableStates);
	}

	@Test
	public void getReachableStates4() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 4));
		Set<STRIPSState> allReachableStates = adapter.getJavaffParser().getAllReachableStates(new BitSetReachableStatesStrategy());
		StrategyTestUtil.assertReachableStatesOfProblem4(adapter, allReachableStates);
	}

}