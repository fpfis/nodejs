FROM ubuntu:18.04

ENV NODE_MAJOR_VERSION="8" NODE_DOCUMENT_ROOT="/opt/nodejs/" NODE_FILE="server.js"
ENV SUPERVISOR_LOG_PATH="/var/log/" SUPERVISOR_CONF_DIR="/etc/supervisor/" SUPERVISORCTL_USER="admin" SUPERVISORCTL_PASS="password" DEBIAN_FRONTEND="noninteractive"

RUN env

### Configure repository/timezone / adding ssmtp/defaults deps
RUN apt-get update && apt-get install cronolog tzdata ssmtp git curl supervisor ca-certificates gnupg -y && sed -ri 's@^mailhub=mail$@mailhub=127.0.0.1@' /etc/ssmtp/ssmtp.conf && ln -fs /usr/share/zoneinfo/Europe/Brussels /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

### Add nodejs, chromium, node-supervisor & upgrade npm
RUN source /usr/lib/os-release && curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && echo -e "deb https://deb.nodesource.com/node_${NODE_MAJOR_VERSION}.x ${VERSION_CODENAME} main\ndeb-src https://deb.nodesource.com/node_${NODE_MAJOR_VERSION}.x ${VERSION_CODENAME} main" > /etc/apt/sources.list.d/nodesource.list && apt-get update && apt-get install nodejs chromium-browser libnss3 -y && npm i npm@latest supervisor -g && apt-get clean all && rm -rf /var/lib/apt/lists/*

### Add supervisord
COPY conf/supervisor/ /etc/supervisor/
ADD run.sh /

EXPOSE 3000
EXPOSE 9001

ENTRYPOINT ["/run.sh"]
