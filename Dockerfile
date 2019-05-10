FROM alpine:edge

MAINTAINER acmodeu <acmodeu@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update

RUN apk add --no-cache qbittorrent-nox su-exec

VOLUME [ "/data" , "/qbconfig" ]

#EXPOSE 8080 60007 60007/udp

ENV PUID=1000 PGID=1000

ENTRYPOINT \
  chown "${PUID}:${PGID}" /qbconfig \
  && chown "${PUID}:${PGID}" /data \
  && su-exec "${PUID}:${PGID}" \
    qbittorrent-nox --profile=/qbconfig
