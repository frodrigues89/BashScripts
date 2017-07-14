#!/bin/bash 

comm -23 |
	<(awk -v FS=, '{print $3}' AMOSTRAS_BAEII_26_08_2016.csv | sort) |
	<(awk -v FS=, '{print $3}' Planilha_DNAs_Bae_03_06_16.csv | sort) |
	| wc -l 
