#! /bin/bash

docker build -t docker-hive . && \
    docker run --rm -it docker-hive /bin/bash