# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:22:06 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/05 16:35:13 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update;

apk add openrc --no-cache;

rc-status -a;

touch /run/openrc/softlevel;

apk add mysql mysql-client;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

#/etc/init.d/mariadb setup;

mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf;
mv /telegraf.conf /etc/telegraf.conf;

#/etc/init.d/mariadb start;
#sleep 10;
#sh dbs_users.sh;

#/etc/init.d/mariadb stop;
