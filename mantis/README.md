# Mantis

A container that runs Mantis Bug Tracker using Docker.

## Starting The Container

This command executes an instance of mantisbt using docker-compose based on the mantisbt image in the Dockerfile.

```
$ docker-compose up -d
```

Import the data from the mantis.sql file.

```
$ docker exec -it mantis-mysql-db /bin/bash -c "mysql -f -uroot -p mysql_db</mantis.sql"
```

Then press on connect database and set the admin file inside the container to 000, by running:
```
$ docker exec -it mantis bash
$ chmod 000 admin
```

### Running The Docker Container Locally

Run the following command to map the port from the ssh server to your local machine.

```
$ssh -L 8989:localhost:8989 ssh-username@ssh-server
```

Note that you can use different port mappings based on the ports argument inside of the docker-compose.yml file.
For example, if the ports variable inside the docker-compose.yml is "ports: - 8080:80", then run "ssh -L 8080:localhost:8080" instead.

After running this command successfully, MantisBT should be running on localhost:8989 (or whatever port mapping used in the command above)

### First time setup

Setup the database based on the values described in the mysql container inside of the docker-compose.yml file.
This step is important when running the Mantis container for the first time to connect to the database container.

These are the values set in the docker-compose file in this repository. 
Feel free to change these values but it's important to note that the values inside the docker-compose file and the database setup page must match.

| Field                                          | Value                            	  |
| ---------------------------------------------- |:--------------------------------------:|
| Hostname (for Database Server)                 | mantis-mysql-db [name of the container]|
| Username (for Database)                        | root [can be different]          	  |
| Password (for Database)                        | admin12345 [MYSQL_ROOT_PASSWORD]  	  |
| Database name (for Database)                   | mysql_db [MYSQL_DATABASE]        	  |
| Admin Username (to create Database if required)| admin [MYSQL_USER]               	  |
| Admin Password (to create Database if required)| database_pass [MYSQL_PASSWORD]    	  |
| Database Table Prefix                          | mantis                           	  |
| Database Plugin Table Prefix                   | plugin                           	  |
| Database Table Suffix                          | _table                           	  |

Finally, click on "Continue" to mark the completion of the installation and proceed to the login page.

## Data Transformation

To import a database called "mantis.sql", run the following commands:
```
docker cp mantis.sql mysql-db:/mantis.sql
docker exec -it mantis-mysql-db /bin/bash -c "mysql -f -uroot -p mysql_db</mantis.sql"
```

To transfer data between two databases, you can use the phpmyadmin container. 
Make sure to use MYSQL_USER and MYSQL_PASSWORD from the docker-compose file for the username and password respectively.

Note: It's possible to run a database container separately and connect it to the mantis container as long as they're both connected to the same network.
To transfer data between two databases, you can use phpmyadmin service.
