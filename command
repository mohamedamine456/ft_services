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


