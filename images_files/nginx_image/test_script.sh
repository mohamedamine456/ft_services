NGINXFILE=/run/nginx.pid
SSHFILE=/run/sshd.pid

if [ -f "$NGINXFILE" -a -f "$SSHFILE" ]
then
	return 0
else
	return 1
fi
