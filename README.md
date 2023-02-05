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

```