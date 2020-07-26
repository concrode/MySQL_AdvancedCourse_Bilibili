-- show error log
show variables like 'log_error%';

then shows ->
log_error:/usr/local/mysql/data/mysqld.local.err
log_error_verbosity:3

-- 
mysql % mysql -uroot -pRt393496296 -e 'SHOW VARIABLES' | grep log_bin
mysql --verbose --help | grep my.cnf

-- show bin log
show variables like '%log_bin%'

-- Create /usr/local/mysql/etc/my.cnf, then restart
[mysqld]
log-bin = mysql-bin 
binlog-format = STATEMENT
server_id = 1 

-- 
select * from language; 
update language set name = 'Japanese' where language_id = 3;

-- check bin log
sudo mysqlbinlog mysql-bin.000001

-- Go to /usr/local/mysql/etc/my.cnf
set binlog-format = ROW

-- Go to /usr/local/mysql/data read bin log file
sudo mysqlbinlog -vv mysql-bin.000002

-- Delete bin log
Reset Master

-- Record all CRUD queries in general log, set the following in mysql.cnf
general_log=1
general_log_file=xxx.log

-- Record slow query into log file, set the following in mysql.cnf
slow_query_log=1
slow_query_log_file=xxx.log
long_query_time=10 				-- 10 seconds

show variables like 'long_query_time';
show variables like 'slow_query_log';

--  use mysqldumpslow to check slow query log file
mysqldumpslow slow_log.log








