package kplanning.norm;

import javaff.data.CompoundLiteral;
import kplanning.DomainProblemAdapter;
import kplanning.util.SetUtil;

import java.util.HashSet;
import java.util.Set;

public class OrCompoundLiteral {

	// FND
	private Set<CompoundLiteral> or;

	public OrCompoundLiteral() {
		this.or = new HashSet<>();
	}

	public OrCompoundLiteral(Set<CompoundLiteral> or) {
		this.or = or;
	}

	public void add(CompoundLiteral c) {
		this.or.add(c);
	}

	public Set<CompoundLiteral> getOr() {
		return or;
	}

	/**
	 * Default
	 */

	@Override
	public String toString() {
		StringBuilder s = new StringBuilder();
		boolean addOr = false;
		for(CompoundLiteral compoundLiteral : or) {
			if(addOr) {
				s.append(" OR ");
			} else {
				addOr = true;
			}
			s.append(compoundLiteral);
		}
		return s.toString();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!(obj instanceof OrCompoundLiteral)) return false;

		OrCompoundLiteral literal = (OrCompoundLiteral) obj;
		return literal.or.equals(or);
	}

	@Override
	public int hashCode() {
		int h = 932;
		h = 37 * h + or.hashCode();
		return h;
	}

	public Set<OrCompoundLiteral> ground(DomainProblemAdapter adapter) {
		Set<Set<CompoundLiteral>> s = new HashSet<>();
		for(CompoundLiteral c : or) {
			s.add(adapter.getJavaffParser().getGroundedCompoundLiteral(c));
		}
		Set<OrCompoundLiteral> r = new HashSet<>();

		Set<Set<CompoundLiteral>> cartesianProduct = SetUtil.cartesianProduct(s);
		for(Set<CompoundLiteral> c : cartesianProduct) {
			r.add(new OrCompoundLiteral(c));
		}
		return r;
	}
}
