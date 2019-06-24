#!/bin/sh

wkd=/data3/wangshikang/chenlin
mkdir $wkd/cutadapt

find . -name "*gz" |grep -v '\._'|grep 1.fq.gz |cut -c 1-17 |sort > 1 
find . -name "*gz" |grep -v '\._'|grep 2.fq.gz |cut -c 1-17 |sort > 2 
paste 1 2 > config

dir=$wkd/cutadapt
cat config |while read id
do
arr=(${id})
fq1=${arr[0]}
fq2=${arr[1]}
echo $dir $fq1 $fq2
nohup cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -u 0 -u -10 -U 0 -U -10 -m 30 -o $fq1.fastq -p $fq2.fastq $fq1.fq.gz $fq2.fq.gz -j 5 &
done
