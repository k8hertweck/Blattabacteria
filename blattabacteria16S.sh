#!/bin/bash

##align sequences
muscle -in Blattabacteria16S.fas -out Blattabacteria16S.afa

##convert fasta alignment from fasta to phyml
#Blattabacteria16S.afa -> Blattabacteria16S.phy

##run each tree in phyml under HKY85
phyml -i Blattabacteria16S.phy -m HKY85 --run_id HKY

##run tree in phyml under GTR
phyml -i Blattabacteria16S.phy -m GTR --run_id GTR

##run each tree in phyml under HKY85
phyml -i Blattabacteria16S.phy -b 1000 -m HKY85 --run_id BS
