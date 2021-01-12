mkdir /grafana;

# DASHBOARD JSON
mv /grafana-dashboard.json /grafana/grafana-dashboard.json;
mv /influxdb-dashboard.json /grafana/influxdb-dashboard.json;

apk update;
apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
mv /telegraf.conf /etc/telegraf.conf;

# DASHBORDS
mv /grafana-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/grafana-dashboard.yaml;
mv /influxdb-dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb-dashboard.yaml

# DATASOURCES
mv /grafana-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/grafana-datasource.yaml;
mv /influxdb-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb-datasource.yaml;
mv /mysql-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/mysql-datasource.yaml;
mv /nginx-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/nginx-datasource.yaml;
mv /phpmyadmin-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/phpmyadmin-datasource.yaml;
mv /wordpress-datasource.yaml /usr/share/grafana/conf/provisioning/datasources/wordpress-datasource.yaml;
