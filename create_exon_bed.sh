#!/bin/bash
wget ftp://ftp.ensembl.org/pub/release-76/gtf/homo_sapiens/Homo_sapiens.GRCh38.76.gtf.gz
zcat Homo_sapiens.GRCh38.76.gtf.gz \
| grep -w exon | tr '"' '\t' \
| cut -f1,4,5,10,16 | sed 's/\t/_/4' \
| sort -k4 > tmp.bed

mkdir Homo_sapiens.GRCh38_explode
cd Homo_sapiens.GRCh38_explode
awk '{print > $4}' ../tmp.bed

for i in `ls ENS*`
do cat $i | sortBed | mergeBed -nms \
| cut -d ';' -f1
done | sortBed > ../Homo_sapiens.GRCh38_exon.bed