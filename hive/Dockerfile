FROM amazoncorretto:8u302

# MariaDB
RUN yum install -y tar gzip mariadb-server hostname \
 && mysql_install_db --user=mysql
COPY mariadb/my.cnf /etc

# Hive
ENV HIVE_VERSION=3.1.2
ENV HIVE_URL=https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

ENV GUAVA_VERSION=27.0
ENV GUAVA_URL=https://repo1.maven.org/maven2/com/google/guava/guava/$GUAVA_VERSION-jre/guava-$GUAVA_VERSION-jre.jar

COPY apache-hive-$HIVE_VERSION-bin.tar.gz /tmp/hive.tar.gz

# RUN curl -L $HIVE_URL -o /tmp/hive.tar.gz \
RUN tar xzf /tmp/hive.tar.gz -C /opt \
 && rm /opt/apache-hive-$HIVE_VERSION-bin/lib/guava-19.0.jar \
 && curl -L $GUAVA_URL -o /opt/apache-hive-$HIVE_VERSION-bin/lib/guava-$GUAVA_VERSION-jre.jar \
 && rm -f /tmp/hive.tar.gz

COPY conf/hive-site.xml /opt/apache-hive-$HIVE_VERSION-bin/conf
COPY mariadb/mysql-connector-java.jar /opt/apache-hive-$HIVE_VERSION-bin/lib

ENV HIVE_HOME=/opt/apache-hive-$HIVE_VERSION-bin \
    PATH=/opt/apache-hive-$HIVE_VERSION-bin/bin:$PATH

EXPOSE 10000

ENV HADOOP_HOME=/

# Run
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
