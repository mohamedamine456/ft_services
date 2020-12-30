# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_mysql.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlachheb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/22 14:29:27 by mlachheb          #+#    #+#              #
#    Updated: 2020/12/30 12:21:41 by mlachheb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

/etc/init.d/mariadb start;
mysql -u root -e "CREATE DATABASE phpmyadmin;"; 
mysql -u root -e "CREATE USER pma IDENTIFIED BY 'pmapass';";
mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO pma IDENTIFIED BY 'pmapass';";
mysql -u root -e "FLUSH PRIVILEGES;"; 
mysql -u root -e "CREATE DATABASE wordpress;"; 
mysql -u root -e "CREATE USER wordpress IDENTIFIED BY 'password';";
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpress IDENTIFIED BY 'password';";
mysql -u root -e "FLUSH PRIVILEGES;"; 
mysqld_safe
