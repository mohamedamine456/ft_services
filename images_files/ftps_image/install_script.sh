apk update && apk upgrade;

apk add --no-cache openrc openssl;

rc-status -a;

touch /run/openrc/softlevel;

apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing;

adduser -D -g 'mlachheb' mlachheb;

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 356 < sslanswers.txt;

chmod 600 /etc/ssl/private/pure-ftpd.pem;

mv /pure-ftpd.conf /etc/pure-ftpd.conf;
mv /pure-ftpd /etc/conf.d/pure-ftpd;

pure-pw useradd mlachheb -u mlachheb -d /home/mlachheb < password.txt;

pure-pw mkdb;
