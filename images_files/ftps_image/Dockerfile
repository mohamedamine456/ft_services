FROM alpine:3.12

COPY install_script.sh .
COPY start_ftps.sh .
COPY password.txt .
COPY sslanswers.txt . 
COPY telegraf.conf .
COPY vsftpd.conf .


RUN sh install_script.sh

CMD ["sh", "start_ftps.sh"]

