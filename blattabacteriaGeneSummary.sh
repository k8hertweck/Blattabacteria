#!/bin/bash

##run in home folder from blattabacteriaSetup.sh

##list full paths of all input files for hyphy
ls -d $PWD/*/*.hyphy > blattabacteriaGenes.txt

##setting up summary table
##pull out lines with gene name and alignment length, remove extra characters, place gene name and length on same line, add headers, output to file
egrep "filename|Alignment" readal.out | tr -d "'.#A-Za-z \t" | paste -d "\t" - - | awk 'BEGIN{print "gene\talignLength"}1' > temp

##running loops to access stats from individual gene files
FILES=*.fas

##GC content  
for f in $FILES
	do
	##select lines with frequency of C and G in alignment
	egrep "\(C\)|\(G\)" $f/*.phy_phyml_stats.txt | tr -d "\-= f()CG" | paste -d "\t" - - 
	##print header and columns added together, paste to temp
done | awk 'BEGIN{print "GC"}{print $1 + $2}' | paste temp - > temp2 


##tree length
for f in $FILES
	do
	egrep "\. Parsimony:" $f/*.phy_phyml_stats.txt | tr -d ". Parsimony:\t" 
done | awk 'BEGIN{print "treeLength"}1' | paste temp2 - > blattabacteriaGeneSummary.txt

#rm temp*

#visualize results in R?

