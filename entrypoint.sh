#! /bin/bash

# SSH Server
/usr/sbin/sshd

# Hadoop
hdfs namenode -format &&
    $HADOOP_HOME/sbin/start-all.sh

# Mariadb
nohup /usr/libexec/mysqld &
sleep 3
/usr/bin/mysqladmin -u root password 'root' && schematool -initSchema -dbType mysql

# Hive
# nohup $HIVE_HOME/bin/hive --service hiveserver2 &

# tail -f /dev/null
# bin/bash -c "tail -f $HADOOP_HOME/logs/*.log"
bin/bash
