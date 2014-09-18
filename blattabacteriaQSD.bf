fileToExe = "/PATH/TO/FILE/QuickSelectionDetection.bf";

fscanf ( "/PATH/TO/FILE/blattabacteriaGenes.txt", "Lines", _inDirectoryPaths );
 
fprintf (stdout, "[READ ", Columns (_inDirectoryPaths), " file path lines]\n");

inputRedirect = {};
inputRedirect["01"]="Universal";
inputRedirect["02"]="New Analysis";
inputRedirect["04"]="Default";
inputRedirect["05"]="y";
inputRedirect["06"]=_inDirectoryPaths[_fileLine] + ".fit";
inputRedirect["07"]="Estimate dN/dS only";
inputRedirect["08"]="Single Ancestor Counting";
inputRedirect["09"]="Full tree";
inputRedirect["10"]="Averaged";
inputRedirect["11"]="Approximate";
inputRedirect["12"]=".05";
inputRedirect["13"]="Export to File";
inputRedirect["14"]=_inDirectoryPaths[_fileLine] + ".out";
inputRedirect["15"]="Skip";

for ( _fileLine = 0; _fileLine < Columns ( _inDirectoryPaths ); _fileLine = _fileLine + 1 ) {
 
	inputRedirect [ "03" ]	= _inDirectoryPaths[ _fileLine ];
	ExecuteAFile ( fileToExe, inputRedirect );
}