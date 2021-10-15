#! /bin/bash

docker build -t docker-hive . \
  && docker run --rm --name docker-hive -p 10000:10000 -p 8080:8080 -p 9083:9083 -d docker-hive \
  && docker exec -it docker-hive /bin/bash