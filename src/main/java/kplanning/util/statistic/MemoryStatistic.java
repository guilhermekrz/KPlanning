package kplanning.util.statistic;

// From: https://stackoverflow.com/questions/19785290/java-unit-testing-how-to-measure-memory-footprint-for-method-call
public class MemoryStatistic extends Statistic {
	private Runtime runtime;
	private long usedMemoryBefore, usedMemoryAfter;

	public MemoryStatistic() {
		super(null, -1);
	}

	public void init() {
		runtime = Runtime.getRuntime();
		usedMemoryBefore = runtime.totalMemory() - runtime.freeMemory();
	}

	public void stop() {
		usedMemoryAfter = runtime.totalMemory() - runtime.freeMemory();
	}

	public double getMemoryInMb() {
		return (usedMemoryAfter-usedMemoryBefore) / 1000000;
	}

	@Override
	public String toString() {
		return "Statistic(memory used) - memory (MB): " + getMemoryInMb();
	}
}
