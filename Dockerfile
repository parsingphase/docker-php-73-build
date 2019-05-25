FROM php:7.3
MAINTAINER Richard George "richard@phase.org"

RUN mkdir -p /usr/share/man/man1/
RUN apt-get update
RUN apt-get install -y libxslt-dev ant zlib1g-dev libzip-dev git
# for npm:
RUN apt-get install -y apt-transport-https lsb-release gnupg
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo 'deb https://deb.nodesource.com/node_8.x stretch main' > /etc/apt/sources.list.d/nodesource.list
RUN echo 'deb-src https://deb.nodesource.com/node_8.x stretch main' >> /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install -y build-essential nodejs
# ^ for npm
RUN docker-php-ext-install xsl zip intl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER 1

ENTRYPOINT /bin/bash