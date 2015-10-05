FROM ruby

ENV CONFD_VER 0.10.0

CMD [ "fluentd" ]
EXPOSE 80 24224 24224/udp

WORKDIR /workspace
VOLUME /workspace

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VER}/confd-${CONFD_VER}-linux-amd64 /usr/bin/confd
# ADD assets/confd-${CONFD_VER}-linux-amd64 /usr/bin/confd
RUN chmod +x /usr/bin/confd
ADD confd /etc/confd

ENTRYPOINT [ "/entrypoint.sh" ]
ADD /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
