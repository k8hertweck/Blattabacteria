fileToExe = "/usr/local/lib/hyphy/TemplateBatchFiles/BUSTED.bf";

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
inputRedirect["03"]="y";
inputRedirect["04"]="All";
inputRedirect["05"]="";
 
for ( _fileLine = 0; _fileLine < Columns ( _inDirectoryPaths ); _fileLine = _fileLine + 1 ) {
 
	inputRedirect [ "02" ]	= _inDirectoryPaths[ _fileLine ];
	ExecuteAFile ( fileToExe, inputRedirect );
}