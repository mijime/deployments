FROM nginx:1.9

ENV VERSION 0.4.0

ADD https://github.com/jwilder/docker-gen/releases/download/${VERSION}/docker-gen-linux-amd64-${VERSION}.tar.gz /usr/local/src/docker-gen.tar.gz

RUN tar xfz /usr/local/src/docker-gen.tar.gz -C /usr/bin

RUN chmod +x /usr/bin/docker-gen

ADD /templates /etc/docker-gen/templates

CMD [ "/entrypoint.sh" ]

ADD /entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
