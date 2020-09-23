#!/bin/sh
#
# run into an openstackclient container
# This script can access script for creating Jenkins-slave VM
# 

sudo docker run -it --network host --env-file /tmp/adminrc.env \
  -v ${PWD}:/home/openstackclient/scripts \
  -v ${PWD}/bin:/home/openstackclient/bin \
  docker.io/sktdev/openstackclient:stein \
  bash -c 'export PATH=$PATH:/home/openstackclient/bin; bash'
