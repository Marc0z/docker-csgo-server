#!/bin/bash
docker run -it \
 --rm \
 --name csgo-server-container \
 -p 27015:27015 \
 -p 27015:27015/udp \
 -v $(pwd)/work/:/var/srv/ \
 -v $(pwd)/csgo.sh:/var/srv/csgo.sh \
 -v $(pwd)/autoexec.cfg:/var/srv/csgo/csgo/cfg/autoexec.cfg \
 -v $(pwd)/server.cfg:/var/srv/csgo/csgo/cfg/server.cfg \
 csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2