FROM golang:alpine as builder

RUN apk update && apk add git

WORKDIR /go/src/app

COPY . .

RUN go mod init bmannramos/desafio-docker-go

RUN CGO_ENABLED=0 go build -ldflags="-s -w"

FROM scratch

WORKDIR /home

COPY --from=builder /go/src/app/ .

CMD ["./desafio-docker-go"]