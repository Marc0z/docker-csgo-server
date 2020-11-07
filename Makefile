.PHONY: build
build:
	docker build -t gonzih/csgo-server .

.PHONY: push
push: build
	docker push gonzih/csgo-server

fetch_inplace:
	sh ./csgo_inplace.sh
