FROM php:8.1-apache
WORKDIR /var/www/html

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
RUN a2enmod rewrite && a2enmod deflate && a2enmod filter && a2enmod expires

# Custom php.ini
COPY php/custom-php.ini /usr/local/etc/php/conf.d/

# Locale
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Restart apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN service apache2 restart
