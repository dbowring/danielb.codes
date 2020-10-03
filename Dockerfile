FROM nginx:1.19-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY danielb.codes.conf /etc/nginx/conf.d/
COPY src /usr/share/nginx/html

