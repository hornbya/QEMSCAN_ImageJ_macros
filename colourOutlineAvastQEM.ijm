folder=getDirectory("Choose a Directory")
samplename=File.getName(folder);
path500plus=folder+samplename+" +500.tif";

if	(File.exists(path500plus)){
	open(path500plus);
	original=getTitle();
	run("Duplicate...", " ");
	run("8-bit");
	setAutoThreshold("Default");
	run("Threshold...");
	setThreshold(0, 254);
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Close");
	copy=getTitle();
	run("Fill Holes (Binary/Gray)");
	holes=getTitle();
	run("Morphological Filters", "operation=[Internal Gradient] element=Diamond radius=1");
	bdry=getTitle();
	selectWindow(holes);
	close();
	selectWindow(copy);
	close();

	imageCalculator("AND create", original,bdry);
	colorbdry=getTitle();
	selectWindow(bdry);
	close();
	imageCalculator("Subtract create", original, colorbdry);
	core=getTitle();
	selectWindow(colorbdry);
	path1=path500plus+"-boundary.tif";
	save(path1);
	run("RGB Color");
	run("Color Counter");
	close();
	path2=path500plus+"-core.tif";
	selectWindow(core);
	saveAs(path2);
	run("RGB Color");
	run("Color Counter");
	theText = getInfo("log");
	String.copy(theText);
	waitForUser("Paste it");
	close("*");
	close("log");
	} else {
	continue;
	}

path63500=folder+samplename+" 63-500.tif";

if	(File.exists(path63500)){
	open(path63500);
	original=getTitle();
	run("Duplicate...", " ");
	run("8-bit");
	setAutoThreshold("Default");
	run("Threshold...");
	setThreshold(0, 254);
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Close");
	copy=getTitle();
	run("Fill Holes (Binary/Gray)");
	holes=getTitle();
	run("Morphological Filters", "operation=[Internal Gradient] element=Diamond radius=1");
	bdry=getTitle();
	selectWindow(holes);
	close();
	selectWindow(copy);
	close();

	imageCalculator("AND create", original,bdry);
	colorbdry=getTitle();
	selectWindow(bdry);
	close();
	imageCalculator("Subtract create", original, colorbdry);
	core=getTitle();
	selectWindow(colorbdry);
	path1=path63500+"-boundary.tif";
	save(path1);
	run("RGB Color");
	run("Color Counter");
	close();
	path2=path63500+"-core.tif";
	selectWindow(core);
	saveAs(path2);
	run("RGB Color");
	run("Color Counter");
	theText = getInfo("log");
	String.copy(theText);
	waitForUser("Paste it");
	close("*");
	close("log");
	} else {
	continue;
	}

pathsub63=folder+samplename+" u63.tif";
if	(File.exists(pathsub63)){
	open(pathsub63);
	original=getTitle();
	run("Duplicate...", " ");
	run("8-bit");
	setAutoThreshold("Default");
	run("Threshold...");
	setThreshold(0, 254);
	setOption("BlackBackground", false);
	run("Convert to Mask");
	run("Close");
	copy=getTitle();
	run("Fill Holes (Binary/Gray)");
	holes=getTitle();
	run("Morphological Filters", "operation=[Internal Gradient] element=Diamond radius=1");
	bdry=getTitle();
	selectWindow(holes);
	close();
	selectWindow(copy);
	close();

	imageCalculator("AND create", original,bdry);
	colorbdry=getTitle();
	selectWindow(bdry);
	close();
	imageCalculator("Subtract create", original, colorbdry);
	core=getTitle();
	selectWindow(colorbdry);
	path1=pathsub63+"-boundary.tif";
	save(path1);
	run("RGB Color");
	run("Color Counter");
	close();
	path2=pathsub63+"-core.tif";
	selectWindow(core);
	saveAs(path2);
	run("RGB Color");
	run("Color Counter");
	theText = getInfo("log");
	String.copy(theText);
	waitForUser("Paste it");
	close("*");
	close("log");
	} else {
	continue;
	}