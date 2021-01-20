# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_nginx.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:10:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/20 18:13:23 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

/usr/sbin/nginx -c /etc/nginx/nginx.conf;
/usr/sbin/sshd -D&

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;
#tail -f /var/log/nginx/access.log
