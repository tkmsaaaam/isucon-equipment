set global slow_query_log=1;
set global slow_query_log_file="/var/log/mysql/mysql-slow.log";
set global long_query_time=1;
SET global sql_log_bin=OFF;

SET global innodb_flush_log_at_trx_commit=2
SET global innodb_doublewrite=0
SET global max_connections=10000
SET global sql_log_bin = OFF
