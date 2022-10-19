#!/usr/bin/env bash
for HAPMAP_RAW in *.hapmap; do
  CHROM=`basename $HAPMAP_RAW | perl -pe 's/(epru...).+/$1/g'`
  awk -vchr=$CHROM '
  NR==1 {print "Chromosome\tPosition(bp)\tRate(cM/Mb)\tMap(cM)"}
  NR>1 {print chr"\t"$1"\t"$2"\t"$3}
  ' $HAPMAP_RAW >eucera_pruinosa.$CHROM.hapmap.txt

  echo "
import msprime
map = msprime.RateMap.read_hapmap('eucera_pruinosa.$CHROM.hapmap.txt')
print('$CHROM', map.mean_rate)
" | python3
done >average_rates.txt

#tar czvf ../eucera_pruinosa.genetic_map.tar.gz eucera_pruinosa.*.hapmap.txt
rm eucera_pruinosa.*.hapmap.txt
