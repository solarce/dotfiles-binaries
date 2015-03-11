FROM ubuntu:precise

MAINTAINER Brandon Burton <brandon@inatree.org>

ENV BUILD_DIR /usr/local/build
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir $BUILD_DIR
ADD scripts/* $BUILD_DIR/
ADD packages $BUILD_DIR/
RUN ls $BUILD_DIR/
RUN apt-get update -yqq
RUN apt-get install ruby1.9.1-full -yqq
RUN apt-get install curl -yqq
RUN gem install bundler

WORKDIR $BUILD_DIR
RUN chmod +x build.rb
RUN bundle install
RUN bundle exec ./build.rb

ENTRYPOINT ["/bin/true"]
