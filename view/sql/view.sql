
select c.first_name, c.last_name , a.address, a.district from customer c, address a
where c.address_id  = a.address_id 

-- Create view
create view view_customer_address as select c.first_name, c.last_name , a.address, a.district from customer c, address a
where c.address_id  = a.address_id 

-- Read view
select * from view_customer_address

-- Update view
update view_customer_address set xx=xx where yy=yy -- The update operation will update data in basic table as well. But not recommended to do update operation

-- Check views and tables
show tables

-- 
show create view view_customer_address

-- 
drop view if exists xxxxx










