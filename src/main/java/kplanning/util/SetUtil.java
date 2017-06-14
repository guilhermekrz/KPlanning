package kplanning.util;

import java.util.*;

public class SetUtil {

	// Permutation

	public static <T> List<List<T>> permutation(Set<T> nums) {
		return permutation(new ArrayList<>(nums));
	}

	public static <T> List<List<T>> permutation(List<T> nums) {
		List<List<T>> accum = new ArrayList<>();
		permutation(accum, Collections.emptyList(), nums);
		return accum;
	}

	private static <T> void permutation(List<List<T>> accum, List<T> prefix, List<T> nums) {
		int n = nums.size();
		if (n == 0) {
			accum.add(prefix);
		} else {
			for (int i = 0; i < n; ++i) {
				List<T> newPrefix = new ArrayList<>();
				newPrefix.addAll(prefix);
				newPrefix.add(nums.get(i));
				List<T> numsLeft = new ArrayList<>();
				numsLeft.addAll(nums);
				numsLeft.remove(i);
				permutation(accum, newPrefix, numsLeft);
			}
		}
	}

	// Cartesian product

	public static <T> Set<Set<T>> cartesianProduct(Set<Set<T>> sets) {
		Set<Set<T>> resultSets = new HashSet<>();
		if (sets.size() == 0) {
			resultSets.add(new HashSet<>());
			return resultSets;
		} else {
			Set<T> first = sets.iterator().next();

			Set<Set<T>> subset = new HashSet<>(sets);
			subset.remove(first);

			Set<Set<T>> remainingSets = cartesianProduct(subset);
			for (T condition : first) {
				for (Set<T> remainingSet : remainingSets) {
					Set<T> resultSet = new HashSet<>();
					resultSet.add(condition);
					resultSet.addAll(remainingSet);
					resultSets.add(resultSet);
				}
			}
		}
		return resultSets;
	}
}
