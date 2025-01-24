ARG PHP_VERSION=""
FROM php:${PHP_VERSION:+${PHP_VERSION}-}fpm-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git vim nodejs npm curl freetype libpq-dev libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install gd mysqli pdo pdo_pgsql pcntl

RUN composer global require laravel/installer \
    && echo 'export PATH=$PATH:/root/.composer/vendor/bin' >> /root/.bashrc