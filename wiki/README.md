# MediaWiki

A container that runs MediaWiki using Docker.

## Starting The Container

This command runs a MediaWiki container using docker-compose based on the mediawiki official image from dockerhub.

```
$ docker-compose up -d
```

Import the data from the wiki.sql file.

```
docker exec -it mysql-db /bin/bash -c "mysql -f -uroot -p mysql_db</wiki.sql"
```
This is good if you want to use the same LocalSettings.php file as in https://dtmgmt.cmc.ec.gc.ca/wiki/index.php/Main_Page, but it's also possible to generate a new LocalSettings.php by following the instructions in this section.

### Running The Docker Container Locally

Run the following command to map the port from the ssh server to your local machine.

```
$ssh -L 8080:localhost:8080 ssh-username@ssh-server
```

Note that you can use different port mappings based on the ports argument inside of the docker-compose.yml file.
For example, if the ports variable inside the docker-compose.yml is "ports: - 8081:80", then run "ssh -L 8081:localhost:8081" instead.

After running this command successfully, MediaWiki should be running on localhost:8080 (or whatever port mapping used in the command above)

### Setting up a New LocalSettings.php file

Setup the database based on the values described in the mysql container inside of the docker-compose.yml file.
This step is important when running the wiki container for the first time to connect to the database container.

These are the values set in the docker-compose file in this repository. 
Feel free to change these values but it's important to note that the values inside the docker-compose file and the database setup page must match.

| Field                                       | Value				      |
| ------------------------------------------- |:-------------------------------------:|
| Database host                               | wiki-mysql-db [name of the container] |
| Database name (no hyphens)                  | mysql_db [MYSQL_DATABASE]	      |
| Database table prefix                       | "" (optional)			      |
| Database username                           | admin [MYSQL_USER]                    |
| Database password                           | database_pass [MYSQL_PASSWORD]        |
| Name of wiki                                | Dadt wiki                             |
| Your username                               | root (can be something different)     |
| Password                                    | admin12345 [MYSQL_ROOT_PASSWORD]      |

Go through the installation process then download the LocalSettings.php file and add it to the directory where the docker-compose.yml file is located.
Uncomment the following line in the docker-compose.yml to include the LocalSettings into the new container:
```
volumes:
  - ./LocalSettings.php:/var/www/html/LocalSettings.php
```

Alternatively, you can execute the following command to copy the LocalSettings file straight into the container instead of using a mount bind:
```
docker cp LocalSettings.php mediawiki:/var/www/html
```

Run the following commands to shutdown the container and turn it on again.
```
docker-compose down
docker-compose up -d
```
Refresh the web page and the MediaWiki website setup should be complete.

## Data Transformation

To import a database called "wiki.sql", run the following commands:
```
docker cp wiki.sql mysql-db:/wiki.sql
docker exec -it mysql-db /bin/bash -c "mysql -f -uroot -p mysql_db</wiki.sql"
```

To transfer data between two databases, you can use the phpmyadmin container. 
Make sure to use MYSQL_USER and MYSQL_PASSWORD from the docker-compose file for the username and password respectively.

Note: It's possible to run a database container separately and connect it to the wiki container as long as they're both connected to the same network.
To transfer data between two databases, you can use phpmyadmin service.
