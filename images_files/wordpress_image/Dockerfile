FROM alpine

COPY install_script.sh .
COPY start_wordpress.sh .
COPY nginx.conf .
COPY www.conf .

RUN sh install_script.sh

CMD ["sh", "start_wordpress.sh"]
