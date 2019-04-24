FROM golang:1.11
COPY . /go/src/github.com/andrebriggs/spartan-app
WORKDIR /go/src/github.com/andrebriggs/spartan-app/
RUN go get -v -t -d ./...
RUN go get -u github.com/golang/dep/cmd/dep && dep init && dep ensure
RUN CGO_ENABLED=0 go build -o bin/spartan-app

FROM alpine:3.7
RUN apk add --no-cache ca-certificates
COPY --from=0 /go/src/github.com/andrebriggs/spartan-app/bin .
ENTRYPOINT ["./spartan-app"]