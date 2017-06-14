package kplanning.parser;

import javaff.data.GroundProblem;
import javaff.data.UngroundProblem;
import javaff.data.strips.And;
import kplanning.DomainProblemAdapter;
import kplanning.norm.OrCompoundLiteral;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import java.util.Set;

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
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		UngroundProblem ungroundProblem = adapter.getJavaffParser().getUngroundProblem();
		assertEquals(0, ungroundProblem.constants.size());
		assertEquals(5, ungroundProblem.actions.size());
		assertEquals(5, ungroundProblem.predSymbols.size());
		assertEquals(3, ungroundProblem.objects.size());
		assertEquals(1, ungroundProblem.initial.size());
		assertEquals(1, ((And) ungroundProblem.goal).size());
		assertEquals(1, ((And) ungroundProblem.constraints).size());
	}

	@Test
	public void parseGroundProblem30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		GroundProblem groundProblem = adapter.getJavaffParser().getGroundProblem();
		assertEquals(7, groundProblem.getActions().size());
		assertEquals(4, groundProblem.getGroundedPropositions().size());
		assertEquals(1, ((And) groundProblem.getGoal()).size());
		assertEquals(1, groundProblem.getInitial().size());
		assertEquals(1, ((And) groundProblem.getConstraints()).size());
	}

	@Test
	public void parseAllConstraints30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 21));
		GroundProblem groundProblem = adapter.getJavaffParser().getGroundProblem();
		assertEquals(7, ((And) groundProblem.getConstraints()).size());
	}

	@Test
	public void getCompoundLiteralTest() throws Exception {
		JavaffParser parser = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), 21).getJavaffParser();
		assertEquals(parser.getOrCompoundLiteral("at a", true).toString(), "(and (at a) )");
		assertEquals(parser.getOrCompoundLiteral("at a AND at b", true).toString(), "(and (at b)  (at a) )");
		assertEquals(parser.getOrCompoundLiteral("at a OR at b OR drunk", true).toString(), "(and (at a) ) OR (and (at b) ) OR (and (drunk) )");
		assertEquals(parser.getOrCompoundLiteral("at a AND at b OR drunk", true).toString(), "(and (at b)  (at a) ) OR (and (drunk) )");
	}

	@Test
	public void groundOrCompoundLiteralTest() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1), 21);
		JavaffParser parser = adapter.getJavaffParser();

		OrCompoundLiteral at = parser.getOrCompoundLiteral("at", false);
		Set<OrCompoundLiteral> groundAt = at.ground(adapter);
		assertEquals(2, groundAt.size());

		OrCompoundLiteral at2 = parser.getOrCompoundLiteral("at AND at", false);
		Set<OrCompoundLiteral> groundAt2 = at2.ground(adapter);
		assertEquals(3, groundAt2.size());

		OrCompoundLiteral atOr = parser.getOrCompoundLiteral("at OR at OR drunk", false);
		Set<OrCompoundLiteral> groundAtOr = atOr.ground(adapter);
		assertEquals(2, groundAtOr.size()); // This is expected behavior, as at and at predicates are equals

		OrCompoundLiteral atOr2 = parser.getOrCompoundLiteral("at AND at OR at OR drunk", false);
		Set<OrCompoundLiteral> groundAtOr2 = atOr2.ground(adapter);
		assertEquals(6, groundAtOr2.size());
	}

}