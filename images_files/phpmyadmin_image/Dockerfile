FROM alpine:3.12

COPY install_script.sh .
COPY start.sh .
COPY config.sample.inc.php .
COPY nginx.conf .
COPY www.conf .
COPY telegraf.conf .

RUN sh install_script.sh

CMD ["sh", "start.sh"]
