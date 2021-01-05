//Creates a stack of single phase images from an 8-bit colour tiff file with up to 255 slices. Slices with no data (i.e. background or non-existent) are not saved.

Dialog.create("Phases (enter higher rather than lower number if unknown)");
Dialog.addNumber("Maximum number of colours" 0);
Dialog.show();

n = Dialog.getNumber();
parent=getDirectory("Choose grandparent directory");
list=getFileList(parent);

for (i = 1; i < list.length; i++) {
	dirName = list[i];
	dir=parent+dirName;
	sampleName=File.getName(dir);
	savedir=dir + File.separator+"phases";
	File.makeDirectory(savedir);
	
	pathT=dir+sampleName+".tif";
	if	(File.exists(pathT)){
		open(pathT);
		name=File.nameWithoutExtension;
		orig=getTitle();
	
		for (j = 1; j<n+1; j++) {
			run("Duplicate...", " ");
			setAutoThreshold("Default dark");
			run("Threshold...");
			setThreshold(j, j);
			setOption("BlackBackground", false);
			run("Convert to Mask");
			selectWindow(orig);
		}

		getLut(reds, greens, blues);
		close();
		run("Images to Stack");
		run("8-bit");

		for (k = 1; k < n; k++) {
			RedValue = reds[k];       // get r value of RGB
			GreenValue = greens[k];   // get g value of RGB
			BlueValue = blues[k];     // get b value of RGB
			rgbcode=(RedValue + GreenValue + BlueValue);
			Stack.setSlice(k);
			if	(rgbcode== 0) setMetadata("Label","Unclassified");
			if (rgbcode== 510) setMetadata("Label","Plagioclase");
			if (rgbcode== 255) setMetadata("Label","Clinopyroxene");
			if (rgbcode== 407) setMetadata("Label","Orthopyroxene");
			if (rgbcode== 192) setMetadata("Label","Olivine");
			if (rgbcode== 420) setMetadata("Label","Px microlites");
			if (rgbcode== 639) setMetadata("Label","Quartz");
			if (rgbcode== 507) setMetadata("Label","Bdry glass");
			if (rgbcode== 462) setMetadata("Label","Pigeonite");
			if (rgbcode== 672) setMetadata("Label","Others");
			if (rgbcode== 384) setMetadata("Label","Matrix glass");
			if (rgbcode== 345) setMetadata("Label","Fe-Ti oxides");
			if (rgbcode== 765) run("Delete Slice");
			//else {	setMetadata("Label", rgbcode);
		}
		
		
		path2=savedir+File.separator+name+" stack.tif"; 	//saveAs("Tiff", phases + "stack")
		saveAs(path2);
		close();
	}
}	