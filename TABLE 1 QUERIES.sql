create table food_group(gid serial,group_name varchar(50))
insert into food_group(group_name)values('VEG')
insert into food_group(group_name)values('NON-VEG')
insert into food_group(group_name)values('DRINKS')
insert into food_group(group_name)values('STARTERS')
insert into food_group(group_name)values('CHINESE')
insert into food_group(group_name)values('SWEET')


--UPDATE QUERY
update fod_group set group_name = 'xyz' where gid = 1
--DELETE QUERY
delete from food_group;
--DROP QUERY (DELETES STRUCTURE WITH RECORD)
drop table food_group;