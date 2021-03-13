FROM php:5.6-apache

RUN apt-get update -y

# php extensions (commentate quelle in errore)
RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install dba \
    && docker-php-ext-install sockets \
    && docker-php-ext-install calendar \
    && docker-php-ext-install shmop \
    && docker-php-ext-install mysql \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install exif \
    && docker-php-ext-install gettext \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install mysqli
# RUN docker-php-ext-install pdo_dblib 
# RUN docker-php-ext-install bz2 
# RUN docker-php-ext-install mssql 
# RUN docker-php-ext-install wddx 
# RUN docker-php-ext-install memcache 
# RUN docker-php-ext-install memcached 
# RUN docker-php-ext-install soap 
# RUN docker-php-ext-install zip 
# RUN docker-php-ext-install gd 

# install odbc
RUN apt-get install unixodbc unixodbc-dev -y \
    #&& apt-get install php5-odbc -y \
    && docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr \
    && docker-php-ext-install pdo_odbc
COPY ./driver/iseriesaccess_7.1.0-2_amd64.deb /tmp/iseriesaccess_7.1.0-2_amd64.deb
RUN dpkg -i /tmp/iseriesaccess_7.1.0-2_amd64.deb
RUN ln -s /opt/ibm/iSeriesAccess/lib64/libcwb* /usr/lib
COPY ./odbc_driver/odbc.ini /etc/odbc.ini
COPY ./odbc_driver/odbcinst.ini /etc/odbcinst.ini

# test connection
# RUN isql -v AS400

# [unixODBC][Driver Manager]Can't open lib '/opt/ibm/iSeriesAccess/lib64/libcwbodbc.so' : file not found
# fix package problem
#RUN ln -s /usr/lib/x86_64-linux-gnu/libodbcinst.so.1 /usr/lib/x86_64-linux-gnu/libodbcinst.so.2
# RUN docker-php-ext-install odbc 
#RUN apt-get install php5-odbc -y
# Configure & install php-odbc
RUN set -ex; \
        docker-php-source extract; \
        { \
                echo '# https://github.com/docker-library/php/issues/103#issuecomment-271413933'; \
                echo 'AC_DEFUN([PHP_ALWAYS_SHARED],[])dnl'; \
                echo; \
                cat /usr/src/php/ext/odbc/config.m4; \
        } > temp.m4; \
        mv temp.m4 /usr/src/php/ext/odbc/config.m4; \
        apt-get update; \
        apt-get install -y --no-install-recommends unixodbc-dev; \
        docker-php-ext-configure odbc --with-unixODBC=shared,/usr; \
        docker-php-ext-install odbc; \
        #docker-php-source delete; \
        #apt-get purge -y --auto-remove