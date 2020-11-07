.PHONY: build
build:
	docker build -t gonzih/csgo-server .

.PHONY: push
push: build
	docker push gonzih/csgo-server

fetch_inplace:
	curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C . -xvz \
	./steamcmd.sh +runscript csgo_ds.txt 