-- -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- InnoDB
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Isolation
show variables LIKE 'tx_isolation';

-- show table details
describe actor ;
show create table actor;

-- page size (xx B)
show global status like 'Innodb_page_size';

-- KB
select 16384/1024;

-- Shut down autocommit
set autocommit  = 0;

select * from language;
-- Original: 4->Mandarin->2006-02-15 
Update language set name = 'Mandarin' where language_id  = 4;

-- In another session (call it session2)
set autocommit  = 0;
Update language set name = 'Shanghai2' where language_id  = 4;

-- In this session
commit;

-- In session2
-- update successfully;

-- In this session
select * from language; -- Found name still equals 'Shanghai', NOT 'Shanghai2'!!!

-- In this session, Let's commit again
commit;

-- In this session
select * from language;  -- Now we can see 'Shanghai2'

-- If INSERT,UPDATE AND DELETE for different rows, no conflict for innoDB engine

-- show index
show index from `language`;  -- show index from `language`\G; (Used in iterm)

-- row-level lock up to table-level lock
-- If query data type is invalid (if DB needs transforms data type), it will up row-level to table-level lock
-- eg, Update language set name = 'Shanghai2' where language_id  = '4'; (language_id should be 4, not '4')


-- Gap lock
-- Update language set name = 'Shanghai2' where language_id  < 4;
-- If id=1, id=3 exist and id=2 does not exist
-- When running the above update query, it will lock id=1 and id=3, for id=2, even it does not exist, id=2 still be locked!


-- show row lock status
show status like 'innodb_row_lock%';



































