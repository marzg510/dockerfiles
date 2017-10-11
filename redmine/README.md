# Redmine on docker


## docker-compose
```
docker-compose up -d
docker exec -it redmine_ap_1 bash
bundle exec rake db:migrate
bundle exec rake redmine:load_default_data
exit
```

## Build
```
docker build -t m510.net/redmine-ap app/.
docker build -t m510.net/redmine-db database/.
docker volume create --name redmine-db-vol
```

## Run
```
docker run --name redmine-db -e POSTGRES_USER=redmine -e POSTGRES_PASSWORD=password -e "TZ=Asia/Tokyo" -v redmine-db-vol:/var/lib/postgresql/data -d m510.net/redmine-db
docker run --name redmine-ap -e "TZ=Asia/Tokyo" -p 80:80 --link redmine-db:dbserver -d m510.net/redmine-ap
```

## Configuration
```
docker exec -it redmine-ap bash
bundle exec rake db:migrate
bundle exec rake redmine:load_default_data
exit
```

## Use

1. Open http://localhost/redmine/ in browser
2. login by admin/admin
3. change admin password
4. setting
 * http://redmine.jp/tech_note/first-step/admin/

## Scale
```
docker-compose scale ap=2
# edit proxy/nginx.conf
docker-compose restart lb
```

## Maintain
### db
```
docker exec -it redmine-db bash
docker run -it --rm --link redmine-db:dbserver postgres psql -h dbserver -U postgres
```

### ap
```
docker exec -it redmine-ap /bin/bash
docker run --name redmine-ap -e "TZ=Asia/Tokyo" -p 80:80 --link redmine-db:dbserver -it m510.net/redmine-ap
#docker run -d -p 80:80 --rm --name webserver m510.net/redmine-proxy
```

### log
```
docker logs -t redmine_ap_1
docker logs -t redmine_db_1
```
### remove 
```
docker rm $(docker ps -q -f status=exited)
docker images | awk '/<none/{print $3}' | xargs docker rmi
```

## Test
### db
```
docker run -it --rm --link redmine-db:dbserver postgres psql -h dbserver -U redmine
docker run -it --rm --link redmine_dbserver_1:dbserver --net redmine_default postgres psql -h dbserver -U redmine

\l
create table t1 ( c1 char(10) primary key, c2 varchar(100));
insert into t1 values ('k001','v001');
select * from t1;
\q

```

## Others

### data volume
https://unskilled.site/docker-%E3%83%87%E3%83%BC%E3%82%BF%E3%83%9C%E3%83%AA%E3%83%A5%E3%83%BC%E3%83%A0%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E3%82%92%E3%81%A4%E3%81%8F%E3%82%8B/


```
docker run -it --rm busybox
docker run -it -v /data --name datavol busybox
echo "hello world" >/data/test.txt
exit
docker run -it --rm --volumes-from datavol --name testos centos /bin/bash
cat /data/test.txt

```

```
docker create -v /data --name datavol busybox
```

### postgres
```
docker run --name redmine-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -d postgres
docker run -it --rm --link redmine-db:dbserver postgres psql -h dbserver -U postgres
```

* mount data volume

```
#docker create -v /var/lib/postgresql/data --name redmine-db-vol busybox
docker volume create --name redmine-db-vol
#docker run --name redmine-db -e POSTGRES_USER=redmine -e POSTGRES_PASSWORD=password -e POSTGRES_INITDB_ARGS="-E UTF-8 -l ja_JP.UTF-8" --volumes-from redmine-db-vol -d postgres
docker run --name redmine-db -e POSTGRES_USER=redmine -e POSTGRES_PASSWORD=password -v redmine-db-vol:/var/lib/postgresql/data -d postgres
docker run -it --rm --link redmine-db:dbserver postgres psql -h dbserver -U redmine
```
