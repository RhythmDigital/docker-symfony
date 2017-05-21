FROM php:fpm

WORKDIR /var/www

ENV XDEBUG_VERSION 2.5.4
ENV NODE_VERSION 6.10.3
ENV NPM_VERSION 4.6.1
ENV MEMCACHED_VERSION 3.0.3

RUN docker-php-ext-enable opcache

RUN pecl install "xdebug-${XDEBUG_VERSION}"
RUN docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=localhost" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=10000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini

#    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \

RUN apt-get update
RUN apt-get install -y git zip unzip

RUN curl -SLO "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" \
    && curl -SLO "https://nodejs.org/dist/v${NODE_VERSION}/SHASUMS256.txt.asc" \
    && tar -xzf "node-v${NODE_VERSION}-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && rm "node-v${NODE_VERSION}-linux-x64.tar.gz" SHASUMS256.txt.asc \
    && npm install -g npm@"${NPM_VERSION}" \
    && npm cache clear

RUN apt-get install -y pkg-config
RUN apt-get install -y libmemcached-dev zlib1g-dev
RUN pecl install "memcached-${MEMCACHED_VERSION}"
RUN docker-php-ext-enable memcached
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod a+x /usr/local/bin/composer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

RUN usermod -u 1000 www-data

