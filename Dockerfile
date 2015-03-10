FROM ubuntu:precise

MAINTAINER Brandon Burton <brandon@inatree.org>

ADD bin/build.sh /usr/local/bin/build
RUN chmod +x /usr/local/bin/build
RUN /usr/local/bin/build

ENTRYPOINT ["/bin/true"]
