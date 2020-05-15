FROM alpine:3.11

ENV COMPOSER_MEMORY_LIMIT -1

WORKDIR /srv

RUN chown nobody:nobody /srv; chmod 777 /srv

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates && \
    echo "https://dl.bintray.com/php-alpine/v3.11/php-7.4" >> /etc/apk/repositories

# install php7.4 and requests extensions
RUN apk add --update \
    curl \
    php \
    php-common \
    php-fpm \
    php-cgi \
    php-apache2 \
    php-doc \
    php-dev \
    php-bz2 \
    php-json \
    php-bcmath \
    php-exif \
    php-iconv \
    php-curl \
    php-imagick \
    php-pear \
    php-gd \
    php-xdebug \
    php-intl \
    php-mbstring \
    php-opcache \
    php-pdo_mysql \
    php-sodium \
    php-phar \
    php-mongodb

# configure php-fpm
COPY php.ini /etc/php7/php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

# install Composer
RUN curl -O https://getcomposer.org/download/1.10.6/composer.phar
RUN php7 -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php7 -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php7 composer-setup.php
RUN php7 -r "unlink('composer-setup.php');"

# cleaning
RUN rm -rf /var/cache/apk/*
RUN rm -rf /tmp/*

# Run application
EXPOSE 9000
CMD ["php-fpm7", "-F"]
