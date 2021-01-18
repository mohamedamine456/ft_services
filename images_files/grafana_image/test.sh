GRAFANAFILE=/run/grafana.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$GRAFANAFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
