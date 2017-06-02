#!/bin/bash

gtf=$1
type=CDS # gene, exon, transcript
zcat $gtf | grep appris |  awk -v type=$type 'OFS="\t" {if ($3==type) {print $1,$4-1,$5,$10,$18,$7}}' | tr -d '";' 
