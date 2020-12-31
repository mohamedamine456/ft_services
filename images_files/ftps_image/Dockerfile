FROM alpine

COPY install_script.sh .
COPY start_ftps.sh .

RUN sh install_script.sh

CMD ["sh", "start_ftps.sh"]
