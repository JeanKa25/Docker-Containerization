# Munin

A container that runs Munin using Docker.

## Starting The Container

This command runs a Munin container using docker-compose based on the image created by the Dockerfile.

```
$ docker-compose up -d
```

Now the container should be running on the Linux server on the port specified in the docker-compose.yml file. 

### Running The Docker Container Locally

Run the following command to map the port from the ssh server to your local machine.

```
$ ssh -L 8081:localhost:8081 ssh-username@ssh-server
```

Note that you can use different port mappings based on the ports argument inside of the docker-compose.yml file.
For example, if the ports variable inside the docker-compose.yml is "ports: - 8080:80", then run "ssh -L 8080:localhost:8080" instead.

After running this command successfully, Munin should be running on localhost:8081/munin (or whatever port mapping used in the command above)

## Notes

Modify the munin-conf file to make any changes to the configuration files.

Graphs are generated every 5 minutes by default using munin, but you can generate the graphs right away through the "munin-cron" command.
To generate graphs run the following commands:

```
$ docker exec -it munin bash
$ su - munin --shell=/bin/bash
$ munin-cron
```

