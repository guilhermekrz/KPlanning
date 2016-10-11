package kplanning.parser;

import javaff.data.GroundProblem;
import javaff.data.UngroundProblem;
import javaff.data.strips.And;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class JavaffParserTest {

	@Test
	public void parseUngroundProblem21() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), 21);
		UngroundProblem ungroundProblem = adapter.getJavaffParser().getUngroundProblem();
		assertEquals(0, ungroundProblem.constants.size());
		assertEquals(5, ungroundProblem.actions.size());
		assertEquals(5, ungroundProblem.predSymbols.size());
		assertEquals(3, ungroundProblem.objects.size());
		assertEquals(1, ungroundProblem.initial.size());
		assertEquals(2, ((And) ungroundProblem.goal).size());
	}

	@Test
	public void parseGroundProblem21() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), 21);
		GroundProblem groundProblem = adapter.getJavaffParser().getGroundProblem();
		assertEquals(7, groundProblem.getActions().size());
		assertEquals(4, groundProblem.getGroundedPropositions().size());
		assertEquals(2, ((And) groundProblem.getGoal()).size());
		assertEquals(1, groundProblem.getInitial().size());
	}

	@Test
	public void parseUngroundProblem30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 1));
		UngroundProblem ungroundProblem = adapter.getJavaffParser().getUngroundProblem();
		assertEquals(0, ungroundProblem.constants.size());
		assertEquals(5, ungroundProblem.actions.size());
		assertEquals(5, ungroundProblem.predSymbols.size());
		assertEquals(3, ungroundProblem.objects.size());
		assertEquals(1, ungroundProblem.initial.size());
		assertEquals(2, ((And) ungroundProblem.goal).size());
		assertEquals(1, ((And) ungroundProblem.constraints).size());
	}

	@Test
	public void parseGroundProblem30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 1));
		GroundProblem groundProblem = adapter.getJavaffParser().getGroundProblem();
		assertEquals(7, groundProblem.getActions().size());
		assertEquals(4, groundProblem.getGroundedPropositions().size());
		assertEquals(2, ((And) groundProblem.getGoal()).size());
		assertEquals(1, groundProblem.getInitial().size());
		assertEquals(1, ((And) groundProblem.getConstraints()).size());
	}

	@Test
	public void parseAllConstraints30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 2));
		GroundProblem groundProblem = adapter.getJavaffParser().getGroundProblem();
		assertEquals(7, ((And) groundProblem.getConstraints()).size());
	}

}