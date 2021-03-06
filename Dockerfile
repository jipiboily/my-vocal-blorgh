FROM ubuntu:14.04
MAINTAINER j@jipi.ca

# update package lists
RUN apt-get -y update

# install ruby dependencies
RUN apt-get install -y build-essential git libssl-dev libreadline-dev wget libpq-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN CONFIGURE_OPTS="--disable-install-doc" rbenv install 2.1.2
RUN rbenv global 2.1.2
RUN gem install bundler
RUN rbenv rehash


ADD ./Gemfile /vocal/root/Gemfile
ADD ./Gemfile.lock /vocal/root/Gemfile.lock

WORKDIR /vocal/root
RUN bundle install

ADD . /vocal/root


RUN rbenv rehash

CMD rails s