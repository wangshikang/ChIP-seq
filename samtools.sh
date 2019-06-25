#samtobam
find . -name "*sam" |grep -v '\._' |cut -c 1-14 |sort > 1

cat 1 |while read id
do
arr=(${id})
sam=${arr[0]}
echo $sam
nohup samtools view -b $sam.sam -o $sam.bam -@ 5 &
done

#bam_sort
nohup samtools sort K27ac-seq--1.bam -o K27ac-seq--1.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--2.bam -o K27ac-seq--2.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--3.bam -o K27ac-seq--3.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--4.bam -o K27ac-seq--4.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--5.bam -o K27ac-seq--5.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--6.bam -o K27ac-seq--6.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--7.bam -o K27ac-seq--7.sort.bam -@ 10 &
nohup samtools sort K27ac-seq--8.bam -o K27ac-seq--8.sort.bam -@ 10 &

#去除PCR重复
find . -name "*sort.bam" |grep -v '\._' |cut -c 1-14 |sort > 1
cat 1 |while read id
do
arr=(${id})
bam=${arr[0]}
echo $bam
nohup samtools rmdup $bam.sort.bam $bam.rmdup.bam &
done

#建立索引
for a in $(ls ./*rmdup.bam)
do  
nohup samtools index $a -@ 8 &
done

#bamtobed
find . -name "*rmdup.bam" |grep -v '\._' |cut -c 1-14 |sort > 1
cat 1 |while read id
do
arr=(${id})
bam=${arr[0]}
echo $bam
nohup bedtools bamtobed -i $bam.rmdup.bam > $bam.bed &
done
