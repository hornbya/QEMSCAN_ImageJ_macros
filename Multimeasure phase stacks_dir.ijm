parent=getDirectory("Choose grandparent directory");
list=getFileList(parent);

for (i = 0; i < list.length; i++) {
	dirName = list[i];
	dir=parent+dirName;
	sampleName=File.getName(dir);
	savedir=dir +"phases";

	pathT=dir+sampleName+".tif";
	print(pathT);
	pathTC=savedir+File.separator+sampleName+" stack.tif";
	print(pathTC);
	
	if	(File.exists(pathT)){
		open(pathT);
		name=File.nameWithoutExtension;
		orig=getTitle();

		run("8-bit");
		setAutoThreshold("Default");
		run("Threshold...");
		setThreshold(0, 254);
		setOption("BlackBackground", false);
		run("Convert to Mask", "method=Default background=Light");
		run("Close");
		run("Set Scale...", "distance=1 known=1 unit=um");
		run("Clear Results");
		run("Analyze Particles...", "size=10-Infinity add");
		run("Set Measurements...", "area display redirect=None decimal=3");
		roiManager("multi-measure measure_all append");
		close();
	}
	if (File.exists(pathTC)) {
		open(pathTC);
		name=File.nameWithoutExtension;
		stacks=getTitle();
		run("8-bit");
		setAutoThreshold("Default");
		run("Threshold...");
		setThreshold(0, 254);
		setOption("BlackBackground", false);
		run("Convert to Mask", "method=Default background=Light");
		run("Close");
		run("Set Scale...", "distance=1 known=1 unit=um");
		run("Set Measurements...", "area stack limit display redirect=None decimal=3");
		run("From ROI Manager");
		run("Make Binary", "method=Default background=Default");
		
		roiManager("multi-measure measure_all append");
		savepath=savedir+File.separator+sampleName+" results.csv";
		print(savepath);
		saveAs("Results", savepath);
		run("Clear Results");
		close();
		roiManager("delete");
	}
}