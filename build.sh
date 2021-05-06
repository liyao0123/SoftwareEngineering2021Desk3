#!/bin/sh
mvn -f efww/pom.xml clean
mvn -f efww/pom.xml package
docker build -t efww .
docker run -it --name fauna -d -p 80:8080 efww
