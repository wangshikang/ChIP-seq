#samtobam
find . -name "*sam" |cut -c 1-14 |sort > 1

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
