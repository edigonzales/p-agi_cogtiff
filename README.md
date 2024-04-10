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
gdalbuildvrt -vrtnodata -9999 ch.bl.agi.lidar_2018.ndsm_buildings.vrt *.tif
nohup gdal_translate ch.bl.agi.lidar_2018.ndsm_buildings.vrt ch.bl.agi.lidar_2018.ndsm_buildings.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -vrtnodata -9999 ch.bl.agi.lidar_2018.ndsm_vegetation.vrt *.tif
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
gdalbuildvrt -vrtnodata -9999 ch.so.agi.lidar_2014.dtm_slope.vrt *.tif
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
gdalbuildvrt -addalpha ch.so.agi.lidar_2019.dtm_slope.vrt *.tif

Im VRT den dataType="Byte" zu Float32 ändern. GDAL kann keine Overviews mit unterschiedlichen Bändern rechnen.

gdal_translate ch.so.agi.lidar_2019.dtm_slope.vrt ch.so.agi.lidar_2019.dtm_slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE

ODER

gdalbuildvrt -vrtnodata -9999 ch.so.agi.lidar_2019.dtm_slope.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.dtm_slope.vrt ch.so.agi.lidar_2019.dtm_slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt -vrtnodata -9999 ch.so.agi.lidar_2019.ndsm_buildings.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.ndsm_buildings.vrt ch.so.agi.lidar_2019.ndsm_buildings.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -vrtnodata -9999 ch.so.agi.lidar_2019.ndsm_vegetation.vrt *.tif
gdal_translate ch.so.agi.lidar_2019.ndsm_vegetation.vrt ch.so.agi.lidar_2019.ndsm_vegetation.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2011.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2011.cir.vrt ch.so.agi.orthofoto_2011.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2011.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2011.rgb.vrt ch.so.agi.orthofoto_2011.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2012.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2012.cir.vrt ch.so.agi.orthofoto_2012.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2012.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2012.rgb.vrt ch.so.agi.orthofoto_2012.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2013.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2013.cir.vrt ch.so.agi.orthofoto_2013.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2013.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2013.rgb.vrt ch.so.agi.orthofoto_2013.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2014.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2014.cir.vrt ch.so.agi.orthofoto_2014.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2014.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2014.rgb.vrt ch.so.agi.orthofoto_2014.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2015.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2015.cir.vrt ch.so.agi.orthofoto_2015.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2015.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2015.rgb.vrt ch.so.agi.orthofoto_2015.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2016.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2016.cir.vrt ch.so.agi.orthofoto_2016.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2016.rgb.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2016.rgb.vrt ch.so.agi.orthofoto_2016.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.so.agi.orthofoto_2017.cir.vrt *.tif
gdal_translate ch.so.agi.orthofoto_2017.cir.vrt ch.so.agi.orthofoto_2017.cir.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt -addalpha ch.swisstopo.swissimage_2021.rgb.vrt *.tif
nohup gdal_translate ch.swisstopo.swissimage_2021.rgb.vrt ch.swisstopo.swissimage_2021.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE &
```

```
gdalbuildvrt -addalpha ch.swisstopo.swissimage_2018.rgb.vrt *.tif
nohup gdal_translate ch.swisstopo.swissimage_2018.rgb.vrt ch.swisstopo.swissimage_2018.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE &
```

```
gdalbuildvrt -addalpha ch.swisstopo.swissimage_2015.rgb.vrt *.tif
nohup gdal_translate ch.swisstopo.swissimage_2015.rgb.vrt ch.swisstopo.swissimage_2015.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE &
```

```
gdalbuildvrt (-addalpha ??) ch.swisstopo.satellitenbilder_2015_04.rgb.vrt *.tif
nohup gdal_translate ch.swisstopo.satellitenbilder_2015_04.rgb.vrt ch.swisstopo.satellitenbilder_2015_04.rgb.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE &
```

```
gdal_translate walker_1832.tif ch.so.agi.walkerkarte_1832.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE 
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk10.farbig_relief.vrt *.tif

gdal_translate ch.swisstopo.lk10.farbig_relief.vrt ch.swisstopo.lk10.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE 

gdal_translate ch.swisstopo.lk10.farbig_relief.vrt /Volumes/T7/ch.swisstopo.lk10.farbig_relief/ch.swisstopo.lk10.farbig_relief_bilinear.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=BILINEAR 

gdal_translate ch.swisstopo.lk10.farbig_relief.vrt /Volumes/T7/ch.swisstopo.lk10.farbig_relief/ch.swisstopo.lk10.farbig_relief_cubic.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=CUBIC 
```


```
gdalbuildvrt -addalpha ch.swisstopo.lk10.grau_relief.vrt *.tif
gdal_translate ch.swisstopo.lk10.grau_relief.vrt ch.swisstopo.lk10.grau_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk25.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk25.farbig.vrt ch.swisstopo.lk25.farbig.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk25.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk25.farbig_relief.vrt ch.swisstopo.lk25.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk25.grau.vrt *.tif
gdal_translate ch.swisstopo.lk25.grau.vrt ch.swisstopo.lk25.grau.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk50.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk50.farbig.vrt ch.swisstopo.lk50.farbig.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk50.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk50.farbig_relief.vrt ch.swisstopo.lk50.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk50.grau.vrt *.tif
gdal_translate ch.swisstopo.lk50.grau.vrt ch.swisstopo.lk50.grau.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk100.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk100.farbig.vrt ch.swisstopo.lk100.farbig.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt -addalpha ch.swisstopo.lk100.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk100.farbig_relief.vrt ch.swisstopo.lk100.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk100.grau.vrt *.tif
gdal_translate ch.swisstopo.lk100.grau.vrt ch.swisstopo.lk100.grau.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk200.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk200.farbig.vrt ch.swisstopo.lk200.farbig.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk200.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk200.farbig_relief.vrt ch.swisstopo.lk200.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk200.grau.vrt *.tif
gdal_translate ch.swisstopo.lk200.grau.vrt ch.swisstopo.lk200.grau.tif -expand RGBA -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk500.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk500.farbig.vrt ch.swisstopo.lk500.farbig.tif -expand RGB -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk500.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk500.farbig_relief.vrt ch.swisstopo.lk500.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk500.grau.vrt *.tif
gdal_translate ch.swisstopo.lk500.grau.vrt ch.swisstopo.lk500.grau.tif -expand RGB -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk1000.farbig.vrt *.tif
gdal_translate ch.swisstopo.lk1000.farbig.vrt ch.swisstopo.lk1000.farbig.tif -expand RGB -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk1000.farbig_relief.vrt *.tif
gdal_translate ch.swisstopo.lk1000.farbig_relief.vrt ch.swisstopo.lk1000.farbig_relief.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk1000.grau.vrt *.tif
gdal_translate ch.swisstopo.lk1000.grau.vrt ch.swisstopo.lk1000.grau.tif -expand RGB -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lk1000.grau_relief.vrt *.tif
gdal_translate ch.swisstopo.lk1000.grau_relief.vrt ch.swisstopo.lk1000.grau_relief.tif  -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.dom_2001.gradientenbilder.vrt *.tif
gdal_translate ch.swisstopo.dom_2001.gradientenbilder.vrt ch.swisstopo.dom_2001.gradientenbilder.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.swisstopo.dom_2001.schattenbilder.vrt *.tif
gdal_translate ch.swisstopo.dom_2001.schattenbilder.vrt ch.swisstopo.dom_2001.schattenbilder.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.dtm-av_2001.bpav_schattenbilder.vrt *.tif
gdal_translate ch.swisstopo.dtm-av_2001.bpav_schattenbilder.vrt ch.swisstopo.dtm-av_2001.bpav_schattenbilder.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.swisstopo.dtm-av_2001.dtm.vrt *.tif
gdal_translate ch.swisstopo.dtm-av_2001.dtm.vrt ch.swisstopo.dtm-av_2001.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.dtm-av_2001.gradientenbilder.vrt *.tif
gdal_translate ch.swisstopo.dtm-av_2001.gradientenbilder.vrt ch.swisstopo.dtm-av_2001.gradientenbilder.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.swisstopo.dtm_2001.schattenbilder.vrt *.tif
gdal_translate ch.swisstopo.dtm_2001.schattenbilder.vrt ch.swisstopo.dtm_2001.schattenbilder.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt ch.swisstopo.dufourkarte.vrt *.tif
gdal_translate ch.swisstopo.dufourkarte.vrt ch.swisstopo.dufourkarte.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdal_translate LandsatMos25.tif ch.swisstopo.landsat.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdal_translate ch.swisstopo.sentinel_2018.tif ch.swisstopo.sentinel_2018_cog.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=JPEG -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.siegfriedkarte.vrt *.tif
gdal_translate ch.swisstopo.siegfriedkarte.vrt ch.swisstopo.siegfriedkarte.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```
------------------------------------

```
gdalbuildvrt ch.swisstopo.lidar_2023.dsm.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.dsm.vrt ch.swisstopo.lidar_2023.dsm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lidar_2023.dsm_hillshade.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.dsm_hillshade.vrt ch.swisstopo.lidar_2023.dsm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt ch.swisstopo.lidar_2023.dtm.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.dtm.vrt ch.swisstopo.lidar_2023.dtm.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -addalpha ch.swisstopo.lidar_2023.dtm_hillshade.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.dtm_hillshade.vrt ch.swisstopo.lidar_2023.dtm_hillshade.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -vrtnodata -9999 ch.swisstopo.lidar_2023.ndsm_buildings.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.ndsm_buildings.vrt ch.swisstopo.lidar_2023.ndsm_buildings.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdalbuildvrt -vrtnodata -9999 ch.swisstopo.lidar_2023.ndsm_vegetation.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.ndsm_vegetation.vrt ch.swisstopo.lidar_2023.ndsm_vegetation.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```


```
gdalbuildvrt -vrtnodata -9999 ch.swisstopo.lidar_2023.dtm_slope.vrt *.tif
gdal_translate ch.swisstopo.lidar_2023.dtm_slope.vrt ch.swisstopo.lidar_2023.dtm_slope.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=3 -co BIGTIFF=YES -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdal_translate ch.so.afu.klimaanalyse.gebaeude_ist_10m.tif cog_ch.so.afu.klimaanalyse.gebaeude_ist_10m.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```

```
gdal_translate ch.so.afu.klimaanalyse.kaltluftproduktionsrate_4uhr_ist.tif cog_ch.so.afu.klimaanalyse.kaltluftproduktionsrate_4uhr_ist.tif -of COG -co NUM_THREADS=ALL_CPUS -co COMPRESS=DEFLATE -co PREDICTOR=2 -co BIGTIFF=NO -co OVERVIEWS=IGNORE_EXISTING -co RESAMPLING=AVERAGE
```



## todo:

