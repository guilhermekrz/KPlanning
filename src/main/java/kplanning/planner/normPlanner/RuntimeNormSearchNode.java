package kplanning.planner.normPlanner;

import fr.uga.pddl4j.parser.Connective;
import javaff.data.Action;
import javaff.planning.STRIPSState;
import kplanning.norm.LtlNorm;
import kplanning.norm.Norm;

import java.util.List;
import java.util.Set;

class RuntimeNormSearchNode extends NormSearchNode {

	private boolean violationUpdated, isAbsoluteViolation, isCurrentlyViolation;

	RuntimeNormSearchNode(STRIPSState state, Set<? extends Norm> norms) {
		this(null, null, state, norms);
	}

	RuntimeNormSearchNode(NormSearchNode previousNode, Action previousAction, STRIPSState state, Set<? extends Norm> norms) {
		super(previousNode, previousAction, state, norms);
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
			List<Action> actions = getActions();
			isAbsoluteViolation = false;
			isCurrentlyViolation = false;
			for(Norm norm : norms) {
				if(norm.isViolationPlan(states, actions)) {
					if(norm instanceof LtlNorm) {
						LtlNorm ltlNorm = (LtlNorm) norm;
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
					} else {
						isCurrentlyViolation = true;
						isAbsoluteViolation = true;
					}
				}
			}
			violationUpdated = true;
		}
	}
}
