# syntax=docker/dockerfile:1

FROM golang:1.17-alpine

WORKDIR /app

COPY *.go ./

EXPOSE 8080

CMD [ "go run main.go" ]
