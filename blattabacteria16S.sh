#!/bin/bash

##align sequences
muscle -in Blattabacteria16S.fas -out Blattabacteria16S.afa

##convert fasta alignment from fasta to phyml
#Blattabacteria16S.afa -> Blattabacteria16S.phy

##modeltest in jModelTest2: result was GTR+G under both AIC and BIC

##run tree in phyml under GTR+G
phyml -i Blattabacteria16S.phy -m GTR -f m -c 4 -a e -o tlr -s NNI --run_id GTRG

##bootstrap tree in phyml under GTR+G
phyml -i Blattabacteria16S.phy -b 1000 -m GTR -f m -c 4 -a e -o tlr -s NNI --run_id GTRGbs

##run each tree in phyml under HKY85
phyml -i Blattabacteria16S.phy -m HKY85 --run_id HKY

##run tree in phyml under GTR
phyml -i Blattabacteria16S.phy -m GTR --run_id GTR

