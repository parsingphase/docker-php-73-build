FROM php:7.3
MAINTAINER Richard George "richard@phase.org"

RUN mkdir -p /usr/share/man/man1/
RUN apt-get update
RUN apt-get install -y libxslt-dev ant zlib1g-dev libzip-dev git
RUN docker-php-ext-install xsl zip intl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER 1

ENTRYPOINT /bin/bash