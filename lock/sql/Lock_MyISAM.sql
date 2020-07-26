-- -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- MyISAM Read Lock
-- Definition:
-- 1.A READ lock for a table can be acquired by multiple sessions at the same time. 
--   In addition, other sessions can read data from the table without acquiring the lock.
-- 2.The session that holds the READ lock can only read data from the table, but cannot write. 
--   And other sessions cannot write data to the table until the READ lock is released. The write operations from another session will be 
--   put into the waiting states until the READ lock is released.
-- 3.If the session is terminated, either normally or abnormally, MySQL will release all the locks implicitly. This feature is also relevant for the WRITE lock.
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add lock read to table
lock table city read;
select * from city;
-- Then choose another table without release the lock
select * from actor;
-- Show "SQL Error [1100] [HY000]: Table 'actor' was not locked with LOCK TABLES"

-- If update city table
update city set country_id  = 83 where city_id  = 2; -- Failed
-- Show "SQL Error [1099] [HY000]: Table 'city' was locked with a READ lock and can't be updated"

-- Release lock
unlock tables;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MyISAM Write Lock
-- Definition: 
-- 1.The only session that holds the lock of a table can read and write data from the table.
-- 2.Other sessions cannot read data from and write data to the table until the WRITE lock is released.
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
lock table city write;

-- Update city table in this query session (country_id  = 82)
update city set country_id  = 82 where city_id  = 2; -- Run successfully


-- Select city table in another session. Note it needs to run in a new query script
select * from city; -- Failed to run

-- Release
unlock tables;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Open tables in_user/locked status
show open tables;

-- Run lock table in another session. Note it needs to run in a new query script
lock table sales_by_store read;

-- Back to this session
show open tables; -- Check which table is in_use
-- select * from sales_by_store

-- 
unlock tables;

-- Show lock status
show status like 'Table_locks%';






