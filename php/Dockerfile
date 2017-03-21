FROM php:7.0.8-fpm

RUN apt-get update && \
    apt-get install -y git wget libssl-dev zlib1g-dev libicu-dev g++ make cmake

# Install PHP extensions
RUN docker-php-ext-install zip mbstring mysqli pdo_mysql intl opcache bcmath && \
    pecl install xdebug && \
    echo zend_extension=xdebug.so > /usr/local/etc/php/conf.d/xdebug.ini && \
    pecl install apcu-5.1.3 && \
    echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

# Install GD
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng12-dev \
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd


RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

# Install wkhtmltopdf
RUN apt-get update && apt-get install -y \
     xvfb wget && \ 
     wget --no-verbose http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb && \
#     dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb &&
     apt-get -y -f install && \
     echo 'xvfb-run -a -s "-screen 0 1280x800x16" wkhtmltopdf "$@"' > wkhtmltopdf.sh && \
     chmod a+x wkhtmltopdf.sh && \
     mv wkhtmltopdf.sh /usr/local/bin/

    # RUN buildDeps=" \
    #     libbz2-dev \
    #     libmysqlclient-dev \
    # " \
    # runtimeDeps=" \
    #     curl \
    #     git \
    #     libfreetype6-dev \
    #     libicu-dev \
    #     libjpeg-dev \
    #     libmcrypt-dev \
    #     libpng12-dev \
    #     libpq-dev \
    # " \
    # && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    # && docker-php-ext-install bz2 calendar iconv intl mbstring mcrypt mysqli pdo_mysql pdo_pgsql pgsql zip \
    # && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    # && docker-php-ext-install gd \