#!/bin/bash 
awk -v FS=, 'NR>1 {print $3}' Planilha_DNAs_Bae_03_06_16.csv | sort | uniq -cd
