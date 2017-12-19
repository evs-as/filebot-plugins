#!/bin/sh
docker build --rm -t filebot-rpi:latest -f Dockerfile . && docker run -it -v $PWD:/volume1 -v data:/data filebot-rpi:latest -script fn:sysinfo
