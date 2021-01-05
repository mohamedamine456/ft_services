# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/05 12:00:27 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

/etc/init.d/mariadb setup;
/etc/init.d/mariadb start;
sleep 10;
sh dbs_users.sh;
telegraf -config /etc/telegraf.conf;
