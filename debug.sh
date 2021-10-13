#! /bin/bash

docker build -t docker-hive . && \
    docker run --rm -it docker-hive /bin/bash


# docker run --rm -it docker-hive /bin/bash -c "cat /opt/hadoop-3.2.1/etc/hadoop/yarn-site.xml" > hadoop/yarn-site.xml