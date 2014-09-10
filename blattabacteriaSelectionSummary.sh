#!/bin/bash

##run in home folder from blattabacteriaSetup.sh, adds to blattabacteriaSummary.txt

##QSD
##pull out two columns: # sites positively selected, # sites negatively selected
grep "SELECTED SITES" blattabacteriaQSD.out | cut -f3 -d " " | paste -d" " - - | tr "NO" "0"
#join results above with blattabacteriaSummary.txt
