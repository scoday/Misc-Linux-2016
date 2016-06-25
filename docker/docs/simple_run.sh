#!/bin/bash
#
# Use this file to generate a docker image/command we'll see where it goes for now.
# If you have questions or comments scoday@gmx.com
# Template:  
# docker run -t -i 9bdb5101e5fc /bin/bash -l

UBUNTU=
CENTOS=

ubuntu() {
    docker run -t -i $UBUNTU $COMMAND
}

centos() {
    docker run -t -i $CENTOS $COMMAND
}

# Take input
input() {
    echo -n "Which image would you like to run (centos/ubuntu): "
      read answer1
        if echo "$answer1" | grep iq "^ce" ; then
	    centos
      

#ubuntu
#centos
