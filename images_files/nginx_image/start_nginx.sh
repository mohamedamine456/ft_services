# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_nginx.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:10:27 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/13 10:22:45 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rc-service nginx start;
rc-service sshd start;
telegraf -config /etc/telegraf.conf;
#tail -f /var/log/nginx/access.log
