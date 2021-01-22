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
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid

#sleep 5

#while true
#do
#	ps | grep -v grep | grep -c mysql
#	TESTMYSQL=$?
#	ps | grep -v grep | grep -c telegraf
#	TESTTELEGRAF=$?
#	if [ $TESTMYSQL -eq 0 ]
#	then
#		if [ $TESTTELEGRAF -eq 0 ]
#		then
#			echo "MYSQL TELEGRAF DOING GOOD"
#			sleep 5
#		else
#			echo "TELEGRAF DOWN"
#			break
#		fi
#	else
#		echo "MYSQL DOWN"
#		break
#	fi
#done
