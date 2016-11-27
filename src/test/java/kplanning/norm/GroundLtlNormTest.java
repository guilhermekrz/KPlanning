package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.strips.And;
import kplanning.DomainProblemAdapter;
import kplanning.plan.Plan;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class GroundLtlNormTest {

	private DomainProblemAdapter adapter;

	@Before
	public void setUp() throws Exception {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 21));
	}

	// Always

	@Test
	public void testAlways() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");

		And and = new And();
		and.add(adapter.getJavaffParser().getFact("at a"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testAlways", Connective.ALWAYS, -1, and, null);
		assertFalse(groundLtlNorm.isViolationPlan(plan1));
		assertFalse(groundLtlNorm.isViolationPlan(plan2));
		assertTrue(groundLtlNorm.isViolationPlan(plan3));
	}

	// At End

	@Test
	public void testAtEnd() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");

		And and = new And();
		and.add(adapter.getJavaffParser().getFact("at b"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testAtEnd", Connective.AT_END, -1, and, null);
		assertTrue(groundLtlNorm.isViolationPlan(plan1));
		assertTrue(groundLtlNorm.isViolationPlan(plan2));
		assertFalse(groundLtlNorm.isViolationPlan(plan3));
	}

	// Sometime

	@Test
	public void testSometime() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");
		Plan plan4 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara");
		Plan plan5 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b");
		Plan plan6 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b", "move b a");

		And and = new And();
		and.add(adapter.getJavaffParser().getFact("inbar bara"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testSometime", Connective.SOMETIME, -1, and, null);
		assertTrue(groundLtlNorm.isViolationPlan(plan1));
		assertTrue(groundLtlNorm.isViolationPlan(plan2));
		assertTrue(groundLtlNorm.isViolationPlan(plan3));
		assertFalse(groundLtlNorm.isViolationPlan(plan4));
		assertFalse(groundLtlNorm.isViolationPlan(plan5));
		assertFalse(groundLtlNorm.isViolationPlan(plan6));
	}

	// At Most Once

	@Test
	public void testAtMostOnce() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");
		Plan plan4 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara");
		Plan plan5 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b");
		Plan plan6 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b", "move b a");
		Plan plan7 = Plan.newPlanFromStringActions(adapter, "move a b", "move b a");

		And and = new And();
		and.add(adapter.getJavaffParser().getFact("at a"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testAtMostOnce", Connective.AT_MOST_ONCE, -1, and, null);
		assertFalse(groundLtlNorm.isViolationPlan(plan1));
		assertFalse(groundLtlNorm.isViolationPlan(plan2));
		assertFalse(groundLtlNorm.isViolationPlan(plan3));
		assertTrue(groundLtlNorm.isViolationPlan(plan4));
		assertTrue(groundLtlNorm.isViolationPlan(plan5));
		assertTrue(groundLtlNorm.isViolationPlan(plan6));
		assertTrue(groundLtlNorm.isViolationPlan(plan7));
	}

	// Sometime After

	@Test
	public void testSometimeAfter() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");
		Plan plan4 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara");
		Plan plan5 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b");
		Plan plan6 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b", "move b a");
		Plan plan7 = Plan.newPlanFromStringActions(adapter, "move a b", "move b a");

		And o = new And(); o.add(adapter.getJavaffParser().getFact("at b"));
		And v = new And(); v.add(adapter.getJavaffParser().getFact("at a"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testSometimeAfter", Connective.SOMETIME_AFTER, -1, o, v);
		assertFalse(groundLtlNorm.isViolationPlan(plan1));
		assertFalse(groundLtlNorm.isViolationPlan(plan2));
		assertTrue(groundLtlNorm.isViolationPlan(plan3));
		assertFalse(groundLtlNorm.isViolationPlan(plan4));
		assertTrue(groundLtlNorm.isViolationPlan(plan5));
		assertFalse(groundLtlNorm.isViolationPlan(plan6));
		assertFalse(groundLtlNorm.isViolationPlan(plan7));
	}

	// Sometime Before

	@Test
	public void testSometimeBefore() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");
		Plan plan4 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara");
		Plan plan5 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b");
		Plan plan6 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b", "move b a");
		Plan plan7 = Plan.newPlanFromStringActions(adapter, "move a b", "move b a");

		And o = new And(); o.add(adapter.getJavaffParser().getFact("at b"));
		And v = new And(); v.add(adapter.getJavaffParser().getFact("at a")); v.add(adapter.getJavaffParser().getFact("drunk"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testSometimeBefore", Connective.SOMETIME_BEFORE, -1, o, v);
		assertFalse(groundLtlNorm.isViolationPlan(plan1));
		assertFalse(groundLtlNorm.isViolationPlan(plan2));
		assertTrue(groundLtlNorm.isViolationPlan(plan3));
		assertFalse(groundLtlNorm.isViolationPlan(plan4));
		assertFalse(groundLtlNorm.isViolationPlan(plan5));
		assertFalse(groundLtlNorm.isViolationPlan(plan6));
		assertTrue(groundLtlNorm.isViolationPlan(plan7));
	}

	// Always Within

	@Test
	public void testAlwaysWithin() {
		Plan plan1 = Plan.newPlanFromStringActions(adapter, "sleep a");
		Plan plan2 = Plan.newPlanFromStringActions(adapter, "sleep a", "sleep a");
		Plan plan3 = Plan.newPlanFromStringActions(adapter, "sleep a", "move a b");
		Plan plan4 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara");
		Plan plan5 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b");
		Plan plan6 = Plan.newPlanFromStringActions(adapter, "enter a bara", "drink bara", "exit a bara", "move a b", "move b a");
		Plan plan7 = Plan.newPlanFromStringActions(adapter, "move a b", "move b a");
		Plan plan8 = Plan.newPlanFromStringActions(adapter, "move a b");

		And o = new And(); o.add(adapter.getJavaffParser().getFact("at a"));
		And v = new And(); v.add(adapter.getJavaffParser().getFact("at b"));
		GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, NormModality.OBLIGATION, "testAlwaysWithin", Connective.ALWAYS_WITHIN, 2, o, v);
		assertTrue(groundLtlNorm.isViolationPlan(plan1));
		assertTrue(groundLtlNorm.isViolationPlan(plan2));
		assertFalse(groundLtlNorm.isViolationPlan(plan3));
		assertTrue(groundLtlNorm.isViolationPlan(plan4));
		assertTrue(groundLtlNorm.isViolationPlan(plan5));
		assertTrue(groundLtlNorm.isViolationPlan(plan6));
		assertTrue(groundLtlNorm.isViolationPlan(plan7));
		assertFalse(groundLtlNorm.isViolationPlan(plan8));
	}
}