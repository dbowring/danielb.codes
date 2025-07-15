ARG TRAEFIK_RELEASE=v3.5.0
ARG NGINX_RELEASE=1.29-alpine
ARG RCLONE_RELEASE=1.70.3
ARG HEADSCALE_RELEASE=v0.26.1

FROM traefik:${TRAEFIK_RELEASE} AS base-traefik
FROM nginxinc/nginx-unprivileged:${NGINX_RELEASE} AS base-nginx
FROM rclone/rclone:${RCLONE_RELEASE} AS base-rclone
FROM headscale/headscale:${HEADSCALE_RELEASE} AS base-headscale

FROM base-rclone AS webdav

EXPOSE 8080
VOLUME /webdav
CMD ["serve", "webdav", "--addr=0.0.0.0:8080", "--baseurl=/webdav", "/webdav"]

FROM base-headscale AS headscale
VOLUME /etc/headscale
VOLUME /var/lib/headscale
VOLUME /var/run/headscale
EXPOSE 8080
CMD ["serve"]

FROM base-nginx AS app

RUN rm /etc/nginx/conf.d/default.conf
COPY danielb.codes.conf /etc/nginx/conf.d/
COPY src /usr/share/nginx/html
