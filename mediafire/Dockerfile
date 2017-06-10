FROM centos
MAINTAINER m510.net

WORKDIR /root

RUN yum update -y
RUN yum groupinstall -y "Development Tools" "Development Libraries"
RUN yum install -y cmake jansson-devel libcurl libcurl-devel fuse-devel openssl-devel

# Japan localize
# see http://d.hatena.ne.jp/Kazuhira/20150913/1442156191
# see http://qiita.com/yuki2006/items/6cea8c352e38f047b52a#comment-8e863c71962008035d0d
RUN yum reinstall -y glibc-common
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";
ENV LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install mediafire-fuse
RUN git clone https://github.com/MediaFire/mediafire-fuse.git
WORKDIR mediafire-fuse
RUN mkdir build
WORKDIR build
RUN cmake ..
RUN make
RUN make install

COPY config /root/.config/mediafire-tools/

WORKDIR /root

