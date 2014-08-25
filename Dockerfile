FROM ck99/java:0.0.2
MAINTAINER Ciaran Kelly <ciaran.kelly@gmail.com>

ENV ELASTIC_SEARCH_VERSION 1.3.2

RUN $HOME/docker-tools/unpack-remote-tarball-to \
    https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTIC_SEARCH_VERSION.tar.gz \
    /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
EXPOSE 9200
EXPOSE 9300


