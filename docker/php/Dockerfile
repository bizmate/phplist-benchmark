FROM php:7.2-cli
MAINTAINER Diego Gullo <diego_gullo@bizmate.biz>

RUN apt-get update && apt-get install -y  libcurl4-gnutls-dev \
	libfreetype6-dev libmcrypt-dev libicu-dev libpq-dev \
	&& docker-php-ext-install curl \
	&& docker-php-ext-install mysqli pdo_mysql \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*