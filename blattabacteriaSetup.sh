#!/bin/bash

FILES=*.fas

for f in $FILES
	do

	echo "Processing setup for gene $f..."
	mkdir gene$f
	mv $f gene$f/
	cd gene$f

	##trim last three bp of each sequence (stop codons, not accepted by BUSTED selection test)
	prinseq-lite -fasta $f -trim_right 3
 
	##align sequences for each gene (translate, muscle, back translate)
	translatorx -i $f_prinseq_good_*.fasta -o $f -p M

	##trim alignments to remove gaps which occur in more than 10% of sequences
	trimal -in $f.nt_ali.fasta -out $f.phy -phylip -gt 0.9
	#print summary stats for final *.phy alignment and output as *.afa
	readal -in $f.phy -info >> ../readal.out
	readal -in $f.phy -out $f.afa -fasta

	##run each tree in phyml: assume HKY85 for all genes (test other model options later?)
	phyml -i $f.phy 
	##output is _phyml_stats.txt and _phyml_tree.txt

	##create hyphy input file (alignment + tree)
	cat $f.phy_phyml_tree.txt | tr -d ":.0123456789 " > $f.tre #simplify tree file 
	echo "$(cat $f.afa $f.tre) ;" > $f.hyphy #combine alignment and treefile for entry to hyphy

	#rm <extraneous files, *.html *.fasta *.log>

	cd ..

done

##list full paths of all input files for hyphy
ls -d $PWD/*/*.hyphy > ../BlattabacteriaGenes.txt

##summarize alignment results
#grep Avg. sequence length readal.out
#alignment variation
#GC content $f.html (change if alignments are trimmed)

##summarize tree results
#grep for tree length

#visualize results in R?
