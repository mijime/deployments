#!/bin/bash
nginx -c /etc/nginx/nginx.conf

if [[ -z "${USE_SSL}" ]]
then
  docker-gen -watch \
    -notify "nginx -s reload" \
    /etc/docker-gen/templates/nginx.tmpl \
    /etc/nginx/conf.d/default.conf
else
  docker-gen -watch \
    -notify "nginx -s reload" \
    /etc/docker-gen/templates/nginx-ssl.tmpl \
    /etc/nginx/conf.d/default.conf
fi
