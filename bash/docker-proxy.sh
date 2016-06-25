#!/bin/bash 
#
# This script is to basically move the docker proxy
# back into place so on the internal HP network you 
# can search, pull, etc..
# Steps:
# 1.) MV proxy to /etc/systemd/system/docker.service.d/http-proxy.conf
# 2.) Reload systemctl daemon
# Backout Steps:
# 1.) MV proxy from above to dev/docker/proxy/
# 2.) Reload systemctl daemon
#----------------------------------------------------------#
BKUPDIR=/home/scoday/scoday/Documents/dev/docker/configs/proxy
PRODDIR=/etc/systemd/system/docker.service.d/
FILENAME=http-proxy.conf
DATE=`date +%Y%m%d`


enable() {
    mv $BKUPDIR/docker.service.d $PRODDIR 
    systemctl daemon-reload
}

disable() {
    mv $PRODDIR $BKUPDIR 
    systemctl daemon-reload
}

gather_requirements() {
clear
# Take an input:
    echo -n "**MUST BE RUN AS SUDO: Do you want to enable or disable proxy for docker at this time? "
      read answer
        if echo "$answer" | grep -iq "^en" ; then
            enable
        exit 3
        elif echo "$answer" | grep -iq "^dis"; then
           disable
        exit 1
      fi
}

gather_requirements

