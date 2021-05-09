#!/bin/sh
(docker build -t efww -f efwwDockerfile .)
(docker run -it --name fauna -d -p 80:8080 efww)

(docker build -t earth -f earthDockerfile .)
(docker run -it --name earth -d -p 3000:80 earth)
