parent=getDirectory("Choose grandparent directory");
list=getFileList(parent);

for (i = 0; i < list.length; i++) {
	dirName = list[i];
	dir=parent+dirName;
	sampleName=File.getName(dir);
	savedir=dir +"phases";

	savepath=savedir+File.separator+sampleName+" results.csv";
	open(savepath);
	r1="phases"+File.separator+sampleName+" results.csv";

	phases=newArray("Bdry glass", "Matrix glass", "Plagioclase", "Pigeonite", "Px microlites", "Orthopyroxene", "Clinopyroxene",  "Olivine", "Fe-Ti oxides", "Quartz", "Unclassified", "Others");

	IJ.renameResults(r1, "Results");	
	//run("Set Measurements...", "display nan redirect=None decimal=3");

	for (j = 0; j < phases.length; j++) {
		phaseT=phases[j];
		//print("phaseT="+phaseT);
		n=nResults;
		for (k = 0; k < n; k++) {
			phase=getResultLabel(k);
			///print("phase="+phase);
			pArea=getResult("Area", k);	
			if (endsWith(phase, phaseT)==true)
				setResult(phaseT, k, pArea);
			else
				continue;
			}
		}
	
	updateResults();
	
	//for (m = 0; m < n; m++) {
		//gl1=getResult("Matrix glass", m);
		//gl2=getResult("Bdry glass", m);
		//ml1=getResult("Px microlites", m);
		//ml2=getResult("Pigeonite", m);
		//tgl=gl1+gl2;
		//tml=ml1+ml2;
		//setResult("Total glass", m, tgl);
		//setResult("Mafic microlites", m, tml);
	//}
	//updateResults();
	savepath2=savedir+File.separator+sampleName+" results2.csv";
	saveAs("Results", savepath2);
	run("Clear Results");
}