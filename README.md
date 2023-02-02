# p-agi_cogtiff

## Dev environment
You can use Multipass for using Ubuntu as development environment:

```
multipass launch jammy --cpus 4 --disk 20G --mem 16G --name cogtiff
multipass mount $HOME/sources cogtiff:/home/ubuntu/sources
multipass shell cogtiff

sudo apt-get update
sudo apt-get -y install gdal-bin

multipass stop cogtiff
```
