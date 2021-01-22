/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &> /dev/null &

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;

#tail -f /dev/null

TEST=$(ps | grep -c vsftpd)

if [ $TEST -eq 2 ]
then
	return 0
else
	return 1
fi
