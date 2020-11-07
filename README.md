## Counter Strike Global Offensive + Docker

# fork edit

Rewrote the project to fit my usecase. Cant handle multi gb docker images on server.

Docker - hybrid build
1) build the 154mb debian-slim docker image
```shell
docker build -f Dockerfile -t csgo .
```
2) prefetch and build the server files (its done without docker! builds to `./work` folder)
```shell
make build
```
3) binds volumes and runs the server.
as an example read `docker.sh` to run the container


[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/Marc0z/docker-csgo-server/blob/master/LICENSE.md)

CS:GO server in docker with 128 tick enabled by default.

### Details:
By default image is build with enabled autoupdate feature (take a look at `csgo.sh` file).
You can create new Dockerfile based on that image (FROM csgo) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

#ToDo Update
#Changes broke below commands

```shell
# Run image with default options (CMD in Dockerfile)
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo

# Run image with as Classic Casual server
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_cache

# Run image with as Classic Competetive server
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_cache

# Run image with as Arm Race server
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots

# Run image with as Demolition server
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_lake

# Run image with as Deathmatch server
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic +map de_dust

# To run lan server just add `+sv_lan 1` at end of command
# docker run -d -p 27015:27015 -p 27015:27015/udp csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_cache +sv_lan 1
```

### Running public server

To run public server you need to [Register Login Token](http://steamcommunity.com/dev/managegameservers) and adding `+sv_setsteamaccount THISGSLTHERE -net_port_try 1` to the server command.
Refer to [Docs](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Registering_Game_Server_Login_Token) for more details.
