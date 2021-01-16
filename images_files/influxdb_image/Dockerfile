FROM alpine:3.12

COPY start_influxdb.sh .
COPY telegraf.conf .

RUN apk update && apk add influxdb --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ && mv /telegraf.conf /etc/telegraf.conf


CMD ["sh", "start_influxdb.sh"]
