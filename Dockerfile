FROM nginxinc/nginx-unprivileged:1.27-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY danielb.codes.conf /etc/nginx/conf.d/
COPY src /usr/share/nginx/html
