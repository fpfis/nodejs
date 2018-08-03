#!/bin/bash
set -e

# Get uid for the current docroot
[ -z "${WORKDIR}" ] && export WORKDIR=/var/www/html

# Check if docroot or parent exists :
[ -d "${WORKDIR}" ] && export REF_DIR=${WORKDIR}
# Else use its parent
[ -z "${REF_DIR}" ] && export REF_DIR=$(dirname ${WORKDIR})

# Get our command to run
export CMD="${@}"

if [ -z "${CMD}" ]; then
  # If no run command provided, run supervisor as root a:
  /usr/bin/supervisord -c /etc/supervisord/supervisord.conf
else
  # Run the command as user web
  if ! `grep -q nodejs /etc/passwd`
  then
    eval "${CMD}"
  else
    HOME=/tmp su -s /bin/bash -c "${CMD}" nodejs
  fi
fi
