apk update && apk upgrade;

apk add --no-cache openrc;

rc-status -a;

touch /run/openrc/softlevel;

apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing;

adduser-D -g 'mlachheb' mlachheb;

mv pure-ftpd.pem /etc/ssl/private/pure-ftpd.pem;

chmod 600 /etc/ssl/private/pure-ftpd.pem;

pure-pw adduser mlachheb -u mlachheb -d /home/mlachheb;
