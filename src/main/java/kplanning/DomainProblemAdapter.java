package kplanning;

import kplanning.bitset.BitSetAdapter;
import kplanning.norm.NormAdapter;
import kplanning.parser.GraphplanJavaffConverter;
import kplanning.parser.JavaffParser;
import kplanning.parser.Pddl4jParser;
import kplanning.parser.Pddl4jToJavaffConverter;
import kplanning.planner.GraphplanAdapter;
import kplanning.util.DomainProblem;
import kplanning.util.DomainProblemUtil;

public class DomainProblemAdapter {

	private DomainProblem domainProblem;
	private int pddlVersion;

	// Parsers
	private JavaffParser javaffParser;
	private Pddl4jParser pddl4jParser;
	private Pddl4jToJavaffConverter pddl4jToJavaffConverter;
	private GraphplanJavaffConverter graphplanJavaffConverter;

	// Planners
	private GraphplanAdapter graphplanAdapter;

	// Norms
	private NormAdapter normAdapter;

	// Others
	private BitSetAdapter bitSetAdapter;

	/**
	 * Constructors
	 */

	public static DomainProblemAdapter newInstance(String domain, String problem) {
		return DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(domain, problem));
	}

	public static DomainProblemAdapter newInstance(DomainProblem domainProblem) {
		return DomainProblemAdapter.newInstance(domainProblem, 30);
	}

	public static DomainProblemAdapter newInstance(String domain, String problem, int pddlVersion) {
		return DomainProblemAdapter.newInstance(DomainProblemUtil.getDomainProblem(domain, problem), pddlVersion);
	}

	public static DomainProblemAdapter newInstance(DomainProblem domainProblem, int pddlVersion) {
		return new DomainProblemAdapter(domainProblem, pddlVersion);
	}

	private DomainProblemAdapter(DomainProblem domainProblem, int pddlVersion) {
		this.domainProblem = domainProblem;
		this.pddlVersion = pddlVersion;
	}

	/**
	 * Getters
	 */

	public DomainProblem getDomainProblem() {
		return domainProblem;
	}

	public JavaffParser getJavaffParser() {
		if(javaffParser == null) {
			if(pddlVersion == 21) {
				javaffParser = JavaffParser.newInstance21(this, domainProblem);
			} else if(pddlVersion == 30) {
				javaffParser = JavaffParser.newInstance30(this, domainProblem);
			} else {
				throw new IllegalStateException("Only supported PDDL version 2.1 and 3.0");
			}
		}
		return javaffParser;
	}

	public Pddl4jParser getPddl4jParser() {
		if(pddl4jParser == null) {
			pddl4jParser = Pddl4jParser.newInstance(domainProblem);
		}
		return pddl4jParser;
	}

	public Pddl4jToJavaffConverter getPddl4jToJavaffConverter() {
		if(pddl4jToJavaffConverter == null) {
			pddl4jToJavaffConverter = Pddl4jToJavaffConverter.getInstance(this);
		}
		return pddl4jToJavaffConverter;
	}

	public GraphplanJavaffConverter getGraphplanJavaffConverter() {
		if(graphplanJavaffConverter == null) {
			graphplanJavaffConverter = GraphplanJavaffConverter.getInstance(this);
		}
		return graphplanJavaffConverter;
	}

	public GraphplanAdapter getGraphplanAdapter() {
		if(graphplanAdapter == null) {
			graphplanAdapter = GraphplanAdapter.newInstance(this);
		}
		return graphplanAdapter;
	}

	public NormAdapter getNormAdapter() {
		if(normAdapter == null) {
			normAdapter = NormAdapter.newInstance(this);
		}
		return normAdapter;
	}

	public BitSetAdapter getBitSetAdapter() {
		if(bitSetAdapter == null) {
			bitSetAdapter = BitSetAdapter.newInstance(this);
		}
		return bitSetAdapter;
	}
}
