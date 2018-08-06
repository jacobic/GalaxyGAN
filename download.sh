#!/bin/bash
DIR=$(pwd)
DATA_DIR=$USER/GalaxyGAN/data
mkdir -p /u/$DATA_DIR
mkdir -p /ptmp/$DATA_DIR
cd /ptmp/DATA_DIR
wget https://share.phys.ethz.ch/~blackhole/spaceml/GalaxyGAN/fitsdata.tar.gz
tar -xvzf fitsdata.tar.gz
cd $DIR
ln -s /ptmp/$DATA_DIR /u/$DATA_DIR
