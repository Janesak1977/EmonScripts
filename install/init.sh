#!/bin/bash

user=$USER
openenergymonitor_dir=/opt/openenergymonitor
emoncms_dir=/opt/emoncms

sudo apt-get update -y
sudo apt-get install -y git-core

sudo mkdir $openenergymonitor_dir
sudo chown $user $openenergymonitor_dir

sudo mkdir $emoncms_dir
sudo chown $user $emoncms_dir

cd $openenergymonitor_dir

git clone https://github.com/Janesak1977/EmonScripts.git
cd $openenergymonitor_dir/EmonScripts
git checkout stable

cd $openenergymonitor_dir/EmonScripts/install
./main.sh
cd

rm init.sh
