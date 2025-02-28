ARG PHP_VERSION=""
FROM php:${PHP_VERSION:+${PHP_VERSION}-}fpm-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git vim nodejs npm curl freetype libpq-dev libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev imagemagick imagemagick-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd mysqli pdo pdo_pgsql pcntl

RUN apk add --no-cache --virtual .build-deps \
    gcc g++ make autoconf libc-dev bash \
    && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    apk del .build-deps

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require laravel/installer \
    && echo 'export PATH=$PATH:/root/.composer/vendor/bin' >> /root/.bashrc
