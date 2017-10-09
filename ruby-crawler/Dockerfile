FROM ruby:2.4.0

WORKDIR /root

RUN apt-get update -y && apt-get upgrade -y

# install ruby modules
RUN gem install mechanize

ENV RUBYOPT=-EUTF-8


