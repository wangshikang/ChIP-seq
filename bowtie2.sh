#!/bin/sh

wkd=/data3/wangshikang/chenlin
mkdir $wkd/bowtie2
cd $wkd/bowtie2

find .. -name "*fastq" |grep -v '\._'|grep 1.fastq |cut -c 1-18 |sort > 1 
find .. -name "*fastq" |grep -v '\._'|grep 2.fastq |cut -c 1-18 |sort > 2 
paste 1 2 > config

dir=$wkd/bowtie2
cat config |while read id
do
arr=(${id})
fq1=${arr[0]}
fq2=${arr[1]}
echo $dir $fq1 $fq2
nohup bowtie2 -p 10 -x /data3/wangshikang/reference/TopHat/bowtie2index/Homo_sapiens.GRCh38/genome -1 $fq1.fastq -2 $fq2.fastq -S ./$fq1.sam &
done
