#!/bin/sh
## modified by wanxg 2009-12-21

# --------parameter defination, important-----
dst_mysql_backup_dir="/app/mysql_backup"
today=`date +%Y-%m-%d`
# defination end

# list needed backup database name
    for db_name in testdb1 testdb2 testdb3
         do
             if test ! -e $dst_mysql_back_dir/$db_name/$db_name.$today
                 then
                     echo "create database ${db_name} backup files..."
                     mkdir -p $dst_mysql_back_dir/$db_name/
                     chmod -R 777 $dst_mysql_back_dir/$db_name/
             fi

        echo "backup $db_name...";
        /usr/local/mysql5.6.17/bin/mysqldump -uroot -palb2c3\$4%5JQK -S /data/mysql.sock -R $db_name>$dst_mysql_back_dir/$db_name/${db_name}${today}_pf.sql
    done
