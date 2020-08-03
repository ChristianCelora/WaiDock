FROM php:5.6-apache

RUN apt-get update

# php extensions (commentate quelle in errore)
RUN docker-php-ext-install pdo_mysql 
# RUN docker-php-ext-install pdo_dblib 
# RUN docker-php-ext-install bz2 
RUN docker-php-ext-install dba 
#RUN docker-php-ext-install mssql 
RUN docker-php-ext-install sockets 
#RUN docker-php-ext-install wddx 
RUN docker-php-ext-install calendar 
RUN docker-php-ext-install shmop 
#RUN docker-php-ext-install memcache 
#RUN docker-php-ext-install memcached 
RUN docker-php-ext-install mysql 
RUN docker-php-ext-install pcntl 
RUN docker-php-ext-install exif 
RUN docker-php-ext-install gettext 
RUN docker-php-ext-install sysvshm 
#RUN docker-php-ext-install soap 
RUN docker-php-ext-install sysvmsg 
#RUN docker-php-ext-install zip 
#RUN docker-php-ext-install gd 
RUN docker-php-ext-install bcmath 
RUN docker-php-ext-install sysvsem 
#RUN docker-php-ext-install odbc 
RUN docker-php-ext-install mysqli
# install odbc
RUN apt-get install unixodbc unixodbc-dev -y \
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
