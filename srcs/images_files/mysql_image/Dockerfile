# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:29 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/22 17:49:05 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

COPY install_script.sh .
COPY start.sh .
COPY mariadb-server.cnf .
COPY wordpress.sql .
COPY create_tables.sql .
COPY telegraf.conf .
COPY dbs_users.sh .
COPY test.sh .

RUN sh install_script.sh

CMD ["sh", "start.sh"]
