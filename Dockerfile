FROM php:8.2-apache

# Install ekstensi sistem & PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql pdo_pgsql zip gd opcache

# Set working directory
WORKDIR /var/www/html

# Copy seluruh file project
COPY . /var/www/html

# Atur permission untuk storage dan bootstrap/cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port Apache
EXPOSE 8080
