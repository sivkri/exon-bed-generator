#!/bin/bash

# Download the GTF file
wget -O Homo_sapiens.GRCh38.76.gtf.gz ftp://ftp.ensembl.org/pub/release-76/gtf/homo_sapiens/Homo_sapiens.GRCh38.76.gtf.gz

# Extract the GTF file
zcat Homo_sapiens.GRCh38.76.gtf.gz \
  | grep -w exon \
  | awk -F '\t' 'BEGIN{OFS="\t"}{gsub(/"/, "", $10); print $1, $4, $5, $10, $16}' \
  | sort -k4 > tmp.bed

# Create the output directory
mkdir -p Homo_sapiens.GRCh38_explode
cd Homo_sapiens.GRCh38_explode

# Split the BED file into separate files based on column 4
awk '{print > $4}' ../tmp.bed

# Process each file and merge the results
for file in ENS*
do
  sortBed $file | mergeBed -nms \
    | awk -F ';' '{print $1}' \
    >> ../Homo_sapiens.GRCh38_exon.bed
done

# Sort the final output
sortBed -o ../Homo_sapiens.GRCh38_exon.bed ../Homo_sapiens.GRCh38_exon.bed

# Clean up temporary files
rm ../tmp.bed
