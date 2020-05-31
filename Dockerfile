FROM php:5.6-apache

# install odbc
RUN docker-php-ext-install odbc
COPY ./odbc_driver/ibm-iaccess-1.1.0.2-1.0.amd64.deb /tmp/
RUN dpkg -i /tmp/ibm-iaccess-1.1.0.2-1.0.amd64.deb
RUN ln -s /opt/ibm/iSeriesAccess/lib64/libcwb* /usr/lib
COPY ./odbc_driver/odbc.ini /etc/odbc.ini
COPY ./odbc_driver/odbcinst.ini /etc/odbcinst.ini

# test connection
isql -v DEV
# [unixODBC][Driver Manager]Can't open lib '/opt/ibm/iSeriesAccess/lib64/libcwbodbc.so' : file not found

# fix package problem
RUN ln -s /usr/lib/x86_64-linux-gnu/libodbcinst.so.1 /usr/lib/x86_64-linux-gnu/libodbcinst.so.2

# test connection
isql -v DEV


