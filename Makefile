generate:
	@go generate ./...
.PHONY: generate

build: generate
	@echo "====> Build resize-cli cli"
	@go build -o ./bin/resize-cli main.go
.PHONY: build

release:
	@echo "====> Build and release"
	@go get github.com/goreleaser/goreleaser
	@goreleaser
.PHONY: release

test:
	@go test ./...
.PHONY: test

test.cov:
	@go test ./... -coverprofile=coverage.txt -covermode=atomic
.PHONY: test.cov
