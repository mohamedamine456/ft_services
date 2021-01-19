MARIADBFILE=/run/mysqld/mariadb.pid
TELEGRAFFILE=/run/telegraf.pid
MARIADBSTATUS=$(rc-service mariadb status)

if [ -f "$MARIADBFILE" -a -f "$TELEGRAFFILE"  || "$MARIADBSTATUS"=="* status: crashed" ]
then
	return 0
else
	return 1
fi
