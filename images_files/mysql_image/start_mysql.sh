# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/19 16:57:46 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
	sleep 10;
else
	usr/bin/mysqld --datadir='/var/lib/mysql' -u root &> /dev/null &
	sleep 10;
	sh dbs_users.sh;
fi
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;
