#! /bin/bash

docker build -t docker-hive . \
  && docker run --rm -it --name docker-hive \
                -p 10000:10000 -p 8080:8080 -p 9083:9083 -p 16000:16000 \
                docker-hive /bin/bash
