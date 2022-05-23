FROM golang:alpine AS builder

WORKDIR /usr/src/app/
COPY . /usr/src/app/

RUN go mod init GoViolin
RUN go build


FROM alpine AS app

WORKDIR /app

COPY --from=builder /usr/src/app/GoViolin /app/GoViolin
COPY --from=builder /usr/src/app/css/ /app/css/
COPY --from=builder /usr/src/app/img/ /app/img/
COPY --from=builder /usr/src/app/mp3/ /app/mp3/
COPY --from=builder /usr/src/app/templates/ /app/templates/

CMD ["./GoViolin"]
