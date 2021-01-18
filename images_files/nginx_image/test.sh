NGINXFILE=/run/nginx.pid
SSHFILE=/run/sshd.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$NGINXFILE" -a -f "$SSHFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
