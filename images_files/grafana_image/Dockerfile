FROM alpine

COPY start_grafana.sh .

RUN apk update && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

CMD ["sh", "start_grafana.sh"]
