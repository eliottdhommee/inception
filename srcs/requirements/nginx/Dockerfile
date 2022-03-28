FROM alpine:3.4

RUN apk update && apk -U upgrade
RUN apk add nginx
RUN apk add openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/edhommee.42.fr.pem \
		-keyout /etc/nginx/ssl/edhommee.42.fr.key \
		-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=edhommee/CN=edhommee.42.fr/"

RUN mkdir -p /run/nginx
RUN rm -f /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
