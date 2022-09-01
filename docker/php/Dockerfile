FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libzip-dev \
		zip \
		&& docker-php-ext-configure gd --with-freetype --with-jpeg \
		&& docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip mysqli
RUN a2enmod rewrite