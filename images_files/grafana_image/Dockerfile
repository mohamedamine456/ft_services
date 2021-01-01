FROM alpine

COPY start_grafana.sh .
COPY telegraf.conf .

RUN apk update && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ && mv /telegraf.conf /etc/telegraf.conf;

CMD ["sh", "start_grafana.sh"]
