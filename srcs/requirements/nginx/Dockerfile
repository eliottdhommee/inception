FROM alpine:3.4

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/edhommee.pem \
        -keyout /etc/nginx/ssl/edhommee.key \
        -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=edhommee/CN=edhommee/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
