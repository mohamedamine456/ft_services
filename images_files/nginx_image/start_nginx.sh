# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_nginx.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:10:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/19 15:53:47 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rc-service nginx start;
rc-service sshd start;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;
#tail -f /var/log/nginx/access.log
