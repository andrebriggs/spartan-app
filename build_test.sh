set -e

go get -v -t -d ./...
go get -u github.com/golang/dep/cmd/dep && dep init && dep ensure

go test -v -coverprofile spartan-coverage.out . 

export CGO_ENABLED=0
go build -o bin/spartan-app
