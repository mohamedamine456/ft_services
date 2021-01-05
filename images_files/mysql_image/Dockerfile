# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:29 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/05 12:03:05 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY install_script.sh .
COPY start_mysql.sh .
COPY mariadb-server.cnf .
COPY wordpress.sql .
COPY create_tables.sql .
COPY telegraf.conf .
COPY dbs_users.sh .

RUN sh install_script.sh

CMD ["sh", "start_mysql.sh"]
