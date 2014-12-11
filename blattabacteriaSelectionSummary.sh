#!/bin/bash

##run in home folder from blattabacteriaSetup.sh, adds to blattabacteriaGeneSummary.txt

##QSD: pull out two columns: # sites positively selected, # sites negatively selected; add header, join with blattabacteriaGeneSummary.txt
grep "SELECTED SITES" blattabacteriaQSD.out | cut -f3 -d " " | paste -d " " - - | sed "s/NO/0/" | awk 'BEGIN{print "QSDpositive QSDnegative"}1' | paste -d " " blattabacteriaGeneSummary.csv - > blattabacteriaGeneSummaryQSD.csv

##BranchSiteREL
##pull out lines referencing branches under positive selection? need examples of significant results
#grep "p <=" blattabacteriaBranchSiteREL.out | 

#add to blattabacteriaSelectionSummary.txt

##BUSTED
##pull out lines referencing branches under positive selection

#rm <extraneous files>