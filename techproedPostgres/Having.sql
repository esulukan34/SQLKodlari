CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

--Soru1) Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.

SELECT name, SUM(salary) AS "Total Salary" 
FROM workers 
GROUP BY name 
HAVING SUM(salary) > 2500; ---> Group by ardindan 'Where' kullanilmaz.

--Soru2) Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
SELECT state, COUNT(state) AS number_of_emplyoees
FROM workers 
GROUP BY state 
HAVING COUNT(state) > 1; -- HAVING, Group By ardindan filtreleme icin kullanilir.

--Soru3) Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
SELECT state,MAX(salary)
FROM workers 
GROUP BY state 
HAVING MAX(salary) < 3000;

--Soru4) Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
SELECT company,MIN(salary)
FROM workers 
GROUP BY company 
HAVING MIN(salary) > 2000;

--Soru5) Tekrarsız isimleri çağırın.
SELECT DISTINCT name 
FROM workers

--Soru6) Name değerlerini company kelime uzunluklarına göre sıralayın.
SELECT name,id, company 
FROM workers
ORDER BY LENGTH(company);

--Soru7) Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
-- Concat() fonksiyonu birden fazla sutun veya String degerini birlestirmek icin kullanilir
-- 1.Yol
SELECT CONCAT (name, '-', state) AS name_and_state --> CONCAT, birlestirme yapiyor
FROM workers
ORDER BY LENGTH(CONCAT (name,state));

--2.Yol
SELECT name || ' ' || state || ' ' || LENGTH(CONCAT (name,state)) --> || toplama yaparak yazdik
FROM workers
ORDER BY LENGTH(CONCAT (name,state));









