#!/bin/bash
#Recebe arquivo de imput e gera o file final
#
imput_file=$1
#
#início do awk
awk -v FS=";" -v OFS=";" '
BEGIN{
	#Nesta parte do codigo, estou buscando quantas dosagens existem em cada onda.
	snpHead = 5;	
	na1 = 1014;
	na2 = 406;
	na3 = 889;
	fullLine = 5 + na1 + na2 + na3;
}
{	
	#Com o número de dosagens já determinado, segue o codigo
	if (NR == 1){
#---------------INÍCIO do trecho que representa a function saveLine---------------------------
		#Este laço inicial pega o head de cada snp.		
		for ( i=1 ; i<= snpHead ; i++ ){		
			snp[i] = $i;		
		}
		k = snpHead +1;		
		if ($1 == 1){
			#soma-se 1 a snpHead, para colocar na proxima posição a primeira dosagem.
			snp[(snpHead + 1)] = $k;
			++k;
			#j inicia com snpHead+2, para rodar à partir da segunda dosagem.
			for (j= (snpHead +2) ; j <= NF ; j++){
				snp[j] = $k;
				++k;
			}
		}else {
			snp[(snpHead + 1)] = "NA";
			for (j=(snpHead +2); j <= (na1 + snpHead) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
		k= snpHead + 1;
		if ($1 == 2){
			jump = (snpHead + na1 + 1);
			snp[jump] = $k;
			++jump;
			++k;
			for (j= jump ; j <= (NF + jump) ; j++){
				snp[j] = $k;
				++k;
			}		
		}else {
			jump = (snpHead + na1 + 1);
			snp[jump] = "NA";
			++jump;
			for (j= jump ; j <= (na2 + jump) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
		k= snpHead + 1; 
		if ($1 == 4) {
			jump = (snpHead + na1 + na2 + 1);
			snp[jump] = $k;
			++jump;
			++k;
			for (j = jump ; j <= (NF + jump) ; j++){
				snp[j] = $k;
				++k;
			}
		}else {
			jump = (snpHead + na1 + na2 + 1);
			snp[jump] = "NA";
			++jump;
			for (j = jump ; j <= (na3 + jump) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
#------------------FIM do trecho que representa a function saveLine------------------------
	}else {
		#verifica se trata-se do mesmo snp
		if (snp[3] == $3){		
#-----------------INICIO do trecho que representa a function computeSNP----------------------
			snp[1] = snp[1] + $1;
			k = snpHead + 1;			
			if ($1 == 1){
				jump = snpHead + 1;
				snp[jump] = $k;
				++jump;
				++k;
			}else if ($1 == 2){
				jump = (snpHead + na1 + 1);
				snp[jump] = $k;
				++jump;
				++k;	
			}else if ($1 == 4) {
				jump = (snpHead + na1 + na2 + 1);
				snp[jump] = $k;
				++jump;
				++k;				
			}
			for (j= jump; j <= (NF + jump - snpHead -2) ; j++){	
				snp[j] = $k;
				++k;
			}
#------------------FIM do trecho que representa a function computeSNP------------------------
#
		}else  {
#
#		O trecho abaixo concatena o vetor snp para uma unica string e imprime;
			linha = snp[1];
			for ( j=2 ; j <= fullLine ; j++ ){
				linha = linha ";" snp[j];
				snp[j] = "XX";
			}		
			print linha;
#
#
#
#---------------INÍCIO do trecho que representa a function saveLine-------------------		
		#Este laço inicial pega o head de cada snp.		
		for ( i=1 ; i<= snpHead ; i++ ){		
			snp[i] = $i;		
		}
		k = snpHead +1;		
		if ($1 == 1){
			#soma-se 1 a snpHead, para colocar na proxima posição a primeira dosagem.
			snp[(snpHead + 1)] = $k;
			++k;
			#j inicia com snpHead+2, para rodar à partir da segunda dosagem.
			for (j= (snpHead +2) ; j <= NF ; j++){
				snp[j] = $k;
				++k;
			}
		}else {
			snp[(snpHead + 1)] = "NA";
			for (j=(snpHead +2); j <= (na1 + snpHead) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
		k= snpHead + 1;
		if ($1 == 2){
			jump = (snpHead + na1 + 1);
			snp[jump] = $k;
			++jump;
			++k;
			for (j= jump ; j <= (NF + jump) ; j++){
				snp[j] = $k;
				++k;
			}		
		}else {
			jump = (snpHead + na1 + 1);
			snp[jump] = "NA";
			++jump;
			for (j= jump ; j <= (na2 + jump) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
		k= snpHead + 1; 
		if ($1 == 4) {
			jump = (snpHead + na1 + na2 + 1);
			snp[jump] = $k;
			++jump;
			++k;
			for (j = jump ; j <= (NF + jump) ; j++){
				snp[j] = $k;
				++k;
			}
		}else {
			jump = (snpHead + na1 + na2 + 1);
			snp[jump] = "NA";
			++jump;
			for (j = jump ; j <= (na3 + jump) ; j++){
				snp[j] = "NA";
				++k;
			}
		}
#------------------FIM do trecho que representa a function saveLine------------------------
		}
	}
	next;
}
#este último printline serve para printar o ultimo snp que aparece no arquivo;
END {
#O trecho abaixo concatena o vetor snp para uma unica string e imprime;
	linha = snp[1];
	for ( j=2 ; j <= fullLine ; j++ ){
		linha = linha ";" snp[j];
	}		
	print linha;
}' $imput_file > "merged.$imput_file"


