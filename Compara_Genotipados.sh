#!/bin/bash

BIOTECA=Planilha_Bioteca_O1+O2.csv
PEDIGREE=Pedigree_release3_final_170116_ficticios.csv

comm -23 \
	<(awk -v FS=, '$1==1 { print $3 }' ${BIOTECA} | sort) \
	<(awk -v FS=, '$2==1 { print $4 }' ${PEDIGREE} | sort) \
	> Compara_Genotipados_Bioteca.csv

comm -13 \
	<(awk -v FS=, '$1==1 { print $3 }' ${BIOTECA} | sort) \
	<(awk -v FS=, '$2==1 { print $4 }' ${PEDIGREE} | sort) \
	> Compara_Genotipados_Pedigree.csv

comm -12 \
	<(awk -v FS=, '$1==1 { print $3 }' ${BIOTECA} | sort) \
	<(awk -v FS=, '$2==1 { print $4 }' ${PEDIGREE} | sort) \
	> Compara_Genotipados_Comuns.csv
