# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:29 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/30 12:22:45 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY install_script.sh .
COPY start_mysql.sh .
COPY mariadb-server.cnf .

RUN sh install_script.sh

CMD ["sh", "start_mysql.sh"]
