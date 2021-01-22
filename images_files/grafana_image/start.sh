telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &
cd /usr/share/grafana/conf && grafana-server -config defaults.ini -pidfile /run/grafana.pid &> /dev/null &

while true
do
	TESTGRAFANA=$(ps | grep -v grep | grep -c grafana)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTGRAFANA -eq 1 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
		then
			echo "GRAFANA TELEGRAF DOING GOOD"
			sleep 2
		else
			echo "TELEGRAF DOWN"
			break
		fi
	else
		echo "GRAFANA DOWN"
		break
	fi
done
