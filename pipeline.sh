#!/bin/bash ;

echo -e "\n\n\n" ;
echo "#####################################################" ;
echo "#preliminary step: variable and log initialisation #" ;
echo "#####################################################" ;

Read1="$1" ;
Read2="$2" ;
Ref_Fasta="$3" ;
#SRR14160265_1.fastq
base=$(echo "$Read1" | awk -F'_' '{print_$1}')

#Root directories
Pipeline_root="/home/despu/Desktop/Pipeline_development/pipelines" ;
results_root="/home/despu/Desktop/Pipeline_development/pipelines/results" 
echo -e "\n" ;
echo "Variable Assignment Done." ;

echo -e "\n\n" ;
echo "#####################################################" ;
echo "#Analysis step 1: Quality check#" ;
echo "#####################################################" ;

echo `fastqc "$Read1"` ;
echo `fastqc "$Read2"` ;

echo "FASTQC Done." ;

echo -e "\n\n" ;
echo "#####################################################" ;
echo "#Analysis step 2: Genome indexing #" ;
echo "#####################################################" ;

echo `bwa index "$Ref_Fasta"` ;

echo -e "\n" ;
echo "Genome indexing Done." ;

echo -e "\n\n\n" ;
echo "#####################################################" ;
echo "#Analysis step 3: Read Mapping#" ;
echo "#####################################################" ;
echo `bwa mem -t 4 "$Ref_Fasta" "$Read1" "$Read2" > "$results"\"$base"_Mapped.sam` ;

echo -e "\n" ;
echo "sam file generation Done." ;

echo "#####################################################" ;
echo "#Analysis step 4: Convert SAM to BAM and sorting#" ;
echo "#####################################################" ;

echo `samtools sort -@ 8 _Mapped.sam > Mapped_Sorted.bam`

echo -e "\n" ;
echo "sam to bam and generation of sorted bamfile Done";




