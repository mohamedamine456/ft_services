MARIADBFILE=/run/mysqld/mariadb.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$MARIADBFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
