FROM alpine:3.12

COPY install_script.sh .
COPY start_wordpress.sh .
COPY nginx.conf .
COPY www.conf .
COPY wp-config.php .
COPY telegraf.conf .
COPY test.sh .

RUN sh install_script.sh

CMD ["sh", "start_wordpress.sh"]
