#!/bin/bash ;

echo -e "\n\n\n" ;
echo "#####################################################" ;
echo "#preliminary step: variable and log initialisation#" ;
echo "#####################################################" ;

Read1="$1" ;
Read2="$2" ;
Ref_Fasta="$3" ;

#Root directories
Pipeline_root="/home/despu/Desktop/Pipeline_development/pipelines" ;
results_root="/home/despu/Desktop/Pipeline development/pipelines/results" ;

echo "Variable Assignment Done." ;

echo -e "\n\n" ;
echo "#####################################################" ;
echo "#Analysis step 1: Quality check#" ;
echo "#####################################################" ;

echo `fastqc "$Read1"` ;
echo `fastqc "$Read2"` ;

echo "Done." ;

