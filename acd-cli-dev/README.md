acdcli
========================

[Amazon Cloud Driveをコマンドラインで操作する](http://christina04.hatenablog.com/entry/2016/01/27/015641)

## first build
```
docker build -t mgdev/acdcli .
```

## get access token & commit container
```
docker run -itd -v ${pwd}:/root/workspace -w /root mgdev/acdcli
docker ps
docker attach container_name
```
in bash prompt
```
acdcli -v init
```
v -> shift+s -> save to .cache/acd_cli/oauth_data -> q
```
acdcli sync
acdcli sync
# repeat sync until no errors
```
ls
```
acdcli ls /
```
ctrl+p -> ctrl+q
host prompt
```
docker ps
docker commit container_name image_name
docker images
```


## run & uae
```
docker run -it --rm -v ${pwd}:/root/workspace -w /root mgdev/acdcli
#docker run -it -e "TZ=Asia/Tokyo" -v ${pwd}:/root/workspace -w /root mgdev/acdcli
#docker run --rm -it -e "TZ=Asia/Tokyo" -e LANG=ja_JP.UTF-8 -v ${pwd}:/root/workspace -w /root mgdev/acdcli
```
acdcli ls /
acdcli ul -o test /

