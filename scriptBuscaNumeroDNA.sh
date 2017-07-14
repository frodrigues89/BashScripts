#!/bin/bash 
awk -v FS=, -v OFS=, 'NR==FNR{
	id[$1]=$1;
	nome[$1]=$2;
	next;
	file1final = $NR;
}
NR>FNR{
	if ($id[$3]==$3){	
		print;
	}
next;
}
' ../2017_03_03_AMOSTRAS_baeIII.csv ../2016_10_31_Planilha_DNAs_Bae.csv > ../BaependiDNAs.csv



