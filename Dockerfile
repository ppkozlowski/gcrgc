FROM golang:alpine as build

WORKDIR /go/src/github.com/ppkozlowski/gcrgc
COPY . .

RUN go build -o bin/gcrgc cmd/gcrgc/gcrgc.go

FROM alpine

COPY --from=build /go/src/github.com/ppkozlowski/gcrgc/bin/gcrgc /usr/local/bin/gcrgc
