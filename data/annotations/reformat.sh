#!/usr/bin/env bash
for BED_RAW in *.exons.bed; do
  CHROM=`basename $BED_RAW | perl -pe 's/(epru...).+/$1/g'`
  cut -f1-3 $BED_RAW >eucera_pruinosa.$CHROM.exons.bed
done

tar czvf ../eucera_pruinosa.annotation.tar.gz eucera_pruinosa.*.exons.bed
rm eucera_pruinosa.*.exons.bed

cat epru.annotation.gff3.gz >../eucera_pruinosa.annotation.gff3.gz
