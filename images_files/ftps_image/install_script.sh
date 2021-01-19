apk update && apk upgrade;

apk add --no-cache openrc;
rc-status -a;
touch /run/openrc/softlevel;

apk add --no-cache openssl;

apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
mv /telegraf.conf /etc/telegraf.conf;

apk add vsftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;
mv /vsftpd.conf /etc/vsftpd/vsftpd.conf

adduser -g 'mlachheb' mlachheb < /password.txt;

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 356 < /sslanswers.txt;

chmod 600 /etc/ssl/private/vsftpd.pem;

mkdir /home/mlachheb/welcome_ftps;
echo "HELLO WORLD! Welcome To mlachheb's FTPS" > /home/mlachheb/welcome_ftps/hello.txt;

chown -R mlachheb /home/mlachheb/welcome_ftps;
