package kplanning.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public class SetUtil {

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
}
