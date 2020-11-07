#!/bin/bash
F_HOME=work/csgo_srv

if [ -d $F_HOME ] 
then
   rm -rf $F_HOME
fi
mkdir -p $F_HOME && cd $F_HOME
curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C . -xvz
bash ./steamcmd.sh +runscript ../../csgo_ds.txt
