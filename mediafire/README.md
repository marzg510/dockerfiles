MediaFire
========================

## build container
1. create your config file
```
cp config.sample config
vi config
```
2. build container
```
docker build -t mediafire .
```

## use container
winpty docker run --rm -it --cap-add SYS_ADMIN --device /dev/fuse dev/mediafire //bin/bash
docker run --rm -it --cap-add SYS_ADMIN --device /dev/fuse -v /e/gotowork:/root/workspace mediafire /bin/bash
mediafire-fuse /mnt
rsync ./workspace/workspace/* /mnt/workspace -r --exclude=.git
rsync ./workspace/workspace/* /mnt/workspace -ahv --exclude=.git

