telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

MYSQLDIR="/var/lib/mysql/mysql/mysql"
PMADIR="/var/lib/mysql/phpmyadmin"
WPDIR="/var/lib/mysql/wordpress"

if [ -d "$MYSQLDIR" ]
then
	echo "setup already done"
else
	mkdir /run/mysqld;
	mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql;
fi

if [ -d "$PMADIR" -a -d "$WPDIR" ]
then
	usr/bin/mysqld --datadir='/var/lib/mysql' -u root &> /dev/null &
else
	usr/bin/mysqld --datadir='/var/lib/mysql' -u root &> /dev/null &
	sleep 5;
	sh dbs_users.sh;
	pkill mysqld;
	usr/bin/mysqld --datadir='/var/lib/mysql' -u root &> /dev/null &
fi

tail -f /dev/null
