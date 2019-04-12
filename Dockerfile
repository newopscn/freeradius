FROM freeradius/freeradius-server:3.0.19-alpine

LABEL MAINTAINER wanglin@dbca.cn

# auth with password
COPY config/clients.conf /etc/raddb/clients.conf
COPY config/authorize /etc/raddb/mods-config/files/authorize

# module:sql
RUN apk add mariadb-connector-c
#RUN sed -i \
#	-e '/server = "localhost"/c\\tserver = "opsvpn-mysql"' \
#	-e '/password = "radpass"/c\\tpassword = "radpass123"' \
#	-e '/dialect = "sqlite"/c\\tdialect = "mysql"' \
#	-e '/driver = "rlm_sql_null"/c\\t#driver = "rlm_sql_null"' \
#	-e '/driver = "rlm_sql_${dialect}"/c\\tdriver = "rlm_sql_${dialect}"' \
#	-e '/sqllog.sql/s/^#//'\
#	 /etc/raddb/mods-available/sql
COPY config/sql /etc/raddb/mods-available/sql
RUN ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql
COPY config/default /etc/raddb/sites-available/default
COPY config/inner-tunnel /etc/raddb/sites-available/inner-tunnel

EXPOSE 1812/udp 1813/udp
