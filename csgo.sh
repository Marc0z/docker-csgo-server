#!/bin/sh
cd $SERVER
csgo/srcds_run -game csgo -tickrate 128 -autoupdate -steam_dir /var/srv -steamcmd_script /var/srv/csgo_ds.txt $@
