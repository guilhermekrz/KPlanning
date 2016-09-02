package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.CompoundLiteral;
import kplanning.DomainProblemAdapter;

public class LtlNorm {
	private DomainProblemAdapter adapter;
	private NormModality normModality;

	private String prefName;
	private Connective connective;
	private int t;
	private CompoundLiteral o;
	private CompoundLiteral v;

	public LtlNorm(DomainProblemAdapter adapter, NormModality normModality, String prefName, Connective connective, int t, CompoundLiteral o, CompoundLiteral v) {
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

	@Override
	public String toString() {
		return prefName + "\t(" + connective + " " + ((t != -1)? t + " " : "") + ((o != null)? o :"") + ((v != null)? v : "") + ")";
	}
}
