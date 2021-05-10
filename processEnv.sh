#!/bin/bash
source env.env
sed -i "s,http://.*:3000/,http://$host:3000/,"  ./efww/src/main/resources/templates/index.html
grep 3000 ./efww/src/main/resources/templates/index.html
sed -i "s,password = \".*\",password = \"$dbRootPwd\"," ./static/database/dbRootConfig.cnf
grep "password =" ./static/database/dbRootConfig.cnf
sed -i "s,MYSQL_ROOT_PASSWORD=.* mysql,MYSQL_ROOT_PASSWORD=$dbRootPwd mysql," ./static/database/startDB.sh
grep "MYSQL_ROOT_PASSWORD=" ./static/database/startDB.sh
sed -i "s,EXISTS '.*',EXISTS '$dbUserName'," ./static/database/set_user.sql
sed -i "s,USER '.*'@'%',USER '$dbUserName'@'%'," ./static/database/set_user.sql
sed -i "s,TO '.*'@'%',TO '$dbUserName'@'%'," ./static/database/set_user.sql
sed -i "s,BY '.*';,BY '$dbUserPwd';,"  ./static/database/set_user.sql
cat ./static/database/set_user.sql
sed -i "s,    username: .*,    username: $dbUserName," ./efww/src/main/resources/application.yml
grep " username" ./efww/src/main/resources/application.yml
sed -i "s,    password: .*,    password: $dbUserPwd," ./efww/src/main/resources/application.yml
grep " password" ./efww/src/main/resources/application.yml
sed -i "s,    url: jdbc:mysql://.*:3306/faunaworld,    url: jdbc:mysql://mysql01:3306/faunaworld," ./efww/src/main/resources/application.yml
grep "url: jdbc" ./efww/src/main/resources/application.yml
