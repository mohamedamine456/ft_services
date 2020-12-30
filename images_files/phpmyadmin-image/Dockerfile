FROM alpine

COPY install_script.sh .
COPY start_phpmyadmin.sh .
COPY config.sample.inc.php .
COPY nginx.conf .
COPY www.conf .

RUN sh install_script.sh

CMD ["sh", "start_phpmyadmin.sh"]
