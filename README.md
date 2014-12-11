Blattabacteria 
==============
pipeline: gene alignment, cleanup, tree building, and data summary

Authors: Austin Alleman and Kate Hertweck, The University of Texas at Tyler

Run scripts in order as they appears below. testData folder contains example intermediate output for debugging and script building.

#Gene alignment, trimming, phylogeny building
syntax: blattabacteriaSetup.sh <path to file with *.fas files>

dependencies: 
* prinseq-lite (prinseq-lite.pl, installed as the executable prinseq-lite) http://prinseq.sourceforge.net
* translatorx (translatorx_vLocal.pl, installed as the executable translatorx) http://translatorx.co.uk
* trimal and readal http://trimal.cgenomics.org
* phyml http://atgc.lirmm.fr/phyml/

input: one unaligned fasta file for each gene (*.fas)

output: folder for each gene containing variety of files (including *.hyphy)

#Gene alignment and tree summaries

syntax: blattabacteriaGeneSummary.sh

input: output from blattabacteriaSetup.sh, including readal.out and folder for each gene 

output: list of complete paths to each gene's *.hyphy file (blattabacteriaGenes.txt), table of gene summary stats (blattabacteriaGeneSummary.txt, tab delimited, column names: gene, alignLength, GC, BlatGC, FlavGC, treeLength)

#Selection tests in HYPHY
syntax: e.g., hyphy blattabacteriaQSD.bf > blattabacteriaQSD.out

dependencies:

	HYPHY v2.2.1 (https://github.com/veg/hyphy)

Batch file wrappers:
* blattabacteriaBUSTED.bf
* blattabacteriaQSD.bf
* blattabacteriaBranchSiteREL.bf

input: *.hyphy for each gene (fasta alignment with tree appended, located in gene directory), list of complete paths to each gene's *.hyphy file (blattabacteriaGenes.txt), *.bf file with complete paths to fileToExe and blattabacteriaGenes.txt modified to reflect your computer

output: 
	
#Selection test summaries

syntax: blattabacteriaSelectionSummary.sh

input: blattabacteriaGeneSummary.txt (from blattabacteriaGeneSummary.sh), output from selection tests

output: blattabacteriaSelectionSummary.txt

#16S tree
This is just a note about the parameters used to run the 16S tree; sequence alignment conversion was run separately (not in script)
