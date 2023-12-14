# Grafana

A container that runs Grafana using Docker.

## Starting The Container

This command executes an instance of Grafana using docker-compose based on the Grafana image in dockerhub: https://hub.docker.com/r/grafana/grafana.

```
$ docker-compose up -d
```

Now the container should be running on the Linux server on the port specified in the docker-compose.yml file. 

### Running The Docker Container Locally

Alternatively you can run the following command to map the port from the ssh server to your local machine.

```
$ ssh -L 3000:localhost:3000 ssh-username@ssh-server
```

Note that you can use different port mappings based on the ports argument inside of the docker-compose.yml file.
For example, if the ports variable inside the docker-compose.yml is "ports: - 8080:3000", then run "ssh -L 8080:localhost:8080" instead.

After running this command successfully, Grafana should be running on localhost:3000 (or whatever port mapping used in the command above)

## Data Transformation

It's possible to add data sources through going to the data sources page and pressing on "add new data source".

Note: to add an influxdb container as a data source, set the URL of the data source to http://influxdb-container-name:8086.
