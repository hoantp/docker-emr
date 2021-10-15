#! /bin/bash

# SSH Server
/usr/sbin/sshd

# Hadoop
hdfs namenode -format
$HADOOP_HOME/sbin/start-all.sh
hadoop fs -mkdir -p /user/hive/warehouse

tail -f /opt/hadoop-3.2.1/logs/*.log
