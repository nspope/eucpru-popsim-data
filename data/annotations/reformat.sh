#!/usr/bin/env bash

for i in {1..23}; do
  CHROM=epru`printf '%03d' $i`
  zcat PSU_EPru_1.0_cleaned.annotation.gff.gz | \
    awk -vchr=$CHROM '!/^#/ && $1 == chr && $3 == "exon" {print $1"\t"$4-1"\t"$5}' | \
    sort -k1,1 -k2,2n | bedtools merge -i - >eucera_pruinosa.$CHROM.exons
done

tar czvf ../eucera_pruinosa.annotation.tar.gz eucera_pruinosa.*.exons
rm eucera_pruinosa.*.exons
