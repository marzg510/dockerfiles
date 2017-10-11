FROM httpd
MAINTAINER m510.net

RUN apt-get update -y

RUN apt-get install -y build-essential zlib1g-dev libreadline-dev libyaml-dev libcurl4-openssl-dev \
postgresql postgresql-client \
libapr1-dev libaprutil1-dev \
imagemagick libmagick++-dev fonts-takao-gothic \
subversion git curl wget
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

EXPOSE 80
CMD ["httpd-foreground"]

