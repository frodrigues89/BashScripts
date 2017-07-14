#!/bin/bash
#Recebe os arquivos dos releases e o numero do cromo e os unifica
release1=$1
release2=$2
release3=$3
Cromo=$4
#
#
#Executanto script de marcação de release
bash awkMarcaRelease.sh $1 o1.csv 1 &
pid1=$!
bash awkMarcaRelease.sh $2 o2.csv 2 &
pid2=$!
bash awkMarcaRelease.sh $3 o3.csv 3 &
pid3=$!
#
wait
#
#unificando para um arquivo único
cat o1.csv o2.csv o3.csv > "$Cromo.unic.csv"
#
#excluindo arquivos temporarios
rm o1.csv
rm o2.csv
rm o3.csv
#
#Colocando o file único em ordem
sort -k 3 -t ";" "$4.unic.csv" > "$Cromo.unic.sorted.csv"
#
#
#
#
#

