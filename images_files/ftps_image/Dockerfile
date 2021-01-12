FROM alpine

COPY install_script.sh .
COPY start_ftps.sh .
COPY password.txt .
COPY sslanswers.txt . 

RUN sh install_script.sh

CMD ["sh", "start_ftps.sh"]

