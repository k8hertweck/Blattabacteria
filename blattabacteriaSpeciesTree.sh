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

## remove 052mia because of duplication
cd ../speciesTree
grep -v B2 geneTrees.tre > geneTreesASTRAL.tre

## run ASTRAL
java -jar /Applications/Astral/astral.4.7.8.jar -i geneTreesASTRAL.tre