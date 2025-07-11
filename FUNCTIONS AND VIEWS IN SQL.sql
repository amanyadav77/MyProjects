select * from menu
select * from qtymast
select * from food_group
update menu set menu_price = 260 where mid = 1;
select *from menu order by mid asc;
select menu_name from menu where mid = 2;
select menu_name ,qty_type from menu,qtymast where menu.mid = menu.qid; 
select menu_name ,qty_type from menu,qtymast where qtymast.qid = 3 and mid = 2









----------------------------------------------------------------------------------------------------------------------------
--Functions in SQL

Select * from food_group

select * from qtymast
select gid ,group_name from food_group
UNION select qid,qty_type from qtymast;

select gid ,group_name from food_group
INTERSECT select qid,qty_type from qtymast;

SELECT menu_name,menu_price,(2*menu_price) as total from menu where mid = 1;
update menu set menu_price = 2*menu_price;
update menu set menu_price =menu_price/2;
--------------------------------
--BUILT IN FUNCTIONS IN SQL

select UPPER(name) from aman;
--TRIM FUNCTIONS
select UPPER(name),length(name) as namesize from aman;

SELECT 
    name, 
    LENGTH(name) AS name_length 
FROM 
    aman 
ORDER BY 
    name_length DESC 
LIMIT 1;
 
--replace 
select *from aman
select * from aman where id =2
select REPLACE(name,'an','ritz')name from aman where id = 3;
select menu_name from menu where mid = 2;

--USING RIGHT FUNCTION 

select RIGHT(menu_name,7) from menu where mid =2
select LEFT(menu_name,7) from menu where mid = 2
--MATHEMATICAL FUNCTIONS IN SQL

select abs(-10);
select Floor(10.9)
select ceil(10.1)
select round(10.3)
select round(10.6)


--USER DEFINED FUNCTIONS IN SQL:

CREATE OR REPLACE FUNCTION sqr(a numeric)
RETURNS integer AS $sq$
declare
 sq integer;
Begin
    sq := a;
 return sq*sq;
end;
$sq$ Language plpgsql;

select sqr(200);
  -- ANOTHER EXAMPLE OF USER DEFINED FUNCTIONS--

  create or replace function get_sum(a numeric,b numeric)
  returns integer as $$
 
  Begin 
   
    return a::integer + b:: integer;

	


  end;$$
  LANGUAGE plpgsql;

  select get_sum(2,4);
  


  ---VIEWS IN SQL-- 
  SELECT * from aman;
  create view Data as
  select name,email from aman;

  select *from Data;

  -- Procedure and trigger --

  Create or replace procedure menuupdate(midi INT)
 
  AS $$
  Begin 
   update menu set menu_price = 250
   where mid = midi;
     PERFORM (select menu_name,menu_price from menu where mid = midi);

	 RAISE NOTICE 'Updated Menu: %, Price: %', 
                 (SELECT menu_name FROM menu WHERE mid = midi),
                 (SELECT menu_price FROM menu WHERE mid = midi);




  end;$$
   language plpgsql;

  call menuupdate(2);
  select * from menu ;

  ---- Triggers -------------------------
  select * from aman
  insert into aman(name,email,mobile,age,city)values('xmmiro','xmiiro@gmail.com','5437898908',28,'Kanpor');
  Create table Audit(id serial,EMP_ID INT NOT NULL,ENTRY_DATE TEXT NOT NULL);
  CREATE OR REPLACE FUNCTION auditlog()
  returns TRIGGER as $$
  Begin
  insert into Audit(EMP_ID,ENTRY_DATE)VALUES(NEW.ID,current_timestamp);
  return NEW;
  end;
  $$ LANGUAGE plpgsql;
  create TRIGGER adt
  after insert on aman 
  for each row
  execute function auditlog();

  select * from Audit
---------------------------------------------------------------------------------------------------------------------

 insert into aman(name,email,mobile,age,city)values('iro','x56iro@gmail.com','5437894508',28,'Kanpur');
  Create table Audit(id serial,EMP_ID INT NOT NULL,ENTRY_DATE TEXT NOT NULL);
  CREATE OR REPLACE FUNCTION auditlog()
  returns TRIGGER as $$
  Begin
  insert into Audit(EMP_ID,ENTRY_DATE)VALUES(NEW.ID,current_timestamp);
  return NEW;
  end;
  $$ LANGUAGE plpgsql;
  create TRIGGER ast
  before update on aman 
  for each row
  execute function auditlog();


  $$ LANGUAGE plpgsql;
  create TRIGGER aut
  after update on aman 
  for each row
  execute function auditlog();


  create TRIGGER ait
  before delete on aman 
  for each row
  execute function auditlog();


  create TRIGGER act
  before insert on aman 
  for each row
  execute function auditlog();

  update aman set name ='ramayan' where id = 58;


  