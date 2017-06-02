#!/bin/bash

module load bedtools

gene="$1"
bed="$2"
chrom_sizes="$3"

awk -v searchgene="$gene" '$4==searchgene {print $0}' $bed | bedtools merge -i - -g hg19.chrom  -d 10000000 -c 4 -o first
