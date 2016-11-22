package kplanning.planner.normPlanner;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.LtlNorm;

import java.util.List;
import java.util.Set;

class RuntimeNormSearchNode extends NormSearchNode {

	private boolean violationUpdated, isAbsoluteViolation, isCurrentlyViolation;

	RuntimeNormSearchNode(STRIPSState state, Set<LtlNorm> ltlNorms) {
		this(null, null, state, ltlNorms);
	}

	RuntimeNormSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<LtlNorm> ltlNorms) {
		super(previousNode, previousAction, state, ltlNorms);
	}

	@Override
	public boolean isAbsoluteViolation() {
		checkAndUpdateViolation();
		return isAbsoluteViolation;
	}

	@Override
	public boolean isCurrentlyViolation() {
		checkAndUpdateViolation();
		return isCurrentlyViolation;
	}

	// TODO: add some sort of memoization, using previous search node??
	private void checkAndUpdateViolation() {
		if(!violationUpdated) {
			List<STRIPSState> states = getStates();
			isAbsoluteViolation = false;
			isCurrentlyViolation = false;
			for(LtlNorm ltlNorm : ltlNorms) {
				if(ltlNorm.isViolationPlan(states)) {
					if (ltlNorm.getConnective() == Connective.ALWAYS) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;
						break;
					} else if (ltlNorm.getConnective() == Connective.AT_END) {
						isCurrentlyViolation = true;
					} else if (ltlNorm.getConnective() == Connective.SOMETIME) {
						isCurrentlyViolation = true;
					} else if (ltlNorm.getConnective() == Connective.AT_MOST_ONCE) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;
						break;
					} else if (ltlNorm.getConnective() == Connective.SOMETIME_AFTER) {
						isCurrentlyViolation = true;
					} else if (ltlNorm.getConnective() == Connective.SOMETIME_BEFORE) {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;
						break;
					} else if (ltlNorm.getConnective() == Connective.ALWAYS_WITHIN) {
						isCurrentlyViolation = true;
					}
				}
			}
			violationUpdated = true;
		}
	}
}
