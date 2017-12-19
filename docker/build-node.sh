#!/bin/sh
docker build --rm -t filebot-rpi:node -f Dockerfile.node . && docker run -it -v $PWD:/volume1 -v data:/data -p 5452:5452 filebot-rpi:node
