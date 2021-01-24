.PHONY: all deps build

KRAKEND_VERSION=$(shell git describe --always --long --dirty --tags)
BIN_NAME=gateway

all: deps build

deps:
	go get "github.com/devopsfaith/krakend/config"
    go get "github.com/devopsfaith/krakend/logging"
    go get "github.com/devopsfaith/krakend/proxy"
    got get "github.com/devopsfaith/krakend/router/gin"

build:
	go build -a -ldflags="-X github.com/devopsfaith/krakend/core.KrakendVersion=${KRAKEND_VERSION}" -o ${BIN_NAME}
	@echo "You can now use ./${BIN_NAME}"