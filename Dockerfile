FROM php:7.3
MAINTAINER Richard George "richard@phase.org"

RUN mkdir -p /usr/share/man/man1/
RUN apt-get update
RUN apt-get install -y libxslt-dev ant zlib1g-dev libzip-dev
RUN docker-php-ext-install xsl zip intl

ENTRYPOINT /bin/bash