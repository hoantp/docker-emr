FROM amazoncorretto:8u302

RUN yum install -y tar gzip util-linux hostname \
                   procps openssh-server openssh-clients

# SSH
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N "" \
 && cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys \
 && chmod 600 /root/.ssh/authorized_keys \
 && /usr/bin/ssh-keygen -A

EXPOSE 22

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

COPY conf/core-site.xml $HADOOP_CONF_DIR
COPY conf/hdfs-site.xml $HADOOP_CONF_DIR
COPY conf/mapred-site.xml $HADOOP_CONF_DIR
COPY conf/yarn-site.xml $HADOOP_CONF_DIR
COPY conf/hadoop-env.sh $HADOOP_CONF_DIR

# Run
COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
