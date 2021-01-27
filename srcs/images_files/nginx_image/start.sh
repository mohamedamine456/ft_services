#! /bin/sh

/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" &> /dev/null &
/usr/sbin/sshd -D&
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid
