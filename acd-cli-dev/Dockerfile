FROM centos

WORKDIR /root
RUN yum install -y python3-setuptools python3-appdirs python3-dateutil python3-requests python3-sqlalchemy git
RUN easy_install3 -U pip
RUN sudo pip3 install --upgrade git+https://github.com/yadayada/acd_cli.git

#EXPOSE 80

#CMD ["ruby", "app.rb", "-p", "80", "-o", "0.0.0.0"]
