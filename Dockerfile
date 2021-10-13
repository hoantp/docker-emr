FROM amazoncorretto:8u302

RUN yum install -y tar gzip

ENV HADOOP_VERSION=3.2.1
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

# COPY hadoop-$HADOOP_VERSION.tar.gz /tmp/hadoop.tar.gz

RUN curl -L $HADOOP_URL -o /tmp/hadoop-$HADOOP_VERSION.tar.gz \
 && tar xzf /tmp/hadoop.tar.gz -C /opt \
 && rm -f /tmp/hadoop.tar.gz

ENV HADOOP_HOME=/opt/hadoop_$HADOOP_VERSION
ENV HADOOP_CONF_HOME=/opt/hadoop_$HADOOP_VERSION/etc/hadoop
ENV HADOOP_MAPRED_HOME=/opt/hadoop_$HADOOP_VERSION
ENV HADOOP_COMMON_HOME=/opt/hadoop_$HADOOP_VERSION
ENV HADOOP_HDFS_HOME=/opt/hadoop_$HADOOP_VERSION
ENV YARN_HOME=/opt/hadoop_$HADOOP_VERSION
ENV PAHT=/opt/hadoop_$HADOOP_VERSION/bin:$PATH
