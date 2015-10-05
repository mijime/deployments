From debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV OS_VER          jessie
ENV CONFD_VER       0.10.0
ENV ZABBIX_VER      2.4
ENV DB_TYPE         mysql

ADD http://repo.zabbix.com/zabbix/${ZABBIX_VER}/debian/pool/main/z/zabbix-release/zabbix-release_${ZABBIX_VER}-1+${OS_VER}_all.deb /usr/local/src/
# ADD assets/zabbix-release_${ZABBIX_VER}-1+${OS_VER}_all.deb /usr/local/src/
RUN dpkg -i /usr/local/src/zabbix-release_${ZABBIX_VER}-1+${OS_VER}_all.deb
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    zabbix-frontend-php \
  && apt-get clean

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VER}/confd-${CONFD_VER}-linux-amd64 /usr/bin/confd
# ADD assets/confd-${CONFD_VER}-linux-amd64 /usr/bin/confd
RUN chmod +x /usr/bin/confd
ADD confd /etc/confd

EXPOSE 80

CMD [ "/command.sh" ]
ADD command.sh /command.sh
RUN chmod +x /command.sh
