#!/bin/bash

date


#################################################################
# Install all missing packages for LUX on ubuntu19.10	        #
#################################################################
cd depends/libboost/
wget https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz
tar -zxvf boost_1_65_1.tar.gz
cd boost_1_65_1/
./bootstrap.sh
./b2

cd stage/lib

sudo cp libboost_system.so.1.65.1 /usr/lib/
sudo cp libboost_filesystem.so.1.65.1 /usr/lib/
sudo cp libboost_program_options.so.1.65.1 /usr/lib/ 
sudo cp libboost_thread.so.1.65.1 /usr/lib/
sudo cp libboost_random.so.1.65.1 /usr/lib/
sudo cp libboost_chrono.so.1.65.1 /usr/lib/

cd ../../../../
cd libqrencode.so.3

sudo cp libqrencode.so.3 /usr/lib/

cd ..
cd libprotobuf10

sudo cp libprotobuf.so.10 /usr/lib/

cd ..
cd libminiupnpc-10
sudo cp libminiupnpc.so.10 /usr/lib/

while true; do
    read -p "clean package build files to save space? (recommended)" yn
    case $yn in
        [Yy]* ) sudo rm -r depends; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
