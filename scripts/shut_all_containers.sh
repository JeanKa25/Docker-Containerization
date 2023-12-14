#!/bin/bash

cd ../grafana
docker-compose down -v

cd ../graylog
docker-compose down -v

cd ../mantis
docker-compose down -v

cd ../munin
docker-compose down -v

cd ../wiki
docker-compose down -v

cd ..
