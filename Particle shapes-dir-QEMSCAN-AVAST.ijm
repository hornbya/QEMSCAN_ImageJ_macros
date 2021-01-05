	parent=getDirectory("Choose grandparent directory");
	list=getFileList(parent);

	setBatchMode(true);

	for (i = 0; i < list.length; i++) {
		dirName = list[i];
		dir=parent+dirName;
		shapesdir=dir+"shapes";
		File.makeDirectory(shapesdir);
		dirf=parent+dirName+File.getName(dirName);
		print(dirf);
		sub63=dirf+" u63.tif";
		sub500=dirf+" 63-500.tif";
		over500=dirf+" +500.tif";
		print(sub63);
		if (File.exists(sub63)==1) {
			open(sub63);
			u63=getImageID();
		}
		if (File.exists(sub500)==1) {
			open(sub500);
			u500=getImageID();
		}
		if (File.exists(over500)==1) {
			open(over500);
			o500=getImageID();
		}
		
		while (nImages>0) {

			run("8-bit");
			setThreshold(0, 254);
			run("Convert to Mask", "method=Default background=light");
			run("Set Scale...", "distance=1 known=1 unit=um");
			t=getTitle();
			titleNoext=replace(t, ".tif", "");
			savepath1=shapesdir+File.separator+titleNoext+"-threshold";
			print(savepath1);
			saveAs("tiff", savepath1);
			original=getTitle();
			
			minParea=100;
			run("Clear Results");
			run("Set Measurements...", "area redirect=None decimal=3");
			run("Analyze Particles...", "size=100-Infinity pixel show=Masks display");
			sieved=getTitle();
			savepath2=shapesdir+File.separator+titleNoext+"-poresResults.csv";
			selectWindow("Results");
			saveAs("results", savepath2);
			//close(original);
			//close(sieved);
		//}
	//}
			selectWindow(original);
			close();
			selectWindow(sieved);
			
			run("Make Binary");
			run("Fill Holes (Binary/Gray)");
			fh=getImageID();
			run("Invert");
			run("Clear Results"); 
			run("Shape Filter", "area=0-Infinity area_convex_hull=0-Infinity perimeter=0-Infinity perimeter_convex_hull=0-Infinity feret_diameter=0-Infinity min._feret_diameter=0-Infinity max._inscr._circle_diameter=0-Infinity area_eq._circle_diameter=0-Infinity long_side_min._bounding_rect.=0-Infinity short_side_min._bounding_rect.=0-Infinity aspect_ratio=1-Infinity area_to_perimeter_ratio=0-Infinity circularity=0-Infinity elongation=0-1 convexity=0-1 solidity=0-1 num._of_holes=0-Infinity thinnes_ratio=0-1 contour_temperatur=0-1 orientation=0-180 fractal_box_dimension=0-2 option->box-sizes=2,3,4,6,8,12,16,32,64 draw_holes fill_results_table exclude_on_edges");
			sf=getImageID();
			
			n = nResults;
			area1 = newArray(n); 
			length1 = newArray(n); 
			area2 = newArray(n); 
			length2 = newArray(n);
			ff1 = newArray(n);
			feret1 = newArray(n); 
			minferet1 = newArray(n);
			orientation1 = newArray(n);
			roiLabel1 = newArray(n);
			
			for (k = 0; k<n; k++) {
				orientation1[k] = getResult('Orientation', k); 
				length1[k] = getResult('Peri.', k);
				area1[k] = getResult('Area', k);
				area2[k] = getResult('Area Conv. Hull', k);
				length2[k] = getResult('Peri. Conv. Hull', k);
				ff1[k] = getResult('Thinnes Rt.', k);
				feret1[k] = getResult('Feret', k);
				minferet1[k] = getResult('Min. Feret', k);
			}
			
			run("Clear Results"); 
			for (k = 0; k<n; k++) { 
				setResult("Area", k, area1[k]);
				setResult("Perim.", k, length1[k]); 
				setResult("CH Area", k, area2[k]); 
				setResult("CH Perim.", k, length2[k]); 
				setResult("Solidity", k, area1[k]/area2[k]); 
				setResult("Convexity", k, length2[k]/length1[k]); 
				setResult("FormFactor", k, ff1[k]);
				setResult("Circularity", k, length1[k]/(2*sqrt(PI*area1[k])));
				setResult("Roundness", k, 4*area1[k]/(PI*pow(feret1[k],2)));
				setResult("AR feret", k, minferet1[k]/feret1[k]);
				setResult("Feret d", k, feret1[k]); 
				setResult("MinFeret d", k, minferet1[k]);
				setResult("Orientation", k, orientation1[k]);
			} 
			updateResults();
			savepath=shapesdir+File.separator+titleNoext+"-shape results.csv";
			selectWindow("Results");
			saveAs("results", savepath);
			close("Results");
			close(sf);
			close(sieved);
			close("Mask-fillHoles");
			//close("*");
		}
	}