FROM debian:bullseye-slim

ENV SERVER /var/srv

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl net-tools lib32stdc++6 locales \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
    # && useradd $USER \
    # && mkdir $HOME \
    # && chown $USER:$USER $HOME \
    # && mkdir $SERVER

WORKDIR $SERVER
ADD ./csgo_ds.txt .
ADD ./update.sh .
# ADD ./autoexec.cfg $SERVER/csgo/csgo/cfg/autoexec.cfg
# ADD ./server.cfg $SERVER/csgo/csgo/cfg/server.cfg
ADD ./csgo.sh .

# RUN chown -R $USER:$USER $SERVER

# USER $USER
# RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz \
#     && $SERVER/update.sh

EXPOSE 27015/udp

ENTRYPOINT ["./csgo.sh"]
CMD ["-console" "-usercon" "+game_type" "0" "+game_mode" "1" "+mapgroup" "mg_active" "+map" "de_dust2"]
