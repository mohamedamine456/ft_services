FROM alpine:3.12

COPY install_script.sh .
COPY start_grafana.sh .
COPY telegraf.conf .

COPY datasources/grafana-datasource.yaml .
COPY datasources/influxdb-datasource.yaml .
COPY datasources/mysql-datasource.yaml .
COPY datasources/nginx-datasource.yaml .
COPY datasources/phpmyadmin-datasource.yaml .
COPY datasources/wordpress-datasource.yaml .
COPY datasources/ftps-datasource.yaml .

COPY dashboards/nginx-dashboard.yaml .
COPY dashboards/mysql-dashboard.yaml .
COPY dashboards/grafana-dashboard.yaml .
COPY dashboards/influxdb-dashboard.yaml .
COPY dashboards/phpmyadmin-dashboard.yaml .
COPY dashboards/wordpress-dashboard.yaml .
COPY dashboards/ftps-dashboard.yaml .


COPY jsonfiles/influxdb-dashboard.json .
COPY jsonfiles/grafana-dashboard.json .
COPY jsonfiles/mysql-dashboard.json .
COPY jsonfiles/nginx-dashboard.json .
COPY jsonfiles/phpmyadmin-dashboard.json .
COPY jsonfiles/wordpress-dashboard.json .
COPY jsonfiles/ftps-dashboard.json .

RUN sh install_script.sh

CMD ["sh", "start_grafana.sh"]
