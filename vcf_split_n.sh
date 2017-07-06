#!/bin/bash

vcf=$1
n_lines=$2

zcat $vcf | head -n 1000 | grep '^#' > /scratch/mcgaugheyd/$1.head
zcat $vcf | grep -v '^#' > /scratch/mcgaugheyd/$1.variants


split -l $n_lines /scratch/mcgaugheyd/$1.variants /scratch/mcgaugheyd/splitVCF

for i in /scratch/mcgaugheyd/splitVCF*; 
	do cat /scratch/$1.head $i | bgzip > $i.vcf.gz ; 
	tabix -p vcf $i.vcf.gz ;
done

	 

