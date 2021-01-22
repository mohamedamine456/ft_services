#MYSQL 

/usr/bin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
logger -t mysqld -p daemon.error !!!!

# vsftpd

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

#influxdb

influxd -config /etc/influxdb.conf -pidfile /run/influxdb.pid

# nginx
/usr/sbin/nginx -c /etc/nginx/nginx.conf


#sshd

/usr/sbin/sshd !!!!

#PHP

php-fpm7


# supervisor
{supervisord} /usr/bin/python3 /usr/bin/supervisord --nodaemon --pidfile /var/run/supervisord.pid --configuration /etc/supervisord.conf


PS="$(ps)"

if [[ "$PS" =~ "vsftpd" ]];
then
	return 0
else
	return 1
fi

TEST=$(ps | grep -c vsftpd)

if [ $TEST -eq 2 ]
then
	return 0
else
	return 1
fi
