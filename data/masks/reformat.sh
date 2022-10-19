#!/usr/bin/env bash
for BED_RAW in *.mask.bed; do
  CHROM=`basename $BED_RAW | perl -pe 's/(epru...).+/$1/g'`
  cat $BED_RAW >eucera_pruinosa.$CHROM.mask.bed
done

tar czvf ../eucera_pruinosa.mask.tar.gz eucera_pruinosa.*.mask.bed
rm eucera_pruinosa.*.mask.bed
