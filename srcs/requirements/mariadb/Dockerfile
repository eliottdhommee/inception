FROM alpine

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client

COPY tools/run.sh /script/run.sh

RUN chmod 755 /script/run.sh

ENTRYPOINT ["sh", "/script/run.sh"]
