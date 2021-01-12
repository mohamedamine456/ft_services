#rc-service pure-ftpd start

pure-ftpd -P 192.168.99.117 -p 30001:30002 -j -Y 2 &

tail -f /dev/null
