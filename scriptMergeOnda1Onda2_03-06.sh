#!/bin/bash 
awk -v FS=, -v OFS=, 'NR==FNR{	
	onda1[$3]=$1;
	onda2[$3]=$2;
	nome[$3]=$4;
	id[$3]=1;
	next;
}
id[$3]==1{
	if ($4=="NA" || $4==""){
		$4 = onda1[$3];			
	}
	if ($6=="NA" || $4==""){
		$6 = onda2[$3];			
	}
	if ($9=="NA" || $4==""){
		$9 = nome[$3];			
	}	
	print;
next;
}
{print}' ONDA1_Samantha_sem_Bae.csv Planilha_DNAs_TESTE1.csv > Planilha_Bioteca_O1+O2.csv



