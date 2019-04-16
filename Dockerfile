FROM debian:buster AS builder
MAINTAINER acmodeu <acmodeu@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install qbittorrent-nox -y
RUN apt-get clean

VOLUME [ "/data" , "/qbconfig" ]

#EXPOSE 9091 60007 60007/udp

ENV PUID=1000 PGID=1000

RUN groupadd "${PGID}"
RUN useradd -r -u "${PUID}" -g "${PGID}" appuser
RUN chown "${PUID}:${PGID}" /data
RUN chown "${PUID}:${PGID}" /qbconfig
USER appuser

ENTRYPOINT \
  /usr/bin/qbittorrent-nox --profile=/qbconfig

