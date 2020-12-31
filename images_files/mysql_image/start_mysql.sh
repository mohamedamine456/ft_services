# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/31 11:15:31 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

/etc/init.d/mariadb start;
sleep 10;
mysql -u root -e "CREATE DATABASE phpmyadmin;"; 
mysql -u root -e "CREATE USER phpmyadmin IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO phpmyadmin IDENTIFIED BY 'password';";
mysql -u root -e "FLUSH PRIVILEGES;"; 
mysql -u root -e "CREATE DATABASE wordpress;"; 
mysql -u root -e "CREATE USER wordpress IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpress IDENTIFIED BY 'password';";
mysql -u root -e "FLUSH PRIVILEGES;";
mysql -u root < /wordpress.sql;
mysql -u root < /create_tables.sql;
tail -f /dev/null
