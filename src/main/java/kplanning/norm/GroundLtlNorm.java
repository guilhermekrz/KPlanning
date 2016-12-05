package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;

import java.util.List;

public class GroundLtlNorm extends Norm implements GroundNorm {
	private DomainProblemAdapter adapter;
	private NormModality normModality;

	private String prefName;
	private Connective connective;
	private int t;
	private CompoundLiteral o;
	private CompoundLiteral v;

	public GroundLtlNorm(DomainProblemAdapter adapter, NormModality normModality, String prefName, Connective connective, int t, CompoundLiteral o, CompoundLiteral v) {
		this.adapter = adapter;
		this.normModality = normModality;
		if(this.normModality == NormModality.PROHIBITION) {
			throw new IllegalStateException("We are only dealing with OBLIGATION LTL norms... If we want to support PROHIBITION, we need to change method to check if a plan violates a LTL norm");
		}
		this.prefName = prefName;
		this.connective = connective;
		this.t = t;
		this.o = o;
		this.v = v;
	}

	public Connective getConnective() {
		return connective;
	}

	public CompoundLiteral getO() {
		return o;
	}

	public CompoundLiteral getV() {
		return v;
	}

	public int getT() {
		return t;
	}

	public boolean isViolationPlan(List<STRIPSState> states, List<Action> actions) {
		if(connective == Connective.ALWAYS) {
			for (STRIPSState state : states) {
				if (!state.isTrue(o)) {
					return true;
				}
			}
		} else if(connective == Connective.AT_END) {
			if(!states.get(states.size()-1).isTrue(o)) {
				return true;
			}
		} else if(connective == Connective.SOMETIME) {
			boolean occurred = false;
			for (STRIPSState state : states) {
				if (state.isTrue(o)) {
					occurred = true;
					break;
				}
			}
			if(!occurred) {
				return true;
			}
		} else if(connective == Connective.AT_MOST_ONCE) {
			boolean occurred = false;
			boolean alreadyOccurred = false;
			for (STRIPSState state : states) {
				if (state.isTrue(o)) {
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
		} else if(connective == Connective.SOMETIME_AFTER) {
			for (int i=0;i<states.size();i++) {
				STRIPSState state = states.get(i);
				if (state.isTrue(o)) {
					boolean existsAfter = false;
					for (int j=i;j<states.size();j++) {
						STRIPSState stateV = states.get(j);
						if (stateV.isTrue(v)) {
							existsAfter = true;
							break;
						}
					}
					if(!existsAfter) {
						return true;
					}
				}
			}
		} else if(connective == Connective.SOMETIME_BEFORE) {
			for (int i=0;i<states.size();i++) {
				STRIPSState state = states.get(i);
				if (state.isTrue(o)) {
					boolean existsBefore = false;
					for (int j=0;j<i;j++) {
						STRIPSState stateV = states.get(j);
						if (stateV.isTrue(v)) {
							existsBefore = true;
							break;
						}
					}
					if(!existsBefore) {
						return true;
					}
				}
			}
		} else if(connective == Connective.ALWAYS_WITHIN) {
			for (int i=0;i<states.size();i++) {
				STRIPSState state = states.get(i);
				if (state.isTrue(o)) {
					boolean existsAfter = false;
					for (int j=i;j<states.size();j++) {
						if(j-i > t) {
							break;
						}
						STRIPSState stateV = states.get(j);
						if (stateV.isTrue(v)) {
							existsAfter = true;
							break;
						}
					}
					if(!existsAfter) {
						return true;
					}
				}
			}
		} else {
			throw new IllegalStateException("Connective not supported for norms: " + connective);
		}
		return false;
	}

	public boolean isOTrue(STRIPSState stripsState) {
		return stripsState.isTrue(o);
	}

	public boolean isVTrue(STRIPSState stripsState) {
		return stripsState.isTrue(v);
	}

	@Override
	public String toString() {
		return prefName + "\t(" + connective + " " + ((t != -1)? t + " " : "") + ((o != null)? o :"") + ((v != null)? v : "") + ")";
	}

	@Override
	public int getCost() {
		// TODO: implement cost for LTL norms
		return 10;
	}

	@Override
	public String toFile(String name, int cost) {
		return "ltlGround;" + name + ";"
				+ normModality + ";"
				+ connective + ";"
				+ t + ";"
				+ o.getFacts().toString().replace("[", "").replace("]", "") + ";"
				+ ((v != null)? (v.getFacts().toString().replace("[", "").replace("]", "")) : (""));
	}
}
