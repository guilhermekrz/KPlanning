package kplanning.parser;

import fr.uga.pddl4j.parser.Parser;
import kplanning.util.DomainProblem;

import java.io.FileNotFoundException;

public class Pddl4jParser {

	public static Parser parse(DomainProblem domainProblem) {
		Parser parser = new Parser();
		try {
			parser.parse(domainProblem.getDomain(), domainProblem.getProblem());
			if(!parser.getErrorManager().isEmpty()) {
				parser.getErrorManager().printAll();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return parser;
	}
}
