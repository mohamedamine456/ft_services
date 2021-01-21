telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &
cd /usr/share/grafana/conf && grafana-server -config defaults.ini -pidfile /run/grafana.pid &> /dev/null &
TESTGRAFANA=$(ps | grep -v grep | grep -c grafana)
TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)
while [ true ]
do
	if [ $TESTGRAFANA -eq 1 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
		then
			continue
		else
			break
		fi
	else
		break
	fi
done
