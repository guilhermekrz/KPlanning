package kplanning.norm;

import javaff.data.CompoundLiteral;
import javaff.data.strips.And;
import javaff.data.strips.Not;
import javaff.data.strips.Predicate;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;

import static org.junit.Assert.*;

public class ConditionalNormTest {

	private DomainProblemAdapter adapter;

	@Before
	public void setUp() throws Exception {
		adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 3));
	}

	/**
	 * isPossibleViolationState
	 */

	@Test
	public void testIsPossibleViolationStateWithSimpleProhibitionNorm1() {
		ConditionalNorm simpleNorm = getSimpleNorm1();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a").getFacts()));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d").getFacts()));
	}

	@Test
	public void testIsPossibleViolationStateWithSimpleObligationNorm2() {
		ConditionalNorm simpleNorm = getSimpleNorm2();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a").getFacts()));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d").getFacts()));
	}

	@Test
	public void testIsPossibleViolationStateWithComplexProhibitionNorm1() {
		ConditionalNorm simpleNorm = getComplexNorm1();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at a").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at b").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d, at c").getFacts()));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at a, inbar bara").getFacts()));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a").getFacts()));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk").getFacts()));
	}

	/**
	 * equals
	 */

	@Test
	public void testEquals() {
		ConditionalNorm simpleNorm1 = getSimpleNorm1();
		ConditionalNorm simpleNorm2 = getSimpleNorm2();
		ConditionalNorm complexNorm1 = getComplexNorm1();
		ConditionalNorm complexNorm1Alt = getComplexNorm1Alt();

		assertFalse(simpleNorm1.equals(simpleNorm2));
		assertFalse(simpleNorm1.equals(complexNorm1));
		assertFalse(simpleNorm2.equals(simpleNorm1));
		assertFalse(simpleNorm2.equals(complexNorm1));
		assertFalse(complexNorm1.equals(simpleNorm1));
		assertFalse(complexNorm1.equals(simpleNorm2));
		assertEquals(complexNorm1, complexNorm1Alt);
	}

	/**
	 * Helper methods
	 */

	private ConditionalNorm getSimpleNorm1() {
		Predicate drunk = new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk"));
		CompoundLiteral compoundLiteral = new And(Collections.singleton(drunk));
		return new ConditionalNorm(adapter, "n1", NormModality.PROHIBITION, 1, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private ConditionalNorm getSimpleNorm2() {
		Predicate drunk = new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk"));
		CompoundLiteral compoundLiteral = new And(Collections.singleton(drunk));
		return new ConditionalNorm(adapter, "n1", NormModality.OBLIGATION, 1,compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private ConditionalNorm getComplexNorm1() {
		Not notDrunk = new Not(new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk")));
		Predicate at = new Predicate(adapter.getJavaffParser().getPredicateSymbol("at"));
		CompoundLiteral compoundLiteral = new And(Arrays.asList(notDrunk, at));
		return new ConditionalNorm(adapter, "n1", NormModality.PROHIBITION, 1, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private ConditionalNorm getComplexNorm1Alt() {
		Not notDrunk = new Not(new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk")));
		Predicate at = new Predicate(adapter.getJavaffParser().getPredicateSymbol("at"));
		CompoundLiteral compoundLiteral = new And(Arrays.asList(at, notDrunk));
		return new ConditionalNorm(adapter, "n1", NormModality.PROHIBITION, 1, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}
}