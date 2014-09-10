fileToExe = "/usr/local/lib/hyphy/TemplateBatchFiles/QuickSelectionDetection.bf";

_inDirectoryPaths = {};
fscanf (stdin, "String", x);
i = 0;
_inDirectoryPaths[i] = x;

while(x != 0) {
  x = 0;
  fscanf (stdin, "String", x);
  _inDirectoryPaths[i] = x;
  i = i + 1;
}

_fileLine = 0;
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