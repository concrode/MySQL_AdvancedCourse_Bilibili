-- regexp
select * from language where name REGEXP '^M';
select * from language where name REGEXP 'N$';
select * from language where name REGEXP 'n$';
select * from language where name REGEXP '[dr]';

-- 
SELECT ABS(-100);

-- 
select ceil(9.1);

-- 
select floor(8.8);

-- 
select rand(); -- {0 ~ 1}

-- 
select round(4.4);
select round(4.5);

-- 
select length('hello');

-- 
select concat('hi', 'java', 'hello');

-- 
select lower('adARRa');

-- 
select upper('adARRa');

-- 
select left('adARRa', 3);

-- 
select right('adARRa', 3);

-- 
select substring('adAeRRa', 2, 6); -- Index is from 1, not 0

-- 
select CURRENT_DATE(); 
select CURRENT_TIME(); 
select now(); 

-- 
select max(language_id) from `language` l ;


























