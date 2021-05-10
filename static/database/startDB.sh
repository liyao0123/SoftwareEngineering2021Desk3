#!/bin/bash
# ignore erroe is volume doesn't exists already
docker volume rm mysql_data 2>/dev/null
docker volume create mysql_data
docker run --net=efww-network --name mysql01 -d -p 3306:3306 -v mysql_data:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=Pwd1234567 mysql:5.7
# wait for the container up and then execute below command
sleep 20;
while [ "$(docker inspect -f '{{.State.Running}}' mysql01 2>/dev/null)" != "true" ]; do printf "."; sleep 1; done
docker cp db_v3.sql mysql01:/var/lib/mysql/
docker cp set_user.sql mysql01:/var/lib/mysql/
docker cp dbRootConfig.cnf mysql01:/var/lib/mysql/
docker exec -it mysql01 mysql  --defaults-extra-file=/var/lib/mysql/dbRootConfig.cnf -e 'source /var/lib/mysql/db_v3.sql' 2>/dev/null
docker exec -it mysql01 mysql  --defaults-extra-file=/var/lib/mysql/dbRootConfig.cnf -e 'source /var/lib/mysql/set_user.sql' 2>/dev/null
