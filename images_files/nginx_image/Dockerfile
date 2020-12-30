# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:16:39 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/29 15:59:04 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY install_script.sh .
COPY start_nginx.sh .
COPY nginx.conf .
COPY index.html .
COPY nginx-selfsigned.crt nginx-selfsigned.crt
COPY nginx-selfsigned.key nginx-selfsigned.key

RUN sh install_script.sh

CMD ["sh", "start_nginx.sh"]
