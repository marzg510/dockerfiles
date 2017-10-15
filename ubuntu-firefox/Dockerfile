FROM ubuntu
MAINTAINER m510.net

RUN apt-get update
RUN apt-get install -y xterm libreadline-dev git build-essential libssl-dev

RUN apt-get install -y language-pack-ja-base language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja
RUN apt-get install -y fonts-takao-gothic firefox

ENV LANG ja_JP.UTF-8

WORKDIR /workspace

CMD firefox
