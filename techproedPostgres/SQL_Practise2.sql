CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;
select * from employess;

-- 1) Tabloya company_industry isminde sütun ekleyiniz
alter table workers
add column company_industry varchar (50);

-- 2) TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers
add column worker_address varchar(100) default 'Miami, FL, USA'

-- 3) Tablodaki worker_address sütununu siliniz
alter table workers
drop column worker_address

-- 4) Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers 
rename company_industry to company_profession;

-- 5) Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees;
select * from employees;

-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employess add constraint title unique (id); -- olmayacak cunku ceo dan iki tane var










