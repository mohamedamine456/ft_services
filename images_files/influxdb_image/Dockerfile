FROM alpine

COPY start_influxdb.sh .

RUN apk update && apk add influxdb --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

CMD ["sh", "start_influxdb.sh"]
