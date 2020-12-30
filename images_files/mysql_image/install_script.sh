# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:22:06 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/30 12:22:39 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update;

apk add openrc --no-cache;

rc-status -a;

touch /run/openrc/softlevel;

apk add mysql mysql-client;

/etc/init.d/mariadb setup;

mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf;
