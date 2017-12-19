#!/bin/sh
mkdir -p $PWD/volume1
docker build --rm -t filebot-rpi -f Dockerfile . && docker run -it -v $PWD:/volume1 -v data:/data filebot-rpi -script fn:sysinfo
