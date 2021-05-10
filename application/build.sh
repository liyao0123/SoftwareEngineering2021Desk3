#!/bin/bash
# ignore error if network already exists
docker network create -d bridge efww-network 2>/dev/null
bash ./processEnv.sh
cd ./static/database/ && bash startDB.sh && cd ../../

(docker build -t efww -f efwwDockerfile .)
(docker run -it --name fauna -d --network efww-network -p 80:8080 efww)

(docker build -t earth -f earthDockerfile .)
(docker run -it --name earth -d --network efww-network -p 3000:80 earth)
