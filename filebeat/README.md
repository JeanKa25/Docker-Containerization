# Filebeat

## Overview
This container runs Filebeat within Docker. Filebeat is an open-source tool used for sending logs from a server to Graylog.

## Starting The Container

This command runs a Filebeat container using docker-compose based on the image created by the Dockerfile.

```
$ docker-compose up -d
```

## Note

One of the downsides of running Filebeat as a Docker container is that Docker must be installed on the server where the logs are being sent.

Alternatively, Filebeat can also be deployed directly as a service on a server, without Docker. 
For automated deployment and configuration, consider using an Ansible script like the one in the filebeat-ansible file.

