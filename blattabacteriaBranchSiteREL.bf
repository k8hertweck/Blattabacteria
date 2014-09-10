fileToExe = "/usr/local/lib/hyphy/TemplateBatchFiles/BranchSiteREL.bf";

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
inputRedirect["02"]="Yes";
inputRedirect["03"]="Yes";
inputRedirect["05"]="y";
inputRedirect["06"]=_inDirectoryPaths[_fileLine] + ".out";

for ( _fileLine = 0; _fileLine < Columns ( _inDirectoryPaths ); _fileLine = _fileLine + 1 ) {
 
	inputRedirect [ "04" ]	= _inDirectoryPaths[ _fileLine ];
	ExecuteAFile ( fileToExe, inputRedirect );
}