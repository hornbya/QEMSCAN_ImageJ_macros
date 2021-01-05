//This macro uses Read and Write Excel to tranpose results columns from shape data
//output by the Salts AGAR 18K macros into labelled tabs in an Excel sheet.

//Default settings: All shape results data within subfolders of selected input directory 
//are processed in sequence. Shape columns extracted are: Area, Perimeter, Solidity,
//Form factor, Roundness, Feret diameter and Orientation.
//Rearranged Excel file is saved on the desktop as 'Rename me after writing is done.xlsx".

macro "Shape results table arrangement" {

	parent=getDirectory("Choose grandparent directory");
	list=getFileList(parent);
	
	for (i = 0; i < list.length; i++) {
		dirName = list[i];
		dir=parent+File.separator+dirName;
		filename1="shapes"+File.separator+File.getName(dirName)+" u63-shape results.csv";
		filenameP1="shapes"+File.separator+File.getName(dirName)+" u63-poresResults.csv";
		filename2="shapes"+File.separator+File.getName(dirName)+" 63-500-shape results.csv";
		filenameP2="shapes"+File.separator+File.getName(dirName)+" 63-500-poresResults.csv";
		filename3="shapes"+File.separator+File.getName(dirName)+" +500-shape results.csv";
		filenameP3="shapes"+File.separator+File.getName(dirName)+" +500-poresResults.csv";
		
		sr1=dir+filename1;
		sr2=dir+filename2;
		sr3=dir+filename3;
		
		if (File.exists(sr1)==1) {
			sr=sr1;
			open(sr);
			srn=filename1;
			srP=dir+filenameP1;
			srPn=filenameP1;
			
			IJ.renameResults(srn, "Results");
			//Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			//Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Convexity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
				
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			//Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Solidity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			//Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Perimeter dataset_label=" +dirName);
			close("Results");
				
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			//Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");		
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret");  
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Form factor dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			//Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Roundness dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			//Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=AxR dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			//Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=FeretD dataset_label=" +dirName);
			close("Results");	
			
			open(srP);
			IJ.renameResults(srPn, "Results");
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
			
			run("Close All");
		}
				
		if (File.exists(sr2)==1) {
			sr=sr2;
			open(sr);
			srn=filename2;
			srP=dir+filenameP2;
			srPn=filenameP2;
			
			IJ.renameResults(srn, "Results");
			//Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			//Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Convexity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
				
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			//Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Solidity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			//Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Perimeter dataset_label=" +dirName);
			close("Results");
				
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			//Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");		
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret");  
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Form factor dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			//Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Roundness dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			//Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=AxR dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			//Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=FeretD dataset_label=" +dirName);
			close("Results");	
			
			open(srP);
			IJ.renameResults(srPn, "Results");
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
			
			run("Close All");
		}
		
		if (File.exists(sr3)==1) {
			sr=sr3;
			open(sr);
			srn=filename3;
			srP=dir+filenameP3;
			srPn=filenameP3;
			
			IJ.renameResults(srn, "Results");
			//Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			//Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
		
			run("Read and Write Excel", "no_count_column sheet=Convexity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
				
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			//Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Solidity dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			//Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Perimeter dataset_label=" +dirName);
			close("Results");
				
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			//Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");		
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret");  
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=Form factor dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			//Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=Roundness dataset_label=" +dirName);
			close("Results");
			
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			//Table.deleteColumn("AR feret"); 
			Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");	
		
			run("Read and Write Excel", "no_count_column sheet=AxR dataset_label=" +dirName);
			close("Results");
	
			open(sr);
		
			IJ.renameResults(srn, "Results");
			Table.deleteColumn("Area"); 
			Table.deleteColumn("Perim.");
			Table.deleteColumn("CH Area");
			Table.deleteColumn("CH Perim.");
			Table.deleteColumn("Solidity");
			Table.deleteColumn("Convexity"); 
			Table.deleteColumn("FormFactor");
			Table.deleteColumn("Circularity");
			Table.deleteColumn("Roundness");
			Table.deleteColumn("AR feret"); 
			//Table.deleteColumn("Feret d");
			Table.deleteColumn("MinFeret d");
			Table.deleteColumn("Orientation");
			
			run("Read and Write Excel", "no_count_column sheet=FeretD dataset_label=" +dirName);
			close("Results");	
			
			open(srP);
			IJ.renameResults(srPn, "Results");
			run("Read and Write Excel", "no_count_column sheet=Area dataset_label=" +dirName);
			close("Results");
			
			run("Close All");
		}
	}
}