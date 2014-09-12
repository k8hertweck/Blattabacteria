#!/bin/bash

##run in home folder from blattabacteriaSetup.sh, adds to blattabacteriaGeneSummary.txt

##QSD
##pull out two columns: # sites positively selected, # sites negatively selected; add header, join with blattabacteriaGeneSummary.txt
grep "SELECTED SITES" blattabacteriaQSD.out | cut -f3 -d " " | paste -d " " - - | tr "NO" "0" | awk 'BEGIN{print "negative\tpositive}1' | paste blattabacteriaGeneSummary.txt > temp

##BranchSiteREL
#grep "p <=" blattabacteriaBranchSiteREL.out | 

#add to blattabacteriaSelectionSummary.txt

##BUSTED

#rm <extraneous files>