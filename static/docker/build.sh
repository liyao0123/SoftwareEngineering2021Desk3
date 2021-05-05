#!/bin/sh
docker build -t efww .
docker run -it --name fauna -d -p 80:8080 efww 
