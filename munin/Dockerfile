# Using the official php:7.2-apache image
FROM php:7.2-apache

# Installing munin and munin-node
RUN apt-get update && apt-get install -y munin munin-node && rm -rf /var/lib/apt/lists/*

# Copying the munin configuration files over
COPY munin-conf /etc/munin

# Setting the working directory to /var/www/html
WORKDIR /var/www/html

# Setting up the plugins and the www files 
RUN ln -s /usr/share/munin/plugins /etc/munin/plugins && \
    ln -s /var/cache/munin/www /var/www/html/munin && \
    chown -R munin:munin /var/cache/munin && \
    chmod -R 0755 /var/cache/munin && \
    chown -R munin:munin /var/run && \
    mkdir /var/run/munin && chown -R munin:munin /var/run/munin

# Activating cgi so the graphs can be generated
RUN a2enmod cgi

# Expose port 4949 and 80
EXPOSE 4949 80

# Starting cron and munin-node services and running apache2
CMD service cron start && service munin-node start && apache2-foreground
