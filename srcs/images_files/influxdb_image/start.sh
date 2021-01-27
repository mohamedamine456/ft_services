telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

influxd -config /etc/influxdb.conf -pidfile /run/influxdb.pid
