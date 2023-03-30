#!/bin/bash

BASEPATH=./
OUTPATH=./cogtiff/

for FILE in ${BASEPATH}*.tif
do
  echo $FILE
  BASENAME=$(basename $FILE .tif)
  OUTFILE=${OUTPATH}/${BASENAME}.tif
  
  echo "Processing: ${BASENAME}.tif"
  if [ -f $OUTFILE ] #skip if exists
  then
    echo "Skipping: $OUTFILE"
  else    
    #gdal_translate -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE $FILE $OUTFILE
    gdal_translate -of COG -co NUM_THREADS=ALL_CPUS -expand RGB -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE $FILE $OUTFILE
    #gdal_translate -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE $FILE $OUTFILE
  fi
done
