#!/bin/bash

cd ../grafana
docker-compose up -d

cd ../graylog
docker-compose up -d
#Importing the Graylog's MongoDB
#docker cp /path/to/desired/directory/mongo_backup.gz mongodb:/data/db/mongo_backup.gz
#docker exec mongodb mongorestore --archive=/data/db/mongo_backup.gz

cd ../mantis
docker-compose up -d
#Importing the mantis database
#docker exec -it mantis-mysql-db /bin/bash -c "mysql -f -uroot -p$1 mysql_db</mantis.sql"

cd ../munin
docker-compose up -d

cd ../wiki
docker-compose up -d
#Importing the wiki database
#docker exec -it wiki-mysql-db /bin/bash -c "mysql -f -uroot -p$1 mysql_db</wiki.sql"
