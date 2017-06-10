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
docker run -it --rm -v ${pwd}:/root/workspace mgdev/awscli
winpty docker run -it --rm -v /${PWD}:/root/workspace mgdev/awscli
```
## aws cli command sample

[AWS CLIのS3コマンドまとめ](http://www.task-notes.com/entry/20150904/1441335600)

```
## ls
aws s3 ls 
aws s3 ls backup.m510
aws s3 ls backup.m510 --recursive
## ディレクトリを再帰的にコピー
aws s3 cp bar/ s3://workbt/ --recursive
## 低冗長でコピー
aws s3 cp <LocalPath> s3://<bucket>/<prefix>/<object> --storage-class REDUCED_REDUNDANCY

aws s3 sync s3://backup.m510/videos/Family/everio/HDDCAM/ ./workspace/HDDCAM/. --ignore-glacier-warnings --force-glacier-transfer

## make bucket
aws s3 mb s3://test.m510
```
