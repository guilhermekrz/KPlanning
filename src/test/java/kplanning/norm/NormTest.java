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

public class NormTest {
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
		Norm simpleNorm = getSimpleNorm1();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara")));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d")));
	}

	@Test
	public void testIsPossibleViolationStateWithSimpleObligationNorm2() {
		Norm simpleNorm = getSimpleNorm2();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a")));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d")));
	}

	@Test
	public void testIsPossibleViolationStateWithComplexProhibitionNorm1() {
		Norm simpleNorm = getComplexNorm1();

		// True
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at a")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at b")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at d, at c")));
		assertTrue(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk, at a, inbar bara")));

		// False
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at b")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at c")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at d, at c")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, at a, inbar bara")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("drunk, inbar bara, not at a")));
		assertFalse(simpleNorm.isPossibleViolationState(adapter.getJavaffParser().getStripsState("not drunk")));
	}

	/**
	 * equals
	 */

	@Test
	public void testEquals() {
		Norm simpleNorm1 = getSimpleNorm1();
		Norm simpleNorm2 = getSimpleNorm2();
		Norm complexNorm1 = getComplexNorm1();
		Norm complexNorm1Alt = getComplexNorm1Alt();

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

	private Norm getSimpleNorm1() {
		Predicate drunk = new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk"));
		CompoundLiteral compoundLiteral = new And(Collections.singleton(drunk));
		return new Norm(adapter, NormModality.PROHIBITION, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private Norm getSimpleNorm2() {
		Predicate drunk = new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk"));
		CompoundLiteral compoundLiteral = new And(Collections.singleton(drunk));
		return new Norm(adapter, NormModality.OBLIGATION, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private Norm getComplexNorm1() {
		Not notDrunk = new Not(new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk")));
		Predicate at = new Predicate(adapter.getJavaffParser().getPredicateSymbol("at"));
		CompoundLiteral compoundLiteral = new And(Arrays.asList(notDrunk, at));
		return new Norm(adapter, NormModality.PROHIBITION, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}

	private Norm getComplexNorm1Alt() {
		Not notDrunk = new Not(new Predicate(adapter.getJavaffParser().getPredicateSymbol("drunk")));
		Predicate at = new Predicate(adapter.getJavaffParser().getPredicateSymbol("at"));
		CompoundLiteral compoundLiteral = new And(Arrays.asList(at, notDrunk));
		return new Norm(adapter, NormModality.PROHIBITION, compoundLiteral, adapter.getJavaffParser().getUngroundAction("move"));
	}
}