#!/bin/sh
docker build --rm -t filebot-rpi:watcher -f Dockerfile.watcher . && mkdir -p input output && docker run -it -v $PWD:/volume1 -v data:/data filebot-rpi:watcher /volume1/input --output /volume1/output
