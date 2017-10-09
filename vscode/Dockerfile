FROM ubuntu
MAINTAINER m510.net

RUN apt-get update
RUN apt-get install -y xterm libreadline-dev git build-essential libssl-dev

RUN apt-get install -y language-pack-ja-base language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja
RUN apt-get install -y fonts-takao-gothic

RUN apt-get install -y curl gnupg apt-transport-https libgtk2.0.0 libxss1 libasound2
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get update
RUN apt-get install -y code
RUN apt-get install -y sudo

#RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
#RUN mkdir /usr/local/rbenv/shims /usr/local/rbenv/versions /usr/local/rbenv/plugins
#RUN groupadd rbenv
#RUN chgrp -R rbenv /usr/local/rbenv
#RUN chmod -R g+rwxXs /usr/local/rbenv
#RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
#RUN chgrp -R rbenv /usr/local/rbenv/plugins/ruby-build
#RUN chmod -R g+rwxs /usr/local/rbenv/plugins/ruby-build
#RUN /usr/local/rbenv/plugins/ruby-build/install.sh
#RUN git clone https://github.com/sstephenson/rbenv-default-gems.git /usr/local/rbenv/plugins/rbenv-default-gems
#RUN chgrp -R rbenv /usr/local/rbenv/plugins/rbenv-default-gems
#RUN chmod -R g+rwxs /usr/local/rbenv/plugins/rbenv-default-gems
#RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
#RUN echo 'export PATH="/usr/local/rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
#RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
#RUN echo '%rbenv ALL=(ALL) ALL' >> /etc/sudoers
#RUN /usr/local/rbenv/bin/rbenv install 2.3.0

#ENV PATH $HOME/.rbenv/bin:$PATH

#RUN eval "`rbenv init -`"

#RUN useradd -ms /bin/bash -G sudo,rbenv vs
RUN useradd -ms /bin/bash -G sudo vs
RUN echo "vs ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

USER vs
ENV HOME /home/vs
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8

WORKDIR /home/vs

RUN git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
ENV PATH $HOME/.rbenv/bin:$PATH
RUN rbenv install 2.3.0
RUN rbenv global 2.3.0
RUN rbenv rehash
ENV PATH $HOME/.rbenv/shims:${PATH}
ENV RBENV_SHELL bash

RUN gem update --system
RUN gem install bundler
RUN gem install ruby-debug-ide
RUN gem install debase

#WORKDIR /workspace

CMD code /workspace
