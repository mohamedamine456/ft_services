
MYSQLDIR="/var/lib/mysql/mysql/mysql"
PMADIR="/var/lib/mysql/phpmyadmin"
WPDIR="/var/lib/mysql/wordpress"
MYSQLSTATUS="$(/etc/init.d/mariadb status)"

if [ -d "$MYSQLDIR" ]
then
	echo "setup already done!"
else
	/etc/init.d/mariadb setup;
	sleep 5;
fi

/etc/init.d/mariadb start;
sleep 10;

if [ -d "$PMADIR" -a -d "$WPDIR" ]
then
	echo "databases already there!"
else
	sh dbs_users.sh;
fi
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null;

while [ true ]
do
	if [ $MYSQLSTATUS=="* status: crashed" ]
	then
		/etc/init.d/mariadb stop;
		/etc/init.d/mariadb start;
	fi
done
