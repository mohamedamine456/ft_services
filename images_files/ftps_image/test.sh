VSFTPFILE=/run/vsftpd.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$VSFTPFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
