package kplanning.norm;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.data.CompoundLiteral;
import javaff.planning.STRIPSState;
import kplanning.DomainProblemAdapter;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class LtlNorm extends Norm {
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

	public Set<GroundLtlNorm> ground() {
		Set<GroundLtlNorm> groundLtlNorms = new HashSet<>();
		Set<CompoundLiteral> oo = adapter.getJavaffParser().getGroundedCompoundLiteral(o);
		for(CompoundLiteral ooo : oo) {
			if(v == null) {
				GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, normModality, prefName, connective, t, ooo, null);
				groundLtlNorms.add(groundLtlNorm);
			} else {
				Set<CompoundLiteral> vv = adapter.getJavaffParser().getGroundedCompoundLiteral(v);
				for(CompoundLiteral vvv : vv) {
					GroundLtlNorm groundLtlNorm = new GroundLtlNorm(adapter, normModality, prefName, connective, t, ooo, vvv);
					groundLtlNorms.add(groundLtlNorm);
				}
			}
		}
		return groundLtlNorms;
	}

	@Override
	public boolean isViolationPlan(List<STRIPSState> states, List<Action> actions) {
		throw new NotImplementedException();
	}
}
