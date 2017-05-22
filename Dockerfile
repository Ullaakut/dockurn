FROM alpine:latest
MAINTAINER Brendan Le Glaunec <brendan.le-glaunec@epitech.eu>

ENV COTURN_VERSION 4.5.0.6
RUN apk add --no-cache --update bash curl git make build-base automake autoconf readline readline-dev gettext libcrypto1.0 openssl openssl-dev libevent libevent-dev linux-headers jq

RUN git clone --branch ${COTURN_VERSION} https://github.com/coturn/coturn /tmp && \
    cd /tmp && \
    ./configure --prefix=/turn && \
    make install && \
    rm -rf /tmp && \
    apk del linux-headers libevent-dev openssl-dev readline-dev automake autoconf build-base make git && \
    rm -rf /var/cache/apk/*

WORKDIR /turn/bin

RUN chmod +x turnserver

# STUN/TURN
EXPOSE 3478:3478/udp
EXPOSE 3478:3478/tcp

# STUN/TURN ALT
EXPOSE 3479:3479/udp
EXPOSE 3479:3479/tcp

# STUN/TURN DTLS & TLS
EXPOSE 5349:5349/udp
EXPOSE 5349:5349/tcp

# STUN/TURN DTLS & TLS ALT
EXPOSE 5350:5350/udp
EXPOSE 5350:5350/tcp

# TURN RELAY MEDIA PORTS
EXPOSE 49152:65535/udp

ENTRYPOINT ["/turn/bin/turnserver"]
