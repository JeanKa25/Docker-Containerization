#!/bin/bash

# Export the wiki database
/usr/bin/docker exec wiki-mysql-db mysqldump -uroot -padmin12345 mysql_db> /path/to/desired/directory/backup_$(/usr/bin/date +%Y%m%d).sql

# Export the mantis database
/usr/bin/docker exec mantis-mysql-db mysqldump -uroot -padmin12345 mysql_db> /path/to/desired/directory/backup_$(/usr/bin/date +%Y%m%d).sql

# Export the Graylog MongoDB
/usr/bin/docker exec mongodb mongodump --archive=/data/db/mongo_backup.gz --gzip
/usr/bin/docker cp mongodb:/data/db/mongo_backup.gz /path/to/desired/directory
