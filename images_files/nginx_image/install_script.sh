# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:08:21 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/07 11:24:14 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk add --no-cache openrc;

rc-status -a;

touch /run/openrc/softlevel;

apk add --no-cache nginx openssh;

adduser -D -g 'www' www;
adduser -D -g 'mlachheb' mlachheb;
echo mlachheb:password | chpasswd;

mkdir /www;

apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

chown -R www:www /var/lib/nginx;
chown -R www:www /www;

mv nginx.conf /etc/nginx/nginx.conf;

mv index.html /www/index.html;
mv /telegraf.conf /etc/telegraf.conf

mv /nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt;
mv /nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key;
