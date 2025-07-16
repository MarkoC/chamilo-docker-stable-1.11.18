FROM php:7.4-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libxslt1-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    gd \
    intl \
    mbstring \
    xml \
    zip \
    bcmath \
    exif \
    soap \
    xsl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html|g' /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY php-dev.ini /usr/local/etc/php/conf.d/php-dev.ini
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
