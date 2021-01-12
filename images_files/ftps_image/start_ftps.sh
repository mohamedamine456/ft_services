pure-ftpd -P MINIKUBEIP -p 30001:30002 -j -Y 2 &

telegraf -config /etc/telegraf.conf;

tail -f /dev/null
