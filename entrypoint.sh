#! /bin/bash

# SSH Server
/usr/sbin/sshd

# Hadoop
hdfs namenode -format &&
    $HADOOP_HOME/sbin/start-all.sh

# Hive
# nohup $HIVE_HOME/bin/hive --service hiveserver2 &

# tail -f /dev/null
# bin/bash -c "tail -f $HADOOP_HOME/logs/*.log"
bin/bash
