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
	sleep 5;
else
	usr/bin/mysqld --datadir='/var/lib/mysql' -u root &> /dev/null &
	sleep 5;
	sh dbs_users.sh;
fi
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

sleep 5

while true
do
	TESTMYSQL=$(ps | grep -v grep | grep -c mysql)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTMYSQL -eq 1 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
		then
			echo "MYSQL TELEGRAF DOING GOOD"
			sleep 2
		else
			echo "TELEGRAF DOWN"
			break
		fi
	else
		echo "MYSQL DOWN"
		break
	fi
done
