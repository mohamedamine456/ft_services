telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &
cd /usr/share/grafana/conf && grafana-server -config defaults.ini -pidfile /run/grafana.pid &> /dev/null &

sleep 7

while true
do
	NOW=`date +"%D %T"`
	ps | grep -v grep | grep grafana
	TESTGRAFANA=$?
	ps | grep -v grep | grep telegraf
	TESTTELEGRAF=$?
	if [ $TESTGRAFANA -eq 0 ]
	then
		if [ $TESTTELEGRAF -eq 0 ]
		then
			echo "GRAFANA TELEGRAF DOING GOOD"
			sleep 5
		else
			echo "TELEGRAF DOWN"
			break
		fi
	else
		echo "GRAFANA DOWN"
		break
	fi
done
