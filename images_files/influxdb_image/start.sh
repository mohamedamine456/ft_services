telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

influxd -config /etc/influxdb.conf -pidfile /run/influxdb.pid &> /dev/null &

sleep 7

while true
do
	ps | grep -v grep | grep influx
	TESTINFLUXDB=$?
	ps | grep -v grep | grep telegraf
	TESTTELEGRAF=$?

	if [ $TESTINFLUXDB -eq 0 ]
	then
		if [ $TESTTELEGRAF -eq 0 ]
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
