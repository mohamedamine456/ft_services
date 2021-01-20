# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/20 15:00:49 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rc-status -a;
/etc/init.d/mariadb setup;
sleep 5;
/etc/init.d/mariadb start;
sleep 10;
sh dbs_users.sh;

#MYSQLDIR="/var/lib/mysql/mysql/mysql"
#PMADIR="/var/lib/mysql/phpmyadmin"
#WPDIR="/var/lib/mysql/wordpress"

#rc-status -a;
#/etc/init.d/mariadb stop;

#if [ -d "$MYSQLDIR" ]
#then
#	echo "setup already done!"
#else
#	/etc/init.d/mariadb setup;
#	sleep 5;
#fi

#/etc/init.d/mariadb start;
#sleep 10;

#if [ -d "$PMADIR" -a -d "$WPDIR" ]
#then
#	echo "databases already there!"
#else
#	sh dbs_users.sh;
#fi
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;
