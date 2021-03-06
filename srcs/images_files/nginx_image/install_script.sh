# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:08:21 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/22 09:23:23 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk add --no-cache nginx openssh openssl;

adduser -D -g 'www' www;
adduser -D -g 'mlachheb' mlachheb;
echo mlachheb:password | chpasswd;

mkdir /www;

apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

chown -R www:www /var/lib/nginx;
chown -R www:www /www;

mv nginx.conf /etc/nginx/nginx.conf;

mv index.html /www/index.html;
mv /telegraf.conf /etc/telegraf.conf;

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -days 356 < /sslanswers.txt;

ssh-keygen -A;
