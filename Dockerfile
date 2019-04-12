FROM freeradius/freeradius-server:3.0.19-alpine

LABEL MAINTAINER wanglin@dbca.cn

COPY config/clients.conf /etc/raddb/clients.conf
COPY config/authorize /etc/raddb/mods-config/files/authorize

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-f", "-X"]
