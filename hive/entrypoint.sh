#! /bin/bash

# Mariadb
nohup /usr/libexec/mysqld > /var/log/mysqld.log &
sleep 3
/usr/bin/mysqladmin -u root password 'root' && schematool -initSchema -dbType mysql

# Hive
$HIVE_HOME/bin/hive --service metastore
