# nodejs/release-webtools
[![build status](https://drone.fpfis.eu/api/badges/fpfis/nodejs/status.svg?branch=release/8-wt)](https://drone.fpfis.eu/fpfis/nodejs) [![last commit](https://img.shields.io/github/last-commit/fpfis/nodejs/release/8-wt.svg)](https://github.com/fpfis/nodejs/tree/release/8-wt) [![image size](https://img.shields.io/microbadger/image-size/fpfis/nodejs/8-wt.svg)](https://cloud.docker.com/u/fpfis/repository/docker/fpfis/nodejs/tags) [![layer](https://img.shields.io/microbadger/layers/fpfis/nodejs/8-wt.svg)](https://cloud.docker.com/u/fpfis/repository/docker/fpfis/nodejs/tags)

## Description
* Ubuntu 18.04
* Nodejs 10
* Supervisord

## Variables
### Nodejs
| Variable           | Description                    |  Default
|--------------------|--------------------------------|---------------------
|`NODE_MAJOR_VERSION`|Version to install              |`10`
|`NODE_DOCUMENT_ROOT`|Node source path                |`/opt/nodejs/`
|`NODE_FILE`         |Node server file                |`server.js`
|`NODE_ERROR_LOG`    |Error log path                  |`/var/log/node.err`
|`NODE_IGNORE_FILES` |Ignore files for node-supervisor|`cache`
### Supervisor
| Variable                  | Description|  Default
|---------------------------|------------|------------------
|`SUPERVISOR_LOG_PATH`      |log path    |`/var/log/`
|`SUPERVISOR_CONF_DIR`      |conf path   |`/etc/supervisor/`
|`SUPERVISORCTL_LISTEN_PORT`|Listen Port |`9002`
|`SUPERVISORCTL_USER`       |GUI user    |`admin`
|`SUPERVISORCTL_PASS`       |GUI password|`password`
