FROM ruby:2.1.6-slim
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

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
