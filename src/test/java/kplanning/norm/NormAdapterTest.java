package kplanning.norm;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class NormAdapterTest {
	private DomainProblemAdapter adapter;

	@Before
	public void setUp() throws Exception {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), "planning-examples/drinkanddrive/pb1.conditionalNorms");
	}

	@Test
	public void testGetConditionalNorms() {
		assertEquals(1, adapter.getNormAdapter().getConditionalNorms().size());
		assertEquals(2, adapter.getNormAdapter().getGroundConditionalNorms().size());
	}

}