apk update && apk upgrade;

apk add --no-cache openssl;

apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
mv /telegraf.conf /etc/telegraf.conf;

apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing;

adduser -g 'mlachheb' mlachheb < /password.txt;

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 356 < /sslanswers.txt;

chmod 600 /etc/ssl/private/pure-ftpd.pem;

pure-pw useradd mlachheb -u mlachheb -d  /home/mlachheb < /password.txt;
