#! /bin/bash

# SSH Server
/usr/sbin/sshd

# Hadoop
hdfs namenode -format &&
    $HADOOP_HOME/sbin/start-all.sh

# Mariadb
nohup /usr/libexec/mysqld > /var/log/mysqld.log &
sleep 3 && /usr/bin/mysqladmin -u root password 'root' && schematool -initSchema -dbType mysql

# Hive
nohup $HIVE_HOME/bin/hive --service metastore > /var/log/hive.log &
hadoop fs -mkdir -p /user/hive/warehouse

# Presto
$PRESTO_HOME/bin/launcher run
