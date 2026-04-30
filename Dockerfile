FROM wordpress:php8.4-fpm-alpine

# Upgrade all Alpine packages to patch known CVEs, then install XDebug.
# XDebug is installed but not configured here — config lives per-project.
RUN apk upgrade --no-cache \
	&& apk add --no-cache $PHPIZE_DEPS linux-headers \
	&& pecl install xdebug-3.4.2 \
	&& docker-php-ext-enable xdebug \
	&& apk del $PHPIZE_DEPS
