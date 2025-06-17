ARG TRAEFIK_RELEASE=v3.4.1
ARG NGINX_RELEASE=1.28-alpine

FROM traefik:${TRAEFIK_RELEASE} AS base-traefik
FROM nginxinc/nginx-unprivileged:${NGINX_RELEASE} AS base-nginx


FROM base-nginx AS app

RUN rm /etc/nginx/conf.d/default.conf
COPY danielb.codes.conf /etc/nginx/conf.d/
COPY src /usr/share/nginx/html
