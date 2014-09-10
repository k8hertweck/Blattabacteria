fileToExe = "/usr/local/lib/hyphy/TemplateBatchFiles/BranchSiteREL.bf";

fscanf ( stdin, "Lines", _inDirectoryPaths );
 
fprintf (stdout, "[READ ", Columns (_inDirectoryPaths), " file path lines]\n");

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