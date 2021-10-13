FROM amazoncorretto:8u302

RUN amazon-linux-extras install -y epel \
 && yum install -y tar gzip util-linux vim hostname \
    procps openssh-server openssh-clients supervisor

# SSH
COPY ssh /root/.ssh
EXPOSE 22

RUN /usr/bin/ssh-keygen -A \
 && chmod 600 /root/.ssh/authorized_keys /root/.ssh/id_rsa

# Hadoop
ENV HADOOP_VERSION=3.2.1
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

COPY hadoop-$HADOOP_VERSION.tar.gz /tmp/hadoop.tar.gz

# RUN curl -L $HADOOP_URL -o /tmp/hadoop.tar.gz \
RUN tar xzf /tmp/hadoop.tar.gz -C /opt \
 && rm -f /tmp/hadoop.tar.gz

ENV HDFS_NAMENODE_USER="root" \
    HDFS_DATANODE_USER="root" \
    HDFS_SECONDARYNAMENODE_USER="root" \
    YARN_RESOURCEMANAGER_USER="root" \
    YARN_NODEMANAGER_USER="root"

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION \
    HADOOP_CONF_DIR=/opt/hadoop-$HADOOP_VERSION/etc/hadoop \
    HADOOP_MAPRED_HOME=/opt/hadoop-$HADOOP_VERSION \
    HADOOP_COMMON_HOME=/opt/hadoop-$HADOOP_VERSION \
    HADOOP_HDFS_HOME=/opt/hadoop-$HADOOP_VERSION \
    YARN_HOME=/opt/hadoop-$HADOOP_VERSION \
    PATH=/opt/hadoop-$HADOOP_VERSION/bin:$PATH

COPY hadoop/core-site.xml $HADOOP_CONF_DIR
COPY hadoop/hdfs-site.xml $HADOOP_CONF_DIR
COPY hadoop/mapred-site.xml $HADOOP_CONF_DIR
COPY hadoop/yarn-site.xml $HADOOP_CONF_DIR
COPY hadoop/hadoop-env.sh $HADOOP_CONF_DIR

# Hbase
# ...


# Hive
ENV HIVE_VERSION=3.1.2
ENV HIVE_URL=https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

COPY apache-hive-$HIVE_VERSION-bin.tar.gz /tmp/hive.tar.gz

# RUN curl -L $HIVE_URL -o /tmp/hive.tar.gz \
RUN tar xzf /tmp/hive.tar.gz -C /opt \
 && rm -f /tmp/hive.tar.gz

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
