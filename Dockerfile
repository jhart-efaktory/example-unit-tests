FROM php

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip libzip-dev zlib1g-dev
    
RUN docker-php-ext-install zip

RUN curl --silent --show-error https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html

COPY app/* ./

COPY app/src/* ./src/

RUN composer install

CMD tail -f /dev/null