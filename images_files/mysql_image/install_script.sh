# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_script.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:22:06 by mlachheb          #+#    #+#              #
#    Updated: 2021/01/02 08:45:42 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update;

apk add openrc --no-cache;

rc-status -a;

touch /run/openrc/softlevel;

apk add mysql mysql-client;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

/etc/init.d/mariadb setup;

mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf;
mv /telegraf.conf /etc/telegraf.conf;

/etc/init.d/mariadb start;
sleep 10;
mysql -u root -e "CREATE USER admin IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO admin IDENTIFIED BY 'password';";
mysql -u root -e "CREATE DATABASE phpmyadmin;";
mysql -u root -e "CREATE USER phpmyadmin IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO phpmyadmin IDENTIFIED BY 'password';";
mysql -u root -e "CREATE DATABASE wordpress;";
mysql -u root -e "CREATE USER wordpress IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpress IDENTIFIED BY 'password';";
mysql -u root -e "FLUSH PRIVILEGES;";
mysql -u root < /wordpress.sql;
mysql -u root < /create_tables.sql;
/etc/init.d/mariadb stop;
