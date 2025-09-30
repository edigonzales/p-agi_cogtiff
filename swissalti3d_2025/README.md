```
conda create -n gdal
```

```
conda activate gdal
```

```
conda install conda-forge::gdal
```

```
conda deactivate
```


## DTM

```
gdalbuildvrt ch.swisstopo.dtm_2025.vrt *.tif
```

```
gdal_translate ch.swisstopo.dtm_2025.vrt ch.swisstopo.dtm_2025.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

## Hillshade

```
./gdaldem_hillshade.sh
```

```
gdalbuildvrt -addalpha ch.swisstopo.dtm_2025.relief.vrt *.tif
```

```
gdal_translate ch.swisstopo.dtm_2025.relief.vrt ch.swisstopo.dtm_2025.relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

## Slope

```
./gdaldem_slope.sh
```

```
gdalbuildvrt ch.swisstopo.dtm_2025.slope.vrt *.tif
```

```
gdal_translate ch.swisstopo.dtm_2025.slope.vrt ch.swisstopo.dtm_2025.slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```
