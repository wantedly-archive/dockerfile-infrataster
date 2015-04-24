FROM ruby:2.1.6-slim
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

ENV PHANTOMJS_VERSION 1.9.8

RUN curl -o /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -L  https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
    cd /tmp && \
    tar xjf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
    cd phantomjs-$PHANTOMJS_VERSION-linux-x86_64 && \
    cp bin/phantomjs /usr/bin/phantomjs && \
    cd /tmp && \
    rm -rf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64*

RUN mkdir /test

COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock

WORKDIR /test
RUN apt-get update && \
    apt-get install -y \
      build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    bundle install -j4 && \
    apt-get purge -y --auto-remove build-essential

VOLUME ["/test/spec"]

CMD ["bundle", "exec", "rspec", "-c"]
