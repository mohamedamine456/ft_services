# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:29 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/31 11:15:04 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY install_script.sh .
COPY start_mysql.sh .
COPY mariadb-server.cnf .
COPY wordpress.sql .
COPY create_tables.sql .

RUN sh install_script.sh

CMD ["sh", "start_mysql.sh"]
