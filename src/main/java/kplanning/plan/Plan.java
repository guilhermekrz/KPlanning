package kplanning.plan;

import fr.uga.pddl4j.parser.Connective;
import graphplan.domain.Operator;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.LtlNorm;
import kplanning.norm.Norm;
import kplanning.DomainProblemAdapter;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Plan {
	private List<Action> actions;
	private List<STRIPSState> states;

	public Plan(List<Operator> operators, DomainProblemAdapter adapter) {
		actions = new ArrayList<>();
		states = new ArrayList<>();

		STRIPSState currentState = adapter.getJavaffParser().getCompleteInitState();
		states.add(currentState);

		for (Operator op : operators) {
			Action action = adapter.getGraphplanJavaffConverter().getAction(op);
			actions.add(action);
			currentState = getNextState(currentState, action);
			states.add(currentState);
		}
	}

	public List<STRIPSState> getIntermediateStates() {
		return states.subList(0,states.size()-1);
	}

	// Assuming that this action is applicable to current state
	private STRIPSState getNextState(STRIPSState currentState, Action action) {
		return (STRIPSState) currentState.apply(action);
	}

	public boolean violatesSimpleNorms(Set<Norm> norms) {
		for(Norm norm : norms) {
			for(int i=0;i<states.size()-1;i++) {
				if(norm.isViolationState(states.get(i), actions.get(i))) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean violatesLtlNorms(Set<LtlNorm> ltlNorms) {
		for(LtlNorm ltlNorm : ltlNorms) {
			if(ltlNorm.getConnective() == Connective.ALWAYS) {
				for (STRIPSState state : states) {
					if (!state.isTrue(ltlNorm.getO())) {
						return true;
					}
				}
			} else if(ltlNorm.getConnective() == Connective.AT_END) {
				if(!states.get(states.size()-1).isTrue(ltlNorm.getO())) {
					return true;
				}
			} else if(ltlNorm.getConnective() == Connective.SOMETIME) {
				boolean occurred = false;
				for (STRIPSState state : states) {
					if (state.isTrue(ltlNorm.getO())) {
						occurred = true;
						break;
					}
				}
				if(!occurred) {
					return true;
				}
			} else if(ltlNorm.getConnective() == Connective.AT_MOST_ONCE) {
				boolean occurred = false;
				boolean alreadyOccurred = false;
				for (STRIPSState state : states) {
					if (state.isTrue(ltlNorm.getO())) {
						if (alreadyOccurred) {
							return true;
						} else {
							occurred = true;
						}
					} else {
						if (occurred) {
							occurred = false;
							alreadyOccurred = true;
						}
					}
				}
			} else if(ltlNorm.getConnective() == Connective.SOMETIME_AFTER) {
				for (int i=0;i<states.size();i++) {
					STRIPSState state = states.get(i);
					if (state.isTrue(ltlNorm.getO())) {
						boolean existsAfter = false;
						for (int j=i;j<states.size();j++) {
							STRIPSState stateV = states.get(j);
							if (stateV.isTrue(ltlNorm.getV())) {
								existsAfter = true;
								break;
							}
						}
						if(!existsAfter) {
							return true;
						}
					}
				}
			} else if(ltlNorm.getConnective() == Connective.SOMETIME_BEFORE) {
				for (int i=0;i<states.size();i++) {
					STRIPSState state = states.get(i);
					if (state.isTrue(ltlNorm.getO())) {
						boolean existsBefore = false;
						for (int j=0;j<i;j++) {
							STRIPSState stateV = states.get(j);
							if (stateV.isTrue(ltlNorm.getV())) {
								existsBefore = true;
								break;
							}
						}
						if(!existsBefore) {
							return true;
						}
					}
				}
			} else if(ltlNorm.getConnective() == Connective.ALWAYS_WITHIN) {
				for (int i=0;i<states.size();i++) {
					STRIPSState state = states.get(i);
					if (state.isTrue(ltlNorm.getO())) {
						boolean existsAfter = false;
						for (int j=i;j<states.size();j++) {
							if(j-i > ltlNorm.getT()) {
								break;
							}
							STRIPSState stateV = states.get(j);
							if (stateV.isTrue(ltlNorm.getV())) {
								existsAfter = true;
								break;
							}
						}
						if(!existsAfter) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return actions.toString();
	}
}
