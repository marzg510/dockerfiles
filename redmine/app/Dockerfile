#FROM ruby:2.4
FROM httpd
#FROM centos:centos7
MAINTAINER m510.net

RUN apt-get update -y
#RUN apt-get upgrade -y
#RUN apt-get install locales
#RUN sed -i -e "s/# ja_JP.*/ja_JP.UTF-8 UTF-8/" /etc/locale.gen
#RUN dpkg-reconfigure -f noninteractive locales
#RUN update-locale LANG=ja_JP.UTF-8
#ENV LANG ja_JP.UTF-8

#RUN yum -y groupinstall "Development Tools"
#RUN yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel libffi-devel wget which \
#postgresql-devel \
#httpd httpd-devel \
#ImageMagick ImageMagick-devel ipa-pgothic-fonts

RUN apt-get install -y build-essential zlib1g-dev libreadline-dev libyaml-dev libcurl4-openssl-dev \
postgresql \
libapr1-dev libaprutil1-dev \
imagemagick libmagick++-dev fonts-takao-gothic \
subversion git
#libssl-dev 
#postgresql postgresql-server-dev-all \
#apache2 apache2-dev libapr1-dev libaprutil1-dev \
#imagemagick libmagick++-dev fonts-takao-gothic \
#subversion git \
#RUN apt-get install -y \
#build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev \
#apache2 apache2-dev libapr1-dev libaprutil1-dev \
#imagemagick libmagick++-dev fonts-takao-gothic 
RUN apt-get install -y postgresql-client
RUN apt-get install -y curl wget
RUN apt-get install -y libssl-dev=$OPENSSL_VERSION

# install ruby
WORKDIR /tmp
RUN curl -O https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
RUN tar xf ruby-2.4.1.tar.gz && rm -f ruby-2.4.1.tar.gz
WORKDIR ruby-2.4.1
RUN ./configure --disable-install-doc
RUN make
RUN make install
RUN /usr/local/bin/gem install bundler --no-rdoc --no-ri

# install redmine
RUN svn co http://svn.redmine.org/redmine/branches/3.4-stable /var/lib/redmine
WORKDIR /var/lib/redmine
RUN /usr/local/bin/bundle install --without development test --path vendor/bundle

# install passenger
RUN gem install passenger --no-rdoc --no-ri
RUN passenger-install-apache2-module --auto --languages ruby

RUN apt-get install -y postgresql-server-dev-all
ADD database.yml /var/lib/redmine/config/database.yml
ADD configuration.yml /var/lib/redmine/config/configuration.yml
RUN bundle install --without development test --path vendor/bundle
RUN bundle exec rake generate_secret_token
ENV RAILS_ENV=production
ENV REDMINE_LANG=ja
RUN chown -R www-data:www-data /var/lib/redmine
ADD gen_conf.sh /tmp/gen_conf.sh
RUN /tmp/gen_conf.sh

RUN echo "Include conf/extra/redmine.conf" >>/usr/local/apache2/conf/httpd.conf

#RUN echo '# configration for redmine' >/usr/local/apache2/conf/extra/redmine.conf
#COPY <<EOF /usr/local/apache2/conf/extra/redmine.conf
#TEST
#EOF
# configration for redmine
#RUN echo '\
## allow Redmine files\
#<Directory "/var/lib/redmine/public">\
#  Require all granted\
#</Directory>\
#'\
#>>/usr/local/apache2/conf/extra/redmine.conf
#cat >/etc/httpd/conf.d/redmine.conf <<EOF
#RAILS_ENV=production REDMINE_LANG=ja /usr/local/bin/bundle exec rake redmine:load_default_data


RUN echo please execute 2 commands below
RUN echo bundle exec rake db:migrate
RUN echo bundle exec rake redmine:load_default_data

EXPOSE 80
CMD ["httpd-foreground"]

