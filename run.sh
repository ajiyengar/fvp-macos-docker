#!/usr/bin/env bash

mkdir -p ~/dockerhome
# Add any modules to be run on FVP in ~/dockerhome on host

docker run -it -e DISPLAY=docker.for.mac.host.internal:0 -v ~/dockerhome:/home -w /home fvp:11.27.19

exit
