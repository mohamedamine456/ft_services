# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:22:06 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/29 11:38:47 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update;


apk add mariadb mariadb-client;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf;
mv /telegraf.conf /etc/telegraf.conf;

