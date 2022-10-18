FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		libwebp-dev \
		libzip-dev \
		libpq-dev \
		libicu-dev \
		zip \
		locales \
		locales-all \
		&& docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
		&& docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip mysqli intl
RUN a2enmod rewrite

# Locale
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Restart apache
RUN service apache2 restart