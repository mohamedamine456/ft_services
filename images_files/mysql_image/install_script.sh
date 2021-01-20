# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:22:06 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/20 10:03:43 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update;

apk add openrc --no-cache;

rc-status -a;

touch /run/openrc/softlevel;

apk add mysql mysql-client;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf;
mv /telegraf.conf /etc/telegraf.conf;

