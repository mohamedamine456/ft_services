influxd -config /etc/influxdb.conf &> /dev/null &

#telegraf -sample-config -input-filter cpu:mem -output-filter influxdb > /etc/telegraf.conf

telegraf --config /etc/telegraf.conf
