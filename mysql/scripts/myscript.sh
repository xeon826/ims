#!/bin/sh
cd $1
if ! [ -e tmp ] ;then
  mkdir tmp
fi
chmod 777 tmp

bin/mysqld --port=3307 --socket=/home/dan/lampstack-7.1.20-0/mysql/tmp/mysql.sock  --datadir=/home/dan/lampstack-7.1.20-0/mysql/data --pid-file=/home/dan/lampstack-7.1.20-0/mysql/data/mysqld.pid --lower-case-table-names=1 --initialize-insecure > /dev/null

if [ `uname -s` = "SunOS" ]; then
    U=`id|sed -e s/uid=//g -e s/\(.*//g`
else
    U=`id -u`
fi

if [ $U = 0 ]; then
   chown -R root .
   chgrp -R root .

   # External data directory - T3532
   cd /home/dan/lampstack-7.1.20-0/mysql/data
   chown -R mysql .
   chgrp -R root .
   cd $1
fi



/home/dan/lampstack-7.1.20-0/mysql/scripts/ctl.sh start mysql > /dev/null
sleep 10
bin/mysql -S /home/dan/lampstack-7.1.20-0/mysql/tmp/mysql.sock -u root -e "DELETE FROM mysql.user WHERE User='';"
bin/mysql -S /home/dan/lampstack-7.1.20-0/mysql/tmp/mysql.sock -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$2';"
