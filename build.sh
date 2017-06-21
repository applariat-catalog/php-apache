#! /bin/sh
# appLariats generic php-apache build script

#Log everything in /src/build.log
logfile=/code/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/php-conf/php.ini and use it if exists
#customizing php through providing php-conf/php.ini as part of the code artifact
if [ -e /code/php-conf/php.ini ]
then
 cp -f /code/php-conf/php.ini /usr/local/etc/php
else
 #look inside /conf for php.ini and use it if exists
 #customizing php through cloning this github repo and providing conf/php.ini
 if [ -e /conf/php.ini ]
 then
  cp -f /conf/php.ini /usr/local/etc/php
 fi
 #if non of the above, default config file inside the image will be used
fi

cp -rf /code/* /var/www/html/
