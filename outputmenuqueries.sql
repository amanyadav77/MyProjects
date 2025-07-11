select * from food_group;
select * from menu
ALTER table menu ADD qid int;
update menu set qid=2;
update menu set qid=1 where mid=11
select menu_name,menu_price,group_name,qty_type from food_group,menu,qtymast where food_group.gid=menu.gid and qtymast.qid=menu.qid


