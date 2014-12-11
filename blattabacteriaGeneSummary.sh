#!/bin/bash

##run in home folder from blattabacteriaSetup.sh
##requires folders for Blat/Flav gene files (*.fas) for only each group

##list full paths of all input files for hyphy
ls -d $PWD/*/*.hyphy > blattabacteriaGenes.txt

##setting up summary table
ls Blat/ | sed s/\.fas// | awk 'BEGIN{print "gene"}1' > Blat.txt
ls Flav/ | sed s/\.fas// | awk 'BEGIN{print "gene"}1' > Flav.txt
cat Blat.txt Flav.txt | sort | uniq > all.txt
cat Blat.txt Flav.txt | sort | uniq -d > both.txt
cat both.txt | awk 'BEGIN{print "gene"}1' > temp1

##pull out lines with gene name and alignment length, remove extra characters, place gene name and length on same line, add headers, output to file
egrep "Alignment" readal.out | tr -d "'.#A-Za-z \t" | awk 'BEGIN{print "alignLength"}1' | paste temp1 - > temp2

##running loops to access stats from individual gene files
FILES=*.fas

##GC content in complete files
for f in $FILES
	do
	##select lines with frequency of C and G in alignment
	egrep "\(C\)|\(G\)" $f/*.phy_phyml_stats.txt | tr -d "\-= f()CG" | paste -d "\t" - - 
	##print header and columns added together, paste to temp
done | awk 'BEGIN{print "GC"}{print $1 + $2}' | paste temp2 - > temp3 

##GC content in Blat and Flav separately (including genes not present in one or the other)
cd Blat/
for f in $FILES
	do
	cat $f | grep -v ">" | awk 'BEGIN{a=0; c=0; g=0; t=0;} {a+=gsub("A",""); c+=gsub("C",""); g+=gsub("G",""); t+=gsub("T","");} END{print a,c,g,t}'
done | awk 'BEGIN{print "BlatGC"}{print ($2+$3)/($1+$2+$3+$4)}' | paste ../Blat.txt - > ../Blat.GC

cd ../Flav
for f in $FILES
	do
	cat $f | grep -v ">" | awk 'BEGIN{a=0; c=0; g=0; t=0;} {a+=gsub("A",""); c+=gsub("C",""); g+=gsub("G",""); t+=gsub("T","");} END{print a,c,g,t}'
done | awk 'BEGIN{print "FlavGC"}{print ($2+$3)/($1+$2+$3+$4)}' | paste ../Flav.txt - > ../Flav.GC
cd ..

##Join with summary table
join temp3 Blat.GC | join - Flav.GC > temp5

##tree length
for f in $FILES
	do
	egrep "\. Parsimony:" $f/*.phy_phyml_stats.txt | tr -d ". Parsimony:\t" 
done | awk 'BEGIN{print "treeLength"}1' | paste -d " " temp5 - > blattabacteriaGeneSummary.csv

rm temp*

#visualize results in R?

