/usr/sbin/nginx -c /etc/nginx/nginx.conf;
/usr/sbin/sshd -D&

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null;

tail -f /var/log/nginx/access.log
