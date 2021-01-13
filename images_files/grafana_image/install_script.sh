mkdir /grafana;

# DASHBOARD JSON
mv /grafana-dashboard.json /grafana/grafana-dashboard.json;
mv /influxdb-dashboard.json /grafana/influxdb-dashboard.json;
mv /mysql-dashboard.json /grafana/mysql-dashboard.json;
mv /nginx-dashboard.json /grafana/nginx-dashboard.json;
mv /phpmyadmin-dashboard.json /grafana/phpmyadmin-dashboard.json;
mv /wordpress-dashboard.json /grafana/wordpress-dashboard.json;
mv /ftps-dashboard.json /grafana/ftps-dashboard.json;

# INSTALLATION
apk update;
apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
mv /telegraf.conf /etc/telegraf.conf;

# DASHBORDS
mv /grafana-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/grafana-dashboard.yaml;
mv /influxdb-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb-dashboard.yaml;
mv /mysql-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/mysql-dashboard.yaml;
mv /nginx-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/nginx-dashboard.yaml;
mv /phpmyadmin-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/phpmyadmin-dashboard.yaml;
mv /wordpress-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/wordpress-dashboard.yaml;
mv /ftps-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/ftps-dashboard.yaml;

# DATASOURCES
mv /grafana-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/grafana-datasource.yaml;
mv /influxdb-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb-datasource.yaml;
mv /mysql-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/mysql-datasource.yaml;
mv /nginx-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/nginx-datasource.yaml;
mv /phpmyadmin-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/phpmyadmin-datasource.yaml;
mv /wordpress-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/wordpress-datasource.yaml;
mv /ftps-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ftps-datasource.yaml;

# PASSWORD CHANGE DISABLE CREATION OF ACCOUNT

sed -i 's/admin_password = admin/admin_password = password/g' /usr/share/grafana/conf/defaults.ini;
#sed -i 's/disable_initial_admin_creation = false/disable_initial_admin_creation = true/g' /usr/share/grafana/conf/defaults.ini;
