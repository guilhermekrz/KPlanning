package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.parser.Exp;
import javaff.data.CompoundLiteral;
import javaff.data.strips.And;
import javaff.data.strips.Predicate;
import kplanning.DomainProblemAdapter;
import kplanning.exception.NotFoundActionException;
import kplanning.exception.NotFoundPredicateSymbolException;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NormAdapter {

	private DomainProblemAdapter adapter;
	private Set<ConditionalNorm> conditionalNorms;
	private Set<LtlNorm> ltlNorms;

	/**
	 * Constructors
	 */

	public static NormAdapter newInstance(DomainProblemAdapter adapter) {
		return new NormAdapter(adapter);
	}

	private NormAdapter(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		populateConditionalNorms();
		populateLtlNorms();
	}

	public Set<ConditionalNorm> getConditionalNorms() {
		return conditionalNorms;
	}

	private void populateConditionalNorms() {
		String conditionalNormsFile = adapter.getDomainProblem().getBasePath() + "/conditionalNorms.pddl";
		conditionalNorms = new HashSet<>();
		File file = new File(conditionalNormsFile);
		if(file.exists()) {
			try (BufferedReader br = new BufferedReader(new FileReader(conditionalNormsFile))) {
				String line;
				while ((line = br.readLine()) != null) {
					String[] split = line.trim().split(";");
					if (split.length == 3) {
						String modality = split[0];
						String context = split[1]; // TODO: separate by comma
						String action = split[2];

						try {
							NormModality normModality = NormModality.valueOf(modality);
							CompoundLiteral compoundLiteral = new And(Collections.singleton(new Predicate(adapter.getJavaffParser().getPredicateSymbol(context))));
							conditionalNorms.add(new ConditionalNorm(adapter, normModality, compoundLiteral, adapter.getJavaffParser().getUngroundAction(action)));
						} catch (IllegalArgumentException e) {
							System.out.println("NormModality should be either PROHIBITION or OBLIGATION");
						} catch (NotFoundPredicateSymbolException e) {
							System.out.println("Not found specified predicate(s): " + context);
						} catch (NotFoundActionException e) {
							System.out.println("Not found specified action: " + action);
						}
					} else {
						System.out.println("Error! Each line should have three elements: " + line);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public Set<LtlNorm> getLtlNorms() {
		return ltlNorms;
	}

	private void populateLtlNorms() {
		ltlNorms = new HashSet<>();
		Exp constraints = adapter.getPddl4jParser().getParser().getProblem().getConstraints();
		if(constraints != null && constraints.getConnective().equals(Connective.AND)) {
			List<Exp> children = constraints.getChildren();
			for(Exp child : children) {
				int t = -1;
				CompoundLiteral o;
				CompoundLiteral v = null;
				switch (child.getConnective()) {
					case AT_END:
					case ALWAYS:
					case SOMETIME:
					case AT_MOST_ONCE:
						if(child.getChildren().size() != 1) {
							throw new IllegalStateException("Connective should have only one children: " + child.getConnective());
						}
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(0));
						break;
					case SOMETIME_AFTER:
					case SOMETIME_BEFORE:
						if(child.getChildren().size() != 2) {
							throw new IllegalStateException("Connective should have only two children: " + child.getConnective());
						}
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(0));
						v = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(1));
						break;
					case ALWAYS_WITHIN:
						if(child.getChildren().size() != 3) {
							throw new IllegalStateException("Connective should have three children: " + child.getConnective());
						}
						t = child.getChildren().get(0).getValue().intValue();
						o = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(1));
						v = adapter.getPddl4jToJavaffConverter().getCompoundLiteralFromExp(child.getChildren().get(2));
						break;
					default:
						throw new IllegalStateException("Connective not supported in constraints: " + child.getConnective());
				}
				ltlNorms.add(new LtlNorm(adapter, NormModality.OBLIGATION, child.getPrefName().getImage(), child.getConnective(), t, o, v));
			}
		}
	}
}
