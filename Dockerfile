FROM quay.io/wantedly/ruby:2.1.5
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
RUN bundle install -j4

VOLUME ["/test/spec"]

CMD ["bundle", "exec", "rspec", "-c"]
