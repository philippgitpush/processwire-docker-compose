FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libzip-dev \
		zip \
		locales \
		&& docker-php-ext-configure gd --with-freetype --with-jpeg \
		&& docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip mysqli
RUN locale-gen C.UTF-8
RUN a2enmod rewrite

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8