# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:08:21 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/29 16:03:47 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk add --no-cache nginx openssl;

adduser -D -g 'www' www;

mkdir /www;

chown -R www:www /var/lib/nginx;
chown -R www:www /www;

mv nginx.conf /etc/nginx/nginx.conf;

mv index.html /www/index.html;

mv /nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt;
mv /nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key;
