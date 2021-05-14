## Details about the deployment procedures:
1. In the first step, the source code was downloaded from github. Alternatively, you can use wget to download the source code and unzip it if you don't have git installed in your linux system. And since you have docker installed, you must have Linux system even if you use windows system, no matter WSL 2 backend docker desktop or hyper-V backend docker desktop.

2. In the second step, the current working directory was changed into the application folder. This procedure is necessary because the deployment script use path relative to the application folder.

3. In the third step, you can modify the variables defined in [env.env](/application/env.env), including mysql root password, mysql new user name, mysql new user password and the host where you want the application run. It's recommended to modify the password to some complicated alphanumeric combination for the sake of security. Set the host to an ip address or domain name if you want deploy the application in a remote serve or leave it as localhost if you want test it locally.

4. In the last step, a bash script [build.sh](/application/build.sh) was excuted which contain all the deploy command.
  - 4.1. Firstly, a docker network "efww-network" was create. It's used for the comunication between mysql container and game container.
  - 4.2 Then, a bash script [processEnv.sh](/application/processEnv.sh) was invoked. This script read variables from file env.env and use sed to modify the related files.
  - 4.3 A bash script [startDB.sh](/application/static/database/startDB.sh) was invoked. This script can initialize the mysql container.
    - 4.3.1  It create a volume mysql_data for persistent storage.
    - 4.3.2  Docker image mysql:5.7 was used. Network was specified as "efww-network" which was created in previous command. The container name was specified as mysql01. Password for mysql root user defined in file env.env was used. The default port 3306 was used in docker port mapping, i.e. 3306 to 3306. The previously created volume mysql_data was mounted to /var/lib/mysql.
    - 4.3.3 Command sleep was used to wait the mysql container up. There are more intelligent and complicated methods to achieve this, but we just use a simple way.
    - 4.3.4 SQL scripts were copied into the mysql container, so was the file dbRootConfig. The SQL script [db_v3.sql](/application/static/database/db_v3.sql) contains the command to create database, create table  and insert value into the table. The SQL script [set_user.sql](/application/static/database/set_user.sql) contains the command to create new user and grant the previous created database to the new user.

      The password for mysql root was written in file [dbRootConfig.cnf](/application/static/database/dbRootConfig.cnf), so we can use this file to run mysql script instead of hard coding root password in bash script. The information defined in file env.env was used to update the mysql password for root and new user, along with the new user name.
    - 4.3.5 Using command docker exec to execute command inside mysql container. The SQL scripts mentioned in previous step were used to initialize the database.
  - 4.4 A docker image for the game serve was build according to the docker file [efwwDockerfile](/application/efwwDockerfile).
    - 4.4.1 We use the image java:8 as basis.
    - 4.4.2 We added a VOLUME pointing to "/tmp" because that is where a Spring Boot application creates working directories for Tomcat by default. The effect is to create a temporary file on your host under "/var/lib/docker" and link it to the container under "/tmp".
    - 4.4.3 We copied the folder "efww" to the game image. We will compile the source code inside the container.
    - 4.4.4 We copied the maven binary folder to the game image because java:8 doesn't contain maven orginally.
    - 4.4.5 We copied the script [startEfww.sh](/application/startEfww.sh) to the game image. The script is what we will run to start the game container.
    - 4.4.6 By default, Spring Boot applications run on an embedded Tomcat via port 8080, so we need to expose the port 8080.
    - 4.4.7 We run the script [startEfww.sh](/application/startEfww.sh).
      - 4.4.7.1 We add the maven to environment path.
      - 4.4.7.2 We change directory  into the folder "efww" . The command `mvn clean` will delete the /target folder. The command `mvn package` will convert the .java source code into a .jar file and puts it into the /target folder.
      - 4.4.7.3 The command `mvn package` will test the connection to the mysql sever so this procedure was executed after mysql was set up. Besides, this step will download dependencies defined in the pom.xml, so this step may take a while. Then we change the working directory back.
      - 4.4.7.4 We copied the packaged jar to the root folder and rename it as app.jar
      - 4.4.7.5 We executed the command `touch app.jar`. It used to be the case that the modification time was 0. Maybe that was a bug in docker and they fixed it. We used to have a bigger base image as well, so the extra layer wasn't as important.
      - 4.4.7.6 We leaved the environment variable JAVA_OPTS as empty and executed the jar.
 - 4.5 We run a container according to the images we build. The network was specified as "efww-network" which is the same as the mysql container. Actually, it may take about 3 minutes for the container up because the `mvn package` command runs at this stage, it takes time for downloading dependencies and compiling.
 - 4.6 We build a docker image for the dynamic earth.

   - 4.6.1 We use the image nginx:1.20.0-alpine as basis.
   - 4.6.2 We copy the code for dynamic earth into the image.
 - 4.7 We run a container for dynamic earth. The default port for nginx is 80. We mapped it to port 3000 while running.

In conclusion, there will be 3 containers: Mysql database container, game container and dynamic earth container.
Enjoy!
