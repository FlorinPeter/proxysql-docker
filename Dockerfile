FROM centos:7

ENV VERSION v2.0.0-rc2

RUN yum install -y wget procps perl-DBD-MySQL && \
    wget https://github.com/sysown/proxysql/releases/download/v2.0.0-rc2/proxysql-rc2-2.0.0-1-centos7.x86_64.rpm -O /opt/proxysql-rc2-2.0.0-1-centos7.x86_64.rpm && \
    rpm -i /opt/proxysql-rc2-2.0.0-1-centos7.x86_64.rpm && \
    rm -f /opt/proxysql-rc2-2.0.0-1-centos7.x86_64.rpm

VOLUME /var/lib/proxysql
EXPOSE 6032 6033

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
