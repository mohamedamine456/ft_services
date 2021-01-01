influxd -config /etc/influxdb.conf &> /dev/null &

telegraf --config /etc/telegraf.conf
