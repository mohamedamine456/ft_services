INFLUXDBFILE=/run/influxdb.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$INFLUXDBFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
