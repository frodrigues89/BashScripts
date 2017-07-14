#!/bin/bash 

comm -12 | <(awk -v FS=, '{print $2}' AMOSTRAS_BAE_22_12_16.csv | sort) |
	<(awk -v FS=, '{print $3}' Planilha_DNAs_Bae_31_10_16.csv | sort) > iids_iguais.csv
