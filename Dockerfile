FROM alpine:3.7

ENV DOCUMENT_ROOT /var/www/html
ENV SUPERVISORD_CONF_DIR /etc/supervisord/
ENV DAEMON_USER "node"
ENV DAEMON_GROUP "node"

### Add ssmtp, nodejs, bash, git & upgrade npm
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && apk add --no-cache ssmtp nodejs bash git chromium@edge nss@edge && npm i npm@latest -g && npm i supervisor && sed -ri 's@^mailhub=mail$@mailhub=127.0.0.1@' /etc/ssmtp/ssmtp.conf

### Add supervisord
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/bin/supervisord
RUN mkdir /etc/supervisord
COPY supervisord_conf/ /etc/supervisord/
ADD run.sh /

# Fixing timezone
ADD localtime /etc/localtime

EXPOSE 3000
EXPOSE 9001

ENTRYPOINT ["/run.sh"]
