#!/bin/bash

##run in home folder from blattabacteriaSetup.sh

##list full paths of all input files for hyphy
ls -d $PWD/*/*.hyphy > blattabacteriaGenes.txt

##set up summary table and include alignment length
egrep "filename|Alignment" readal.out | tr -d "'.#A-Za-z" | paste -d" " - - > blattabacteriaSummary.txt

#alignment variation
#GC content $f.html (change if alignments are trimmed)

##summarize tree results
##tree length
#*.phy_phyml_stats.txt has ". Parsimony:"

#visualize results in R?

