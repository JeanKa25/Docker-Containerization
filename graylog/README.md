# Overview

A container that runs Graylog using Docker which is an open source log monitoring web application.
The docker-compose file is a mix of [graylog2 open-core](https://github.com/Graylog2/docker-compose/blob/main/open-core/docker-compose.yml) and [graylog2 docker install docs.](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)

## Starting The Container

This command executes an instance of Graylog using docker-compose based on the mantisbt image in the Dockerfile.

```
$ docker-compose up -d
```

### Running The Docker Container Locally

Run the following command to map the port from the ssh server to your local machine.

```
$ssh -L 9000:localhost:9000 ssh-username@ssh-server
```

Note that you can use different port mappings based on the ports argument inside of the docker-compose.yml file.
