fileToExe = "/PATH/TO/FILE/TemplateBatchFiles/BUSTED.bf";

fscanf ( "/PATH/TO/FILE/blattabacteriaGenes.txt", "Lines", _inDirectoryPaths );
 
fprintf (stdout, "[READ ", Columns (_inDirectoryPaths), " file path lines]\n");

inputRedirect = {};
inputRedirect["01"]="Universal";
inputRedirect["03"]="y";
inputRedirect["04"]="All";
inputRedirect["05"]="";
 
for ( _fileLine = 0; _fileLine < Columns ( _inDirectoryPaths ); _fileLine = _fileLine + 1 ) {
 
	inputRedirect [ "02" ]	= _inDirectoryPaths[ _fileLine ];
	ExecuteAFile ( fileToExe, inputRedirect );
}