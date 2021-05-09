#!/bin/bash
. env.env
echo $host
sed -i "s,http://[^\s]\+:3000/\?,http://$host:3000/,"  ./efww/src/main/resources/templates/index.html
