#!/usr/bin/env bash
for BED_RAW in *.exons.bed; do
  CHROM=`basename $BED_RAW | perl -pe 's/(epru...).+/$1/g'`
  cut -f2-3 $BED_RAW >eucera_pruinosa.$CHROM.exons
done

tar czvf ../eucera_pruinosa.annotation.tar.gz eucera_pruinosa.*.exons
rm eucera_pruinosa.*.exons

cat epru.annotation.gff3.gz >../eucera_pruinosa.annotation.gff3.gz
