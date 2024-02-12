FROM golang:1.17-alpine AS builder

WORKDIR /go/src/app

RUN go mod init example/hello

COPY main.go .

RUN go build -ldflags "-s -w" -o app .

FROM scratch

COPY --from=builder /go/src/app/app /app

CMD ["/app"]
