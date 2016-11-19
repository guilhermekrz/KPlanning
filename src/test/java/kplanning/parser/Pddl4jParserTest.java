package kplanning.parser;

import fr.uga.pddl4j.parser.Parser;
import kplanning.DomainProblemAdapter;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Pddl4jParserTest {

	@Test
	public void parseDrinkAndDrive() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		Parser parser = adapter.getPddl4jParser().getParser();
		assertEquals(0, parser.getDomain().getConstants().size());
		assertEquals(5, parser.getDomain().getOperators().size());
		assertEquals(5, parser.getDomain().getPredicates().size());
		assertEquals(3, parser.getProblem().getObjects().size());
		assertEquals(4, parser.getProblem().getInit().size());
		assertEquals(2, parser.getProblem().getGoal().getChildren().size());
	}

	@Test
	public void parseDrinkAndDriveConstraints() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 11));
		Parser parser = adapter.getPddl4jParser().getParser();
		assertEquals(0, parser.getDomain().getConstants().size());
		assertEquals(5, parser.getDomain().getOperators().size());
		assertEquals(5, parser.getDomain().getPredicates().size());
		assertEquals(3, parser.getProblem().getObjects().size());
		assertEquals(4, parser.getProblem().getInit().size());
		assertEquals(1, parser.getProblem().getGoal().getChildren().size());
		assertEquals(1, parser.getProblem().getConstraints().getChildren().size());
	}

	@Test
	public void parseAllConstraints30() throws Exception {
		DomainProblemAdapter adapter = DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 21));
		Parser parser = adapter.getPddl4jParser().getParser();
		assertEquals(7, parser.getProblem().getConstraints().getChildren().size());
	}
}