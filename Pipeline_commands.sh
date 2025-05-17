#Command for running fastQC on given fastq file 
fastq-dump -X 100000 --split-files SRR14160265 

#Indexing of the reference genome
bwa index h_py_genome.fasta 

#command for mapping ead to reference
bwa mem -t 4 h_py_genome.fasta SRR14160265_1.fastq SRR14160265_2.fastq > SRR14160265.sam
#(a sam file is generated )

#Converting sam to bam and sorting 
samtools sort -@ 8 sample.sam > sample_sorted.bam 

#Index BAM file 
samtools index sample_sorted.bam(the bam file that was generated)

#Remove duplicated reads using sam tools 
samtools rmdup -sS sample_sorted.bam Sample_rmdup_sorted.bam #(removed duplicated file is generated i.e upper bam file) 

#Indexing of the rmdup bam file 
samtools index sample_rmdup_sorted.bam(final file for variant calling)

#mpileup (mutation calling) using samtools
bcftools mpileup -f h_py_genome.fasta SRR14160265_rmdup_sorted.bam | bcftools call -c -v -Ov -o SRR14160265_bcftools.vcf




