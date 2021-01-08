FROM alpine

COPY install_script.sh .
COPY start_ftps.sh .
COPY pure-ftpd .
COPY pure-ftpd.conf .
COPY sslanswers.txt .
COPY password.txt .

RUN sh install_script.sh

CMD ["sh", "start_ftps.sh"]
