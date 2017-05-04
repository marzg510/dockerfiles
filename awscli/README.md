awscli
========================

## build container
```
docker build -t mgdev/awscli .
```

setup awscli
```
docker run -it -v ${pwd}:/root/workspace mgdev/awscli
aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-1
Default output format [None]: json

aws s3 ls

ctrl+p => ctrl+q
docker ps
docker commit container_name image_name
```
## use awscli
```
docker run --rm -it -v ${pwd}:/root/workspace -w /root centos bash
docker run --rm -it -v ${pwd}:/root/workspace -w /root mgdev/awscli bash
docker run --rm -it -v ${pwd}:/root/workspace mgdev/awscli
```
```
docker ps
docker commit container_name image_name
docker images
```


## run & use
```
docker run -it --rm -v ${pwd}:/root/workspace -w /root mgdev/acdcli
#docker run -it -e "TZ=Asia/Tokyo" -v ${pwd}:/root/workspace -w /root mgdev/acdcli
#docker run --rm -it -e "TZ=Asia/Tokyo" -e LANG=ja_JP.UTF-8 -v ${pwd}:/root/workspace -w /root mgdev/acdcli
```
acdcli ls /
acdcli ul -o test /
acdcli ul -o Videos/* /Videos/

[AWS CLIのS3コマンドまとめ](http://www.task-notes.com/entry/20150904/1441335600)

aws s3 ls 
aws s3 ls backup.m510
aws s3 ls backup.m510 --recursive
