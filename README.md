apache-php7
===========

Usage
------

Build image:
```
$ docker build -t thisismyengine/docker-apache-php7 git://github.com/thisismyengine/docker-apache-php7.git
```

Run newly created image in a container:
```bash
$ docker run -d -p 80:80 \
    -v "$PWD":/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    --name apache-php7 --restart always \
    thisismyengine/docker-apache-php7
```

* `-v [local path]:/var/www` maps the container's webroot to a local path
* `-p [local port]:80` maps a local port to the container's HTTP port 80
* `-e PHP_ERROR_REPORTING=[php error_reporting settings]` sets the value of `error_reporting` in the php.ini files.

Installed packages
-------------------
* Ubuntu Server 16.04, based on ubuntu docker image
* apache2
* nano
* cron
* php7.0
* php7.0-cli
* libapache2-mod-php7.0
* php7.0-gd
* php7.0-json
* php7.0-ldap
* php7.0-mbstring
* php7.0-mysql
* php7.0-pgsql
* php7.0-sqlite3
* php7.0-curl
* php7.0-xml
* php7.0-xsl
* php7.0-zip
* php7.0-soap
* php7.0-mcrypt

Default Configurations
----------------------

* Apache: .htaccess-Enabled in webroot (mod_rewrite with AllowOverride all)
* php.ini:
  * display_errors = On
  * error_reporting = E_ALL (default, overridable per env variable)

