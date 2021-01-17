# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:39 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/16 15:30:08 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

COPY install_script.sh .
COPY start_nginx.sh .
COPY nginx.conf .
COPY index.html .
COPY sslanswers.txt .
COPY telegraf.conf .

RUN sh install_script.sh

CMD ["sh", "start_nginx.sh"]
