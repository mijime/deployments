FROM nginx

RUN apt-get update \
      && apt-get install -yq phpldapadmin php5-fpm supervisor \
      && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf" ]

COPY /supervisor/program.conf /etc/supervisor/conf.d/program.conf

COPY /nginx/default.conf /etc/nginx/conf.d/default.conf

COPY /php5/www.conf /etc/php5/fpm/pool.d/www.conf

COPY /scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80 443
