FROM alpine:3.18

LABEL "maintainer"="https://github.com/VoyNaLunu"
LABEL "version"="0.1"

WORKDIR /app/

RUN apk update \
    && \
    apk add --no-cache \
    bash \
    openssh-server \
    && \
    rm -rf /var/cache/apk/*

COPY ./sftp.conf /etc/ssh/sshd_config.d/
COPY . .

EXPOSE 8022
ENTRYPOINT ./entrypoint.sh
