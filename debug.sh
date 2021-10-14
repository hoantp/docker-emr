#! /bin/bash

docker build -t docker-hive . && \
    docker run --rm -it --name docker-hive -p 10000:10000 -p 8080:8080 -p 9083:9083 docker-hive /bin/bash


# docker run --rm -it docker-hive /bin/bash -c "cat /opt/hadoop-3.2.1/etc/hadoop/yarn-site.xml" > hadoop/yarn-site.xml