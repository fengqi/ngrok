.PHONY: default server client clean all release-all assets client-assets server-assets contributors
export GOPATH:=$(shell pwd)

BUILDTAGS=debug
default: all

server:
	go build -o bin/ngrokd -tags '$(BUILDTAGS)' pkg/main/ngrokd/ngrokd.go

client:
	go build -o bin/ngrok -tags '$(BUILDTAGS)' pkg/main/ngrok/ngrok.go

release-client: BUILDTAGS=release
release-client: client

release-server: BUILDTAGS=release
release-server: server

release-all: release-client release-server

all: client server

clean:
	rm -rf bin/*

contributors:
	echo "Contributors to ngrok, both large and small:\n" > CONTRIBUTORS
	git log --raw | grep "^Author: " | sort | uniq | cut -d ' ' -f2- | sed 's/^/- /' | cut -d '<' -f1 >> CONTRIBUTORS
