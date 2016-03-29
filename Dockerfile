FROM php:5.6-fpm

COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        php5-dev \
        php5-mysql \
        php5-sqlite \
#        php5-intl \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install mongo \
    && pecl install intl \
    && docker-php-ext-enable mongo \
    && docker-php-ext-enable intl \
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

CMD ["php-fpm"]
