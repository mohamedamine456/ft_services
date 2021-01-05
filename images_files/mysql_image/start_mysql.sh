# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/05 16:34:44 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MYSQL_DIR="/var/lib/mysql/mysql"
if [ -d "$MYSQL_DIR" ]
then
	/etc/init.d/mariadb start;
	sleep 10;
else
	/etc/init.d/mariadb setup;
	/etc/init.d/mariadb start;
	sleep 10;
	sh dbs_users.sh;
fi
telegraf -config /etc/telegraf.conf;
