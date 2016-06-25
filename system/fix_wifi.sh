#!/bin/bash
# This script is built to fix the wifi after a Fedora Update. :)
#

DIR=/home/scoday/Downloads/SYSTEM/
HYBRID=/home/scoday/Downloads/SYSTEM/hybrid

get_dir() {
    cd $DIR
    pwd
}

get_hybrid() {
    cd $HYBRID
    pwd
}

make_hybrid() {
    make
}

make_install() {
    make install 
}

depmods() {
    depmod -a
    rmmod b43 ssb bcma
    modprobe wl
}

get_dir
get_hybrid
make_hybrid
make_install
depmods
