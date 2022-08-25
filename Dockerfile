FROM php:8.0-rc-apache-buster

# DEBUG
RUN pecl install xdebug-3.1.5 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo pdo_mysql

#COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#NODE
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn

COPY php.ini /usr/local/etc/php

ENV ENV_DISPLAY_ERRORS="On"

WORKDIR /var/www