# docker-php-fpm

Create a docker image can run a `php-fpm` service (port 9000) on `/srv` PATH

## Build the image

`docker build . -t pr-challenge:latest`

## Start a container session

`docker run -it --rm -h 0.0.0.0 -p 9000:9000 pr-challenge:latest`

and then go http://localhost:9000

For debug you can run:

`docker run -it --rm pr-challenge:latest /bin/sh`

## Requirements

- PHP 7.4
- Composer
- amqp
- imagick
- memcached
- mongodb
- xdebug
- bcmath
- curl
- exif
- gd
- iconv
- intl
- json
- mbstring
- opcache
- pdo_mysql
- sodium
- COMPOSER_MEMORY_LIMIT to -1

##### notes

- amqp = php-amqp
- bcmath = php-bcmath
- exif = php-exif
- iconv = php-iconv
- imagick = php-pecl-imagick
- xdebug = php-xdebug
- gd = php-gd
- intl = php-intl
- json = php-json
- mbstring = php-mbstring
- opcache = php-opcache
- pdo_mysql = php-pdo_mysql
- sodium = php-sodium
- memcached = php-memcached
- mongodb = php-mongodb

Also, see [Dockerfile](./Dockerfile) for:


##### refs:

- https://github.com/codecasts/php-alpine
- https://getcomposer.org/download/
- https://github.com/docker-library/php/blob/master/7.4/alpine3.11/fpm/Dockerfile

##### errors

```
ERROR: php7-gd-7.4.5-r1: operation timed out

----

ERROR: php7-sodium-7.4.5-r1: trying to overwrite usr/lib/php7/modules/sodium.so owned by php7-libsodium-2.0.22-r1.

----

Cannot find autoconf. Please check your autoconf installation and the
$PHP_AUTOCONF environment variable. Then, rerun this script.
ERROR: `phpize' failed
The command '/bin/sh -c pecl install memcached' returned a non-zero code: 1

----

/ # php7 composer-setup.php
Some settings on your machine make Composer unable to work properly.
Make sure that you fix the issues listed below and run this script again:

The phar extension is missing.
Install it or recompile php without --disable-phar
```
