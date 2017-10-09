FROM centos

WORKDIR /root
# Japan localize
# see http://d.hatena.ne.jp/Kazuhira/20150913/1442156191
# see http://qiita.com/yuki2006/items/6cea8c352e38f047b52a#comment-8e863c71962008035d0d
RUN yum reinstall -y glibc-common
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";
ENV LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# install awscli
RUN yum -y install epel-release which groff
RUN yum --enablerepo=epel -y install python-pip
RUN pip install awscli
RUN echo "complete -C $(which aws_completer) aws" >> $HOME/.bashrc

