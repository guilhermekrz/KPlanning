package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import fr.uga.pddl4j.parser.Exp;
import javaff.data.Action;
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
	private Set<GroundConditionalNorm> groundConditionalNorms;
	private Set<LtlNorm> ltlNorms;
	private Set<GroundLtlNorm> groundLtlNorms;

	/**
	 * Constructors
	 */

	public static NormAdapter newInstance(DomainProblemAdapter adapter) {
		return new NormAdapter(adapter);
	}

	private NormAdapter(DomainProblemAdapter adapter) {
		this.adapter = adapter;
		this.conditionalNorms = new HashSet<>();
		this.groundConditionalNorms = new HashSet<>();
		this.ltlNorms = new HashSet<>();
		this.groundLtlNorms = new HashSet<>();
		populateConditionalNorms();
		populateLtlNorms();
	}

	/**
	 * Conditional Norms
	 */

	public Set<ConditionalNorm> getConditionalNorms() {
		return conditionalNorms;
	}

	public Set<GroundConditionalNorm> getGroundConditionalNorms() {
		return groundConditionalNorms;
	}

	private void populateConditionalNorms() {
		if(adapter.getConditionalNormFile() != null) {
			File file = new File(adapter.getConditionalNormFile());
			if (file.exists()) {
				try (BufferedReader br = new BufferedReader(new FileReader(adapter.getConditionalNormFile()))) {
					String line;
					while ((line = br.readLine()) != null) {
						if(!line.startsWith("//")) {
							String[] split = line.trim().split(";");
							if (split.length > 0) {
								String type = split[0];
								if (type.equals("ground") || type.equals("unground")) {
									String name = split[1];
									String modality = split[2];
									String context = split[3]; // TODO: separate by comma, allow variables and ground
									String action = split[4];
									String cost = split[5];

									NormModality normModality = NormModality.valueOf(modality);
									try {
										int intCost = Integer.valueOf(cost);

										if (type.equals("unground")) {
											CompoundLiteral compoundLiteral = new And(Collections.singleton(new Predicate(adapter.getJavaffParser().getPredicateSymbol(context))));
											ConditionalNorm conditionalNorm = new ConditionalNorm(adapter, name, normModality, intCost, compoundLiteral, adapter.getJavaffParser().getUngroundAction(action));
											conditionalNorms.add(conditionalNorm);
											this.groundConditionalNorms.addAll(conditionalNorm.ground());
										} else {
											CompoundLiteral compoundLiteral = new And(Collections.singleton(adapter.getJavaffParser().getFact(context)));
											Action thisAction = adapter.getJavaffParser().getAction(action);
											GroundConditionalNorm groundConditionalNorm = new GroundConditionalNorm(adapter, name, normModality, compoundLiteral, intCost, thisAction);
											this.groundConditionalNorms.add(groundConditionalNorm);
										}
									} catch (IllegalArgumentException e) {
										System.out.println("NormModality should be either PROHIBITION or OBLIGATION");
									} catch (NotFoundPredicateSymbolException e) {
										System.out.println("Not found specified predicate(s): " + context);
									} catch (NotFoundActionException e) {
										System.out.println("Not found specified action: " + action);
									}
								} else if(type.equals("ltlUnground") || type.equals("ltlGround")) {
									String name = split[1];
									String modality = split[2];
									String connective = split[3];
									String t = split[4];
									String o = split[5]; // TODO: separate by comma, allow variables and ground, and negative! add tests
									NormModality normModality = NormModality.valueOf(modality);
									Connective normConnective = Connective.valueOf(connective);
									CompoundLiteral vCompoundLiteral;

									if(type.equals("ltlUnground")) {
										if (normConnective.equals(Connective.ALWAYS) || normConnective.equals(Connective.SOMETIME) || normConnective.equals(Connective.AT_END) || normConnective.equals(Connective.AT_MOST_ONCE)) {
											vCompoundLiteral = null;
										} else {
											String v = split[6]; // TODO: separate by comma, allow variables and ground, and negative! add tests
											vCompoundLiteral = new And(Collections.singleton(new Predicate(adapter.getJavaffParser().getPredicateSymbol(v))));
										}
										int tInt = Integer.valueOf(t);
										CompoundLiteral oCompoundLiteral = new And(Collections.singleton(new Predicate(adapter.getJavaffParser().getPredicateSymbol(o))));

										LtlNorm ltlNorm = new LtlNorm(adapter, normModality, name, normConnective, tInt, oCompoundLiteral, vCompoundLiteral);
										ltlNorms.add(ltlNorm);
										this.groundLtlNorms.addAll(ltlNorm.ground());
									} else {
										if (normConnective.equals(Connective.ALWAYS) || normConnective.equals(Connective.SOMETIME) || normConnective.equals(Connective.AT_END) || normConnective.equals(Connective.AT_MOST_ONCE)) {
											vCompoundLiteral = null;
										} else {
											String v = split[6]; // TODO: separate by comma, allow variables and ground, and negative! add tests
											vCompoundLiteral = new And(Collections.singleton(adapter.getJavaffParser().getFact(v)));
										}
										int tInt = Integer.valueOf(t);
										CompoundLiteral oCompoundLiteral = new And(Collections.singleton(adapter.getJavaffParser().getFact(o)));

										GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, normModality, name, normConnective, tInt, oCompoundLiteral, vCompoundLiteral);
										this.groundLtlNorms.add(groundLtlNorm);
									}
								}  else {
									System.out.println("Error! Line should start with ground, unground, ltlUnground or ltlGround: " + line);
								}
							}
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * LTL norms
	 */

	public Set<LtlNorm> getLtlNorms() {
		return ltlNorms;
	}

	public Set<GroundLtlNorm> getGroundLtlNorms() {
		return groundLtlNorms;
	}

	private void populateLtlNorms() {
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
				groundLtlNorms.add(new GroundLtlNorm(adapter, NormModality.OBLIGATION, child.getPrefName().getImage(), child.getConnective(), t, o, v));
			}
		}
	}
}
