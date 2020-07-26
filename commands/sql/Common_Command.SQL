-- Run the following command in iterm

-- login
mysql -h127.0.0.1 -p3306 -uroot -p1234;

-- with '-e' Not login mysql but can run sql query
mysql -h127.0.0.1 -p3306 -uroot -p1234 database_1 -e "select * from table1"; 

-- 
mysqladmin --help;

-- create db
mysqladmin -uroot -p1234 create 'database_2';

-- drop db
mysqladmin -uroot -p1234 drop 'database_2';

-- dump db
mysqldump -uroot -p1234 sakila language > language_dump_result.sql;

-- export table structure file and data file
mysqldump -uroot -p1234 -T /temp sakila language;

-- import table structure file
source xxx.sql;

-- show db details
mysqlshow -uroot -p1234  --count

























