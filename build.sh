#! /bin/sh
# appLariats generic php-apache build script
# Requirements - A valid php.ini file exists within the /src/conf/ dir
# Copies the php.ini file from the /src/conf/ and copies it into /usr/local/etc/php

#Log everything in /src/build.log
logfile=/src/build.log
exec > $logfile 2>&1
set -x

#Check for php.ini file and throw exception if not present
if [ -e /src/config/php.ini ]
then
    cp -f /src/config/php.ini /usr/local/etc/php
else
    echo "ERROR! php.ini not found"
    exit 1
fi

cp -rf /src/* /var/www/html/
