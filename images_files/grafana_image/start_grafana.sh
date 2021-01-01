telegraf -config /etc/telegraf.conf &> /dev/null &
cd /usr/share/grafana/conf && grafana-server -config defaults.ini
