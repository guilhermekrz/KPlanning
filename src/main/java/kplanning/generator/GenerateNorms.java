package kplanning.generator;

import kplanning.DomainProblemAdapter;
import kplanning.norm.GroundConditionalNorm;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class GenerateNorms {
	private static boolean INCREMENT_NORMS = false;

	private DomainProblemAdapter adapter;
	private String normsDir;
	private int maxNumberOfGeneratedNorms;

	public GenerateNorms(String domain, String problem, String normsFile, String normsDir, int maxNumberOfGeneratedNorms) {
		this.maxNumberOfGeneratedNorms = maxNumberOfGeneratedNorms;
		adapter = DomainProblemAdapter.newInstance(domain, problem, normsFile);
		this.normsDir = normsDir;
		File normsDirFile = new File(this.normsDir);
		//noinspection ResultOfMethodCallIgnored
		normsDirFile.mkdirs();
	}

	public int getNumOfGeneratedNorms() {
		int size = adapter.getNormAdapter().getGroundConditionalNorms().size();
		return (size < maxNumberOfGeneratedNorms)? size : maxNumberOfGeneratedNorms;
	}

	public void generateNormsAndWriteToFiles() {
		List<GroundConditionalNorm> normList = new ArrayList<>(adapter.getNormAdapter().getGroundConditionalNorms());
		if(INCREMENT_NORMS) {
			// If INCREMENT_NORMS, only shuffle once
			Collections.shuffle(normList);
		}

		for(int i = 1; i <= getNumOfGeneratedNorms(); i++) {
			Random random = new Random();

			List<String> lines = new ArrayList<>();
			Path file = Paths.get(normsDir + "norms" + i);

			if(!INCREMENT_NORMS) {
				// If not INCREMENT_NORMS, shuffle list every iteration
				Collections.shuffle(normList);
			}

			for(int j=0;j<i;j++) {
				GroundConditionalNorm groundConditionalNorm = normList.get(j);
				lines.add("ground;n" + (j+1) + ";"
						+ groundConditionalNorm.getNormModality() + ";"
						+ groundConditionalNorm.getTrueFacts().toString().replace("[", "").replace("]", "") + ";"
						+ groundConditionalNorm.getAction() + ";"
						+ (int) ((random.nextDouble() + 0.2) * groundConditionalNorm.getCost())
				);
			}

			try {
				Files.write(file, lines, Charset.forName("UTF-8"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
