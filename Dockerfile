FROM ubuntu:16.04
MAINTAINER Engine <hello@thisismyengine.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      nano \
      cron \
      php7.0 \
      php7.0-cli \
      libapache2-mod-php7.0 \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-pgsql \
      php7.0-sqlite3 \
      php7.0-curl \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip \
      php7.0-soap \
      php7.0-mcrypt

COPY cron /tmp/cron
COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run

RUN export EDITOR="/usr/bin/nano"
RUN crontab
RUN cat /tmp/cron | crontab
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

EXPOSE 80
CMD ["/usr/local/bin/run"]
