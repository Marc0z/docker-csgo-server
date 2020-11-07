FROM debian:bullseye-slim

ENV SERVER /var/srv

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl net-tools lib32stdc++6 locales \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

WORKDIR $SERVER
EXPOSE 27015
EXPOSE 27015/udp

ENTRYPOINT ["./csgo.sh"]
CMD ["-console" "-usercon" "+game_type" "0" "+game_mode" "1" "+mapgroup" "mg_active" "+map" "de_dust2"]
