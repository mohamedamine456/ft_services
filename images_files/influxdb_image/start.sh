telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

influxd -config /etc/influxdb.conf -pidfile /run/influxdb.pid &> /dev/null &

while true
do
	TESTINFLUXDB=$(ps | grep -v grep | grep -c influx)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTINFLUXDB -eq 1 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
		then
			echo "INFLUXDB TELEGRAF DOING GOOD"
			sleep 2
		else
			echo "TELEGRAF DOWN"
			break
		fi
	else
		echo "INFLUXDB DOWN"
		break
	fi
done
