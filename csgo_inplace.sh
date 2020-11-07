#!/bin/bash
# This script builds the CSGO server in project folder so it can be used as a volume bind

F_HOME=work/

if [ -d $F_HOME ] 
then
   echo "'work' folder present, remove it completely before proceeding"
   echo "CAUTION, removing will require to download the whole server again!"
   exit
fi
mkdir -p $F_HOME && cd $F_HOME
curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C . -xvz
bash ./steamcmd.sh +runscript ../csgo_ds.txt
