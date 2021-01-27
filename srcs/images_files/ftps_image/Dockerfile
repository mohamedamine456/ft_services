FROM alpine:3.12

COPY install_script.sh .
COPY start.sh .
COPY password.txt .
COPY sslanswers.txt . 
COPY telegraf.conf .
COPY vsftpd.conf .
COPY test.sh .


RUN sh install_script.sh

CMD ["sh", "start.sh"]

