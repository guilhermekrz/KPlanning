package kplanning.parser;

import fr.uga.pddl4j.parser.Parser;
import kplanning.util.DomainProblemUtil;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Pddl4jParserTest {

	@Test
	public void parseDrinkAndDrive() throws Exception {
		Parser parser = Pddl4jParser.parse(DomainProblemUtil.getDomainProblem("drinkanddrive", 1));
		assertEquals(0, parser.getDomain().getConstants().size());
		assertEquals(5, parser.getDomain().getOperators().size());
		assertEquals(5, parser.getDomain().getPredicates().size());
		assertEquals(3, parser.getProblem().getObjects().size());
		assertEquals(4, parser.getProblem().getInit().size());
		assertEquals(2, parser.getProblem().getGoal().getChildren().size());
	}

	@Test
	public void parseDrinkAndDriveConstraints() throws Exception {
		Parser parser = Pddl4jParser.parse(DomainProblemUtil.getDomainProblem("drinkanddrive-constraints", 1));
		assertEquals(0, parser.getDomain().getConstants().size());
		assertEquals(5, parser.getDomain().getOperators().size());
		assertEquals(5, parser.getDomain().getPredicates().size());
		assertEquals(3, parser.getProblem().getObjects().size());
		assertEquals(4, parser.getProblem().getInit().size());
		assertEquals(2, parser.getProblem().getGoal().getChildren().size());
		assertEquals(1, parser.getProblem().getConstraints().getChildren().size());
	}

}