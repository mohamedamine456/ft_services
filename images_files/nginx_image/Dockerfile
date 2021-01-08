# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:39 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/08 15:13:17 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY install_script.sh .
COPY start_nginx.sh .
COPY nginx.conf .
COPY index.html .
COPY sslanswers.txt .
COPY telegraf.conf .

RUN sh install_script.sh

CMD ["sh", "start_nginx.sh"]
