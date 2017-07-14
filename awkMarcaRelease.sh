#!/bin/bash 
#recebe os arquivos de imput e output como parametro, bem como qual release.
imput_file=$1
output_file=$2
#
#início do AWK
awk -v FS=" " -v release=$3 -v OFS=";" '{ 
	$1 = release;
	print;
	next;
}' $imput_file > $output_file

