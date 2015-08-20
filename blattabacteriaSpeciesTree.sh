#!/bin/bash

## reconcile gene trees to species trees
## run in home folder from blattabacteriaSetup.sh
## requires folder for each gene containing phyml gene tree, mapping file for ASTRAL
## dependencies:
##	ASTRAL https://github.com/smirarab/ASTRAL/

cd ~/Copy/Blattabacteria/

## create empty file
mkdir speciesTree
echo -n > speciesTree/geneTrees.tre

## make input gene tree file for ASTRAL
cd genes
FILES=*.fas
for f in $FILES
	do
		cat ../speciesTree/geneTrees.tre $f/*.phy_phyml_tree.txt > ../speciesTree/temp
		mv ../speciesTree/temp ../speciesTree/geneTrees.tre
done

## make input list of bootstrap files for ASTRAL
ls $PWD/gene*/*.fas.phy_phyml_boot_trees_BS.txt > ../speciesTree/geneBSfiles.txt
grep -v 052mia geneBSfiles

## remove 052mia because of duplication
cd ../speciesTree
grep -v B2 geneTrees.tre > geneTreesASTRAL.tre
grep -v 052mia geneBSfiles.txt > geneBSASTRAL.txt

## run ASTRAL (just finding best tree)
java -jar /Applications/Astral/astral.4.7.8.jar -i geneTreesASTRAL.tre > speciesTreeASTRAL.tre

## run ASTRAL with bootstrapping
java -jar /Applications/Astral/astral.4.7.8.jar -i geneTreesASTRAL.tre -b geneBSASTRAL.txt -r 100 > speciesTreeBSASTRAL.tre
## pull out consensus BS tree
tail -1 speciesTreeBSASTRAL.tre > ASTRALBSconsensus.tre
## pull out main ASTRAL tree with BS values
tail -2 speciesTreeBSASTRAL.tre | head -1 > speciesTreeASTRALwithBS.tre

