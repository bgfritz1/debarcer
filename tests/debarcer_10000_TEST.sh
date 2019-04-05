#This is a script to debug debarcer and figure out why it's taking to long to run

module load tools anaconda3/4.4.0
module load samtools/1.9

#change to the debigging dir

cd /home/projects/ku_10025/cbc_projects/thj_mutationfreq/debarcer_debugging

#extract only read aligning to a specific region from BAM file
#rpoB aligns from 4776544 - 4780617
#put it in the debarcer_debugging_directory

bam_location=../data/debarcer_preprocessed/THJ1_A002_THJPROJEKT_R1.fastq.gz_R1.fastq.gz.bam.sorted.bam

samtools view -b $bam_location "chr1:4776044-4780817" > ./only_rpoB_alignments.bam

samtools index -b ./only_rpoB_alignments.bam

samtools flagstat ./only_rpoB_alignments.bam

samtools view -h ./only_rpoB_alignments.bam| head -n 1000 | samtools view -bS > 1000_rpoB.bam

samtools index 1000_rpoB.bam

python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py group -o /home/projects/ku_10025/cbc_projects/thj_mutationfreq/debarcer_debugging -r chr1:4776044-4780817 -b ./1000_rpoB.bam

python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py collapse -o /home/projects/ku_10025/cbc_projects/thj_mutationfreq/debarcer_debugging -r chr1:4776044-4780817 -b ./1000_rpoB.bam -c /home/projects/ku_10025/apps/debarcer/config/tim_config.ini -u chr1:4776044-4780817.umis 

python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py call -o /home/projects/ku_10025/cbc_projects/thj_mutationfreq/debarcer_debugging -r chr1:4776044-4780817 -cf chr1:4776044-4780817.cons -f 1,2,5 -c /home/projects/ku_10025/apps/debarcer/config/tim_config.ini



