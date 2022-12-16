#!/usr/bin/env bash
for BED_RAW in *.mask.bed; do
  CHROM=`basename $BED_RAW | perl -pe 's/(epru...).+/$1/g'`
  cp $BED_RAW eucera_pruinosa.$CHROM.mask
done

tar czvf ../eucera_pruinosa.mask.tar.gz eucera_pruinosa.*.mask
rm eucera_pruinosa.*.mask
