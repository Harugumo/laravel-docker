FROM php:8.3-fpm

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install --quiet --yes --no-install-recommends \
    libzip-dev \
    libpq-dev \
    unzip \
    && docker-php-ext-install zip pdo_pgsql \
    && pecl install -o -f redis-6.2.0 \
    && docker-php-ext-enable redis

COPY --from=composer:lts /usr/bin/composer /usr/bin/composer

RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 -g appuser \
    -G www-data,root --shell /bin/bash \
    --create-home appuser

USER appuser
