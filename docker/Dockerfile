FROM php:7.3-apache

USER root

ARG project=projectname
ARG user=projectname
ARG uid=1000

RUN apt-get update && apt-get install -y \
  git \
  curl \
  sudo \
  zip \
  unzip \
  libpng-dev \
  libicu-dev \
  libbz2-dev \
  libpng-dev \
  libjpeg-dev \
  libonig-dev \
  libxml2-dev \
  libzip-dev \
  libmcrypt-dev \
  libreadline-dev \
  libfreetype6-dev

RUN docker-php-ext-install pdo_mysql intl mbstring exif pcntl bcmath gd iconv xml zip

RUN pecl install -f xdebug && docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_15.x -o nodesource_setup.sh && bash nodesource_setup.sh && apt-get -y --force-yes install nodejs

RUN apt-get upgrade -y && npm update -g
RUN npm install yarn -g

RUN echo "ServerName laravel-app.local" >> /etc/apache2/apache2.conf
COPY ports.conf /etc/apache2/ports.conf
COPY site-default.conf /etc/apache2/sites-enabled/000-default.conf

ENV APACHE_DOCUMENT_ROOT=/$project/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite headers

RUN useradd -m $user && passwd -d $user && usermod -aG sudo $user

USER $user

WORKDIR /$project
