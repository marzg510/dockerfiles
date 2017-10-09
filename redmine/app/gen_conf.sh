#!/bin/bash

CONFIG=/usr/local/apache2/conf/extra/redmine.conf
# configure passenger
cat >$CONFIG <<EOF
# allow Redmine files
<Directory "/var/lib/redmine/public">
  Require all granted
</Directory>
EOF
echo "# Basic setting for Passenger" >>$CONFIG
/usr/local/bin/passenger-install-apache2-module --snippet >>$CONFIG
cat >>$CONFIG <<EOF
# tuning for passenger(option)
# show Phusion Passenger users guide(https://www.phusionpassenger.com/library/config/apache/reference/)
PassengerMaxPoolSize 20
PassengerMaxInstancesPerApp 4
PassengerPoolIdleTime 864000
PassengerStatThrottleRate 10

Header always unset "X-Powered-By"
Header always unset "X-Runtime"
EOF
cat >>$CONFIG <<EOF
Alias /redmine /var/lib/redmine/public
<Location /redmine>
  PassengerBaseURI /redmine
  PassengerAppRoot /var/lib/redmine
</Location>
EOF

