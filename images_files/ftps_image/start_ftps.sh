/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &> /dev/null &

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid;

#tail -f /dev/null
