FROM centos

WORKDIR /root
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python34 python34-setuptools python34-libs python34-pip python34-sqlalchemy python34-requests git w3m caca-utils fuse-libs
#RUN easy_install3 -U pip
RUN pip3 install --upgrade git+https://github.com/yadayada/acd_cli.git
RUN export LANG=C
RUN mkdir -p .w3m
RUN echo 'image/*; cacaview %s; needsterminal' > .w3m/mailcap
# Japan localize
# see http://d.hatena.ne.jp/Kazuhira/20150913/1442156191
# see http://qiita.com/yuki2006/items/6cea8c352e38f047b52a#comment-8e863c71962008035d0d
RUN yum reinstall -y glibc-common
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";

ENV LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

