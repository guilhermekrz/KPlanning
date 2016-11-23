package kplanning.util.statistic;

import org.apache.commons.math3.stat.descriptive.DescriptiveStatistics;

import java.util.ArrayList;
import java.util.List;

public class StatisticStatistic extends Statistic {

	List<Double> data;
	DescriptiveStatistics da;

	public StatisticStatistic(String description) {
		super(description, 0);
		data = new ArrayList<>();
	}

	public void addData(double d) {
		data.add(d);
		da = null;
	}

	public DescriptiveStatistics getDa() {
		if(da == null) {
			double[] dataPrimitive = new double[data.size()];
			for (int i=0; i < dataPrimitive.length; i++)  {
				dataPrimitive[i] = data.get(i);
			}

			da = new DescriptiveStatistics(dataPrimitive);
		}
		return da;
	}
}
