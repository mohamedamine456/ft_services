FROM alpine

COPY install_script.sh .
COPY start_grafana.sh .
COPY telegraf.conf .
COPY grafana-datasource.yaml .
COPY influxdb-datasource.yaml .
COPY mysql-datasource.yaml .
COPY nginx-datasource.yaml .
COPY phpmyadmin-datasource.yaml .
COPY wordpress-datasource.yaml .

#COPY nginx-dashbord.yaml .
#COPY mysql-dashboard.yaml .
COPY grafana-dashboard.yaml .
COPY influxdb-dashboard.yaml .
#COPY phpmyadmin-dashbord.yaml .
#COPY wordpress-dashboard.yaml .

COPY influxdb-dashboard.json .
COPY grafana-dashboard.json .

RUN sh install_script.sh

CMD ["sh", "start_grafana.sh"]
