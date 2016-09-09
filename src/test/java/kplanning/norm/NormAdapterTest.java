package kplanning.norm;

import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.Set;

import static org.junit.Assert.assertEquals;

public class NormAdapterTest {
	private DomainProblemAdapter adapter;

	@Before
	public void setUp() throws Exception {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
	}

	@Test
	public void testGetConditionalNorms() {
		Set<ConditionalNorm> conditionalNorms = adapter.getNormAdapter().getConditionalNorms();
		assertEquals(1, conditionalNorms.size());
	}

}