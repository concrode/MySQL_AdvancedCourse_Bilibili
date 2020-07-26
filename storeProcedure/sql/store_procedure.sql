select * from view_customer_address ;
show create view view_customer_address

-- create store proc
delimiter $
create procedure customer_address()
begin
	select * from customer c2 , address a2 where c2.address_id = a2.address_id ;
end $
delimiter ;

-- call store proc
call customer_address()

-- 
select name from mysql.proc where db = 'sakila'; 
-- actually it gets data from mysql -> Tables -> proc. Use select * from mysql.proc;
select * from mysql.proc;


-- Declare param
delimiter $
create procedure declare_int_param()
begin
	declare num int default 10;
	select concat(num, '_is_param');
end $
delimiter ;

-- Set param
delimiter $
create procedure set_int_param()
begin
	declare num int default 10;
	set num = num + 5;
	select concat(num, '_is_param');
end $
delimiter ;

-- Set param with into command
delimiter $
create procedure set_int_param()
begin
	declare num int;
	select count(*) into num from actor;
	select concat(num, '_is_param');
end $
delimiter ;

-- If else statement
delimiter $
create procedure person_height_desc()
begin 
	declare height int default 175;
	declare description varchar(50) default '';
	if height >= 180 then
		set description='You are higher than 180cm';
	elseif height >= 170 and height < 180 then
		set description='You are within 170cm and 180cm';
	else
		set description='You are clever I think';
	end if;
	select concat('Height_is:', height, '_And_Description_is:', description);
end $
delimiter ;

-- In params
delimiter $
create procedure person_height_desc(in height int)
begin 
	declare description varchar(50) default '';
	if height >= 180 then
		set description='You are higher than 180cm';
	elseif height >= 170 and height < 180 then
		set description='You are within 170cm and 180cm';
	else
		set description='You are clever I think';
	end if;
	select concat('Height_is:', height, '_And_Description_is:', description);
end $
delimiter ;

-- Out params
delimiter $
create procedure person_height_desc(in height int, out description varchar(100))
begin 
	if height >= 180 then
		set description='You are higher than 180cm';
	elseif height >= 170 and height < 180 then
		set description='You are within 170cm and 180cm';
	else
		set description='You are clever I think';
	end if;
end $
delimiter ;


-- In and Out params
select name from mysql.proc where db = 'sakila'; 
delimiter $
create procedure person_height_desc(in height int, out description varchar(100))
begin 
	if height >= 180 then
		set description='You are higher than 180cm';
	elseif height >= 170 and height < 180 then
		set description='You are within 170cm and 180cm';
	else
		set description='You are clever I think';
	end if;
end $
delimiter ;

call person_height_desc (182, @description)
select @description

-- Drop procedure
drop PROCEDURE iF EXISTS person_height_desc

-- Case statement
delimiter $
create procedure get_season(month int)
begin
	declare result varchar(20);
	case
		when month >=1 and month <=3 THEN 
			set result = '1ST Season';
		when month >=4 and month <=6 THEN 
			set result = '2nd Season';
	end case;
	select concat('Month:', month, 'Result:', result) as content;
end $
delimiter ;

-- while 
delimiter $
create procedure get_total(number int)
begin
	declare total int default 0;
	declare n int default 1;
	while n <= number do
		set total = total + n;
		set n = n + 1;
	end while;
	select total;
end $
delimiter ;

-- Repeat - if meets condition, then exit the loop
delimiter $;
create procedure get_total(n int)
begin
	declare total int default 0;
	
	repeat
		set total = total + n;
		set n = n - 1
		until n = 0
	end repeat;

	select total;
end $
delimiter ;


-- loop and leave
delimiter $
create procedure get_total(n int)
BEGIN 
	declare total int default 0;
	
	ins: LOOP
		if n <= 0 then
			leave ins;
		end if;
	
		set total = total + n;
		set n = n - 1;
	
	end loop ins;
	
	select total;
END $

delimiter ;


-- Cursor
select * from country LIMIT 2;
delimiter $
create procedure get_country_with_cursor()
begin
	declare c_id smallint;
	declare c_country varchar(50);	
	declare c_date timestamp;
	declare c_result cursor for select * from country limit 2;
	
	open c_result;

	fetch c_result into c_id, c_country, c_date;
	select concat('ID:', c_id, ',Name:', c_country, ',Date:', c_date);

	fetch c_result into c_id, c_country, c_date;
	select concat('ID:', c_id, ',Name:', c_country, ',Date:', c_date);
	
	close c_result;
end $

delimiter ;

DROP PROCEDURE get_country_with_cursor
call get_country_with_cursor()


-- Cursor in loop
select * from country LIMIT 2;
delimiter $
create procedure get_country_with_cursor()
begin
	declare c_id smallint;
	declare c_country varchar(50);	
	declare c_date timestamp;
	declare c_result cursor for select * from country;
	declare exit handler for not found set has_data=0;
	
	open c_result;

	repeat
		fetch c_result into c_id, c_country, c_date;
		select concat('ID:', c_id, ',Name:', c_country, ',Date:', c_date);
		until has_data = 0
	end repeat;
	
	close c_result;
end $

delimiter ;

DROP PROCEDURE get_country_with_cursor
call get_country_with_cursor()


-- Function
delimiter $
create function count_actor(actorId int)
returns INT
BEGIN 
	declare cnum int;
	select count(*) into cnum from actor where actor_id = actorId;

	return cnum;
END $
delimiter $;

select count_actor(2);

-- Trigger
show triggers;















































