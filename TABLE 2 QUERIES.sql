CREATE TABLE menu (mid SERIAL ,menu_name VARCHAR(50),menu_price INT,gid INT,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
select * from menu;
select * from food_group;
update food_group set group_name ='SWEET' where gid = 9;
insert into menu(menu_name,menu_price,gid)values('PANEER',250,1)
insert into menu(menu_name,menu_price,gid)values('CHICKEN BIRYANI',200,2)
insert into menu(menu_name,menu_price,gid)values('WATER',20,3)
insert into menu(menu_name,menu_price,gid)values('MASALA PAPAD',100,4)
insert into menu(menu_name,menu_price,gid)values('NOODLES',150,5)
insert into menu(menu_name,menu_price,gid)values('GULABJAM',100,9)
select menu_name,menu_price,group_name from menu,food_group; --WITHOOUT FILTERATION COMBINATIONS
select menu_name,menu_price,group_name from menu,food_group where food_group.gid = menu.gid; --WITH FILTERATION COMBINATIONS
INSERT INTO menu (menu_name, menu_price, gid) 
VALUES 
    ('SOYACHAAP', 150, 1),
    ('MUTTON BIRYANI', 300, 2),
    ('JUICE', 30, 3),
    ('FRENCH FRIES', 100, 4),
    ('MANCHURIAN', 200, 5),
    ('RASMALAI', 100, 9);

																																																																																																																																																																																					