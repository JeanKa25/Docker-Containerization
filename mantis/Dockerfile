#Using the official php:7.2-apache image
FROM php:7.2-apache

#Installing unzip tool
RUN apt-get update && apt-get install -y wget unzip

#Installing the mysql improved extension
RUN docker-php-ext-install mysqli

#Setting the working directory to be /var/www/html since the container is running in an apache server
WORKDIR /var/www/html

#Downloading the MantisBT files into the container
RUN wget https://sourceforge.net/projects/mantisbt/files/latest/download && unzip download && rm download && mv mantis* mantis && cp -rf mantis/* . && rm -rf mantis

#Changing the owner to www-data
RUN chown -R www-data:www-data /var/www/html

#Exposing port 80
EXPOSE 80
