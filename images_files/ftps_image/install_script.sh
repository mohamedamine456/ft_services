apk update && apk upgrade;

apk add --no-cache openrc;

rc-status -a;

touch /run/openrc/softlevel;

apk add vsftpd vsftpd-doc;
