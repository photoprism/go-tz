.PHONY: all fmt mapshaper generate build test tidy dep-list dep-upgrade fmt-imports fmt-go;
.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell

export GO111MODULE=on

HASRICHGO := $(shell which richgo)

ifdef HASRICHGO
    GOTEST=richgo test
else
    GOTEST=go test
endif

all: mapshaper generate build test
fmt: fmt-imports fmt-go
mapshaper:
	sudo npm install -g mapshaper@latest
generate:
	go generate ./tz/...
	go fmt ./tz/...
build:
	go build -v ./tz/...
test:
	$(info Running all Go unit tests...)
	$(GOTEST) -parallel 1 -count 1 -cpu 1 -tags slow -timeout 20m ./tz/...
tidy:
	go mod tidy
dep-list:
	go list -u -m -json all | go-mod-outdated -direct
dep-upgrade:
	go get -u -t ./tz/...
fmt-imports:
	goimports -w tz
fmt-go:
	go fmt ./tz/...
