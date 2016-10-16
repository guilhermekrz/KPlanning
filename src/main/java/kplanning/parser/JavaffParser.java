package kplanning.parser;

import javaff.data.*;
import javaff.data.strips.*;
import javaff.parser.PDDLParser;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import kplanning.exception.NotFoundActionException;
import kplanning.exception.NotFoundPredicateSymbolException;
import kplanning.reachableStates.ActionsReachableStatesStrategy;
import kplanning.reachableStates.GetReachableStatesStrategy;
import kplanning.util.DomainProblem;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class JavaffParser {

	private DomainProblemAdapter domainProblem;
	private UngroundProblem ungroundProblem;
	private GroundProblem groundProblem;

	/**
	 * Constructors
	 */

	public static JavaffParser newInstance21(DomainProblemAdapter domainProblemAdapter, DomainProblem domainProblem) {
		return new JavaffParser(domainProblemAdapter, 21, domainProblem);
	}

	public static JavaffParser newInstance30(DomainProblemAdapter domainProblemAdapter, DomainProblem domainProblem) {
		return new JavaffParser(domainProblemAdapter, 30, domainProblem);
	}

	private JavaffParser(DomainProblemAdapter domainProblemAdapter, int version, DomainProblem domainProblem) {
		this.domainProblem = domainProblemAdapter;
		if(version == 21) {
			ungroundProblem = PDDLParser.getUngroundDomainProblem21(domainProblem.getDomain(), domainProblem.getProblem());
			groundProblem = ungroundProblem.ground();
		} else if(version == 30) {
			ungroundProblem = PDDLParser.getUngroundDomainProblem30(domainProblem.getDomain(), domainProblem.getProblem());
			groundProblem = ungroundProblem.ground();
		} else {
			throw new IllegalStateException("Only PDDL version 2.1 or 3.0 supported in JavaffParser");
		}
	}

	/**
	 * Getters
	 */

	public UngroundProblem getUngroundProblem() {
		return ungroundProblem;
	}

	public GroundProblem getGroundProblem() {
		return groundProblem;
	}

	public Set<Proposition> getGroundedPropositions() {
		return groundProblem.getGroundedPropositions();
	}

	/**
	 * Miscellaneous
	 */

	/**
	 * Miscellaneous - Propositions
	 */

	public Proposition getBaseGroundProposition(Fact fact) {
		if(fact instanceof Proposition) {
			return (Proposition) fact;
		} else if(fact instanceof Not) {
			return  (Proposition) ((Not) fact).getLiteral();
		} else {
			throw new IllegalStateException("Fact should be either a Proposition or a Not. Found: " + fact.getClass());
		}
	}

	public boolean isGroundFactTrue(Fact fact) {
		if(fact instanceof Proposition) {
			return true;
		} else if(fact instanceof Not) {
			return false;
		} else {
			throw new IllegalStateException("Fact should be either a Proposition or a Not. Found: " + fact.getClass());
		}
	}

	@SuppressWarnings("unchecked")
	public Set<Fact> getGroundedFacts() {
		return (Set<Fact>) (Set<?>) groundProblem.getGroundedPropositions();
	}

	/**
	 * Returns fact from string.
	 * String format: ([not] predicate terms)
	 */
	public Fact getFact(String factString) {
		List<String> strings = Arrays.asList(factString.replace('(', ' ').replace(')', ' ').trim().split(" "));
		if(strings.get(0).equals("not")) {
			List<String> strings2 = new ArrayList<>();
			for(int i=1;i<strings.size();i++) {
				if(!strings.get(i).trim().isEmpty()) {
					strings2.add(strings.get(i));
				}
			}
			return new Not(getProposition(strings2));
		} else {
			return getProposition(strings);
		}
	}

	public Proposition getProposition(List<String> propositionList) {
		for(Proposition proposition1:this.groundProblem.getGroundedPropositions()) {
			if(propositionList.size() == proposition1.getParameters().size() + 1) {
				if (propositionList.get(0).equals(proposition1.getPredicateSymbol().getName())) {
					boolean equal = true;
					for(int i = 0;i<proposition1.getParameters().size();i++) {
						if(!proposition1.getParameters().get(i).getName().equals(propositionList.get(i + 1))) {
							equal = false;
							break;
						}
					}
					if(equal) {
						return proposition1;
					}
				}
			}
		}
		throw new RuntimeException("Not found proposition: " + propositionList);
	}

	public Set<CompoundLiteral> getGroundedCompoundLiteral(CompoundLiteral compoundLiteral) {
		Set<Proposition> groundedPropositions = this.groundProblem.getGroundedPropositions();
		Set<CompoundLiteral> compoundLiterals = new HashSet<>();
		Set<Fact> compoundFacts = compoundLiteral.getCompoundFacts();
		for(Fact fact : compoundFacts) {
			Set<CompoundLiteral> temp = new HashSet<>();

			Predicate predicate;
			boolean isNot;
			if(fact instanceof Predicate) {
				predicate = (Predicate) fact;
				isNot = false;
			} else if(fact instanceof Not) {
				predicate = (Predicate) ((Not) fact).getLiteral();
				isNot = true;
			} else {
				throw new RuntimeException("Expecting Facts to be either Predicates or Not, found: " + fact.getClass());
			}

			for (Proposition proposition : groundedPropositions) {
				Fact factToAdd;
				if(isNot) {
					factToAdd = new Not(proposition);
				} else {
					factToAdd = proposition;
				}
				if (proposition.getPredicateSymbol().equals(predicate.getPredicateSymbol())) {
					if (compoundLiterals.isEmpty()) {
						CompoundLiteral c = new And(factToAdd);
						temp.add(c);
					} else {
						for (CompoundLiteral c : compoundLiterals) {
							CompoundLiteral c2 = (CompoundLiteral) c.clone();
							c2.add(factToAdd);
							temp.add(c2);
						}
					}
				}
			}
			compoundLiterals = temp;
		}
		return compoundLiterals;
	}

	public PredicateSymbol getPredicateSymbol(String predicate) {
		for(PredicateSymbol predicateSymbol : this.ungroundProblem.predSymbols) {
			if(predicateSymbol.getName().equals(predicate)) {
				return predicateSymbol;
			}
		}
		throw new NotFoundPredicateSymbolException("Not found predicate symbol: " + predicate);
	}

	/**
	 * Miscellaneous - States
	 */

	public STRIPSState getCompleteInitState() {
		return addMissingFluentFactsToStripsState(this.groundProblem.getSTRIPSInitialState());
	}

	public STRIPSState getStripsState(String state) {
		Set<Fact> trueFacts = new HashSet<>();
		Set<Not> falseFacts = new HashSet<>();

		List<String> strings = Arrays.asList(state.trim().split(","));
		for(String s:strings) {
			List<String> strings1 = Arrays.asList(s.trim().split(" "));

			if(strings1.get(0).trim().isEmpty()) {
				// Empty
				continue;
			}

			if(strings1.get(0).equals("not")) {
				List<String> strings2 = new ArrayList<>();
				for(int i=1;i<strings1.size();i++) {
					strings2.add(strings1.get(i));
				}
				falseFacts.add(new Not(getProposition(strings2)));
			} else {
				trueFacts.add(getProposition(strings1));
			}
		}
		STRIPSState stripsState = new STRIPSState(groundProblem.getActions(), trueFacts, falseFacts, groundProblem.getGoal());
		return addMissingFluentFactsToStripsState(stripsState);
	}

	public STRIPSState getRandomState() {
		Set<Fact> trueFacts = new HashSet<>();
		Set<Not> falseFacts = new HashSet<>();
		Random random = new Random();
		for(Proposition proposition : getGroundedPropositions()) {
			int r = random.nextInt(2) + 1; // r can only be 1 or 2;
			if(r == 1) {
				trueFacts.add(proposition);
			} else {
				falseFacts.add(new Not(proposition));
			}
		}
		return new STRIPSState(groundProblem.getActions(), trueFacts, falseFacts, groundProblem.getGoal());
	}

	public Set<STRIPSState> getAllReachableStates() {
		return new ActionsReachableStatesStrategy().getReachableStates(domainProblem);
	}

	public Set<STRIPSState> getAllReachableStates(GetReachableStatesStrategy strategy) {
		return strategy.getReachableStates(domainProblem);
	}

	public Set<STRIPSState> getAllPossibleStates() {
		Set<Set<Literal>> allPossibleStates = new HashSet<>();
		for(Proposition proposition : getGroundedPropositions()) {
			Set<Set<Literal>> temp = new HashSet<>();

			if(allPossibleStates.isEmpty()) {
				Set<Literal> s1 = new HashSet<>();
				s1.add(proposition);
				temp.add(s1);

				Set<Literal> s2 = new HashSet<>();
				s2.add(new Not(proposition));
				temp.add(s2);
			} else {
				for (Set<Literal> state : allPossibleStates) {
					Set<Literal> s1 = new HashSet<>();
					s1.addAll(state);
					s1.add(proposition);
					temp.add(s1);

					Set<Literal> s2 = new HashSet<>();
					s2.addAll(state);
					s2.add(new Not(proposition));
					temp.add(s2);
				}
			}
			allPossibleStates = temp;
		}
		Set<STRIPSState> allPossibleStripsStates = new HashSet<>();
		for(Set<Literal> set:allPossibleStates) {
			Set<Fact> trueFacts = new HashSet<>();
			Set<Not> falseFacts = new HashSet<>();

			for(Literal literal : set) {
				if(literal instanceof Not){
					falseFacts.add((Not)literal);
				} else if(literal instanceof Proposition) {
					trueFacts.add(literal);
				} else {
					throw new RuntimeException("Literal must be a Not or a Proposition literal, found: " + literal.getClass());
				}
			}

			STRIPSState state = new STRIPSState(groundProblem.getActions(), trueFacts, falseFacts, groundProblem.getGoal());
			allPossibleStripsStates.add(state);
		}
		return allPossibleStripsStates;
	}

	/**
	 * Miscellaneous - Actions
	 */

	@Nullable
	public Action getAction(String action) {
		List<String> a1 = Arrays.asList(action.trim().split(" "));
		String name = a1.get(0);
		for(Action a:this.groundProblem.getActions()) {
			if(a.getName().toString().equals(name)) {
				if(a.getParameters().size() == a1.size() - 1) {
					boolean isEqual = true;
					for(int i=0;i<a.getParameters().size();i++) {
						Parameter p = a.getParameters().get(i);
						String expP = a1.get(i+1);
						if(!p.getName().equals(expP)) {
							isEqual = false;
							break;
						}
					}
					if(isEqual) {
						return a;
					}
				}
			}
		}
		throw new NotFoundActionException("Not found action: " + action);
	}

	public UngroundInstantAction getUngroundAction(String name) {
		for(Operator tempOp:this.ungroundProblem.actions) {
			if(tempOp.name.toString().equals(name)) {
				return (UngroundInstantAction)tempOp;
			}
		}
		throw new NotFoundActionException("Not found unground action (operator): " + name);
	}

	public Set<Action> getGroundActions(UngroundInstantAction ungroundAction) {
		Set<Action> actions = new HashSet<>();
		for(Action action:this.groundProblem.getActions()) {
			if(action.getName().equals(ungroundAction.name)) {
				actions.add(action);
			}
		}
		return actions;
//		return ungroundAction.ground(this.ungroundProblem); This leaves static facts as preconditions
	}

	/**
	 * Utility methods
	 */

	public STRIPSState addMissingFluentFactsToStripsState(STRIPSState stripsState) {
		STRIPSState newStripsState = (STRIPSState) stripsState.clone();
		for(Proposition proposition : this.groundProblem.getGroundedPropositions()) {
			if(!newStripsState.isTrue(proposition) && !newStripsState.isTrue(new Not(proposition))) {
				newStripsState.addFact(new Not(proposition));
			}
		}
		return newStripsState;
	}
}
