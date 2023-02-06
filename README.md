# p-agi_cogtiff

## Dev environment
You can use Multipass for using Ubuntu as development environment:

```
multipass launch jammy --cpus 4 --disk 50G --mem 16G --name cogtiff
multipass mount /Users/stefan/tmp/geodata cogtiff:/home/ubuntu/geodata
multipass shell cogtiff

sudo apt-get update
sudo apt-get -y install gdal-bin

multipass stop cogtiff
```


## ch.bl.agi.lidar_2018.dsm_hillshade

```
sftp anonymous@sftp.geo.so.ch
lftp anonymous:anonymous@sftp.geo.so.ch -e "cd anonymous" 
```

```
scp root@5.75.153.138:geodata/ch.so.agi.orthofoto_2017.rgb/aktuell/ch.so.agi.orthofoto_2017.rgb.tif .
```

```
gdalbuildvrt -addalpha ch.bl.agi.lidar_2018.dsm_hillshade.vrt *.tif
(gdal_translate ch.bl.agi.lidar_2018.dsm_hillshade.vrt ch.bl.agi.lidar_2018.dsm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE) 
gdal_translate ch.bl.agi.lidar_2018.dsm_hillshade.vrt ch.bl.agi.lidar_2018.dsm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2017.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2017.rgb.vrt ch.so.agi.orthofoto_2017.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_1993.grau.vrt *.tif
gdal_translate ch.so.agi.orthofoto_1993.grau.vrt ch.so.agi.orthofoto_1993.grau.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE

scp root@5.75.153.138:geodata/ch.so.agi.orthofoto_1993.grau/aktuell/ch.so.agi.orthofoto_1993.grau.tif .
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2002.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2002.rgb.vrt ch.so.agi.orthofoto_2002.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE

scp root@5.75.153.138:geodata/ch.so.agi.orthofoto_2002.rgb/aktuell/ch.so.agi.orthofoto_2002.rgb.tif .
```


```
gdalbuildvrt -addalpha ch.bl.agi.orthofoto_2015.rgb.vrt aktuell/*.tif
gdal_translate ch.bl.agi.orthofoto_2015.rgb.vrt ch.bl.agi.orthofoto_2015.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE

scp root@167.235.59.146:ch.bl.agi.orthofoto_2015/aktuell/cogtiff/ch.bl.agi.lidar_2018.dsm.vrt .

```

```
gdalbuildvrt ch.bl.agi.lidar_2018.dsm.vrt *.tif
gdal_translate ch.bl.agi.lidar_2018.dsm.vrt ch.bl.agi.lidar_2018.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2006.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2006.rgb.vrt ch.so.agi.orthofoto_2006.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2007.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2007.rgb.vrt ch.so.agi.orthofoto_2007.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.bl.agi.lidar_2018.dtm.vrt *.tif
gdal_translate ch.bl.agi.lidar_2018.dtm.vrt ch.bl.agi.lidar_2018.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.bl.agi.lidar_2018.dtm_hillshade.vrt *.tif
gdal_translate ch.bl.agi.lidar_2018.dtm_hillshade.vrt ch.bl.agi.lidar_2018.dtm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

addalpha: ERROR 6: GTIFFBuildOverviews() doesn't support a mixture of band data types: Beim gdal_translate-Befehl.
Dito bei ndsm
```
gdalbuildvrt ch.bl.agi.lidar_2018.dtm_slope.vrt *.tif
gdal_translate ch.bl.agi.lidar_2018.dtm_slope.vrt ch.bl.agi.lidar_2018.dtm_slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.bl.agi.lidar_2018.ndsm_buildings.vrt *.tif
nohup gdal_translate ch.bl.agi.lidar_2018.ndsm_buildings.vrt ch.bl.agi.lidar_2018.ndsm_buildings.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.bl.agi.lidar_2018.ndsm_vegetation.vrt *.tif
nohup gdal_translate ch.bl.agi.lidar_2018.ndsm_vegetation.vrt ch.bl.agi.lidar_2018.ndsm_vegetation.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2014.dsm.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dsm.vrt ch.so.agi.lidar_2014.dsm.tif -a_nodata 0 -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.lidar_2014.dsm_hillshade.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dsm_hillshade.vrt ch.so.agi.lidar_2014.dsm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt ch.so.agi.lidar_2014.dsmdiff2001.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dsmdiff2001.vrt ch.so.agi.lidar_2014.dsmdiff2001.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2014.dtm.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dtm.vrt ch.so.agi.lidar_2014.dtm.tif -a_nodata 0 -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.lidar_2014.dtm_hillshade.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dtm_hillshade.vrt ch.so.agi.lidar_2014_hillshade.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2014.dtm_slope.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.dtm_slope.vrt ch.so.agi.lidar_2014_slope.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2014.ndsm.vrt *.tif
gdal_translate ch.so.agi.lidar_2014.ndsm.vrt ch.so.agi.lidar_2014.ndsm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2019.dsm.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dsm.vrt ch.so.agi.lidar_2019.dsm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.lidar_2019.dsm_hillshade.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dsm_hillshade.vrt ch.so.agi.lidar_2019.dsm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2019.dtm.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dtm.vrt ch.so.agi.lidar_2019.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.lidar_2019.dtm_hillshade.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dtm_hillshade.vrt ch.so.agi.lidar_2019.dtm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2019.dtm_slope.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dtm_slope.vrt ch.so.agi.lidar_2019.dtm_slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt ch.so.agi.lidar_2019.ndsm_buildings.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.ndsm_buildings.vrt ch.so.agi.lidar_2019.ndsm_buildings.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.so.agi.lidar_2019.ndsm_vegetation.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.ndsm_vegetation.vrt ch.so.agi.lidar_2019.ndsm_vegetation.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```





## todo:
