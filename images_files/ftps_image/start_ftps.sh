#pure-ftpd -P 192.168.99.127 -p 30001:30002 -j -Y 2 &

telegraf -config /etc/telegraf.conf;

tail -f /dev/null
