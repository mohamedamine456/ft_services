telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &
cd /usr/share/grafana/conf && grafana-server -config defaults.ini -pidfile /run/grafana.pid
