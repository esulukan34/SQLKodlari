CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)						-- sirket id ler ortak oldugu icin bu field lardan baglanti kuruldu
);												-- sirketler 	 	 	siparisler
INSERT INTO sirketler VALUES(100, 'Toyota');	-- 100 null						
INSERT INTO sirketler VALUES(101, 'Honda');		-- 101 ++					101 ++
INSERT INTO sirketler VALUES(102, 'Ford');		-- 102 ++					102 ++
INSERT INTO sirketler VALUES(103, 'Hyundai');	-- 103 ++					103 ++	
CREATE TABLE siparisler													 -- 104 null
(																		 -- 105 null
	siparis_id int,
	sirket_id int,-- Ortak degerler
	siparis_tarihi DATE
);
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;

-- SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve
-- siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT A.sirket_id, A.sirket_isim, B.siparis_id, B.siparis_tarihi
FROM siparisler AS B 
INNER JOIN sirketler AS A
ON B.sirket_id = A.sirket_id
 
-- SORU2: sirketler tablosundaki tum sirketleri(isimler)ve bu sirketlere ait olan
-- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT A.sirket_isim, B.siparis_id, B.siparis_tarihi 
FROM siparisler AS B
RIGHT JOIN sirketler AS A
ON B.sirket_id = A.sirket_id;
-- ONEMLI NOT : FROM'dan sonra hangi tabloyu yazarsak ona gore left veya right sececegiz

SELECT B.sirket_isim, A.siparis_id, A.siparis_tarihi 
FROM sirketler AS B
LEFT JOIN siparisler AS A
ON B.sirket_id = A.sirket_id;

-- UNION ile cozum :
SELECT A.sirket_isim, B.siparis_id, B.siparis_tarihi 
FROM siparisler AS B
RIGHT JOIN sirketler AS A
ON B.sirket_id = A.sirket_id

UNION 

SELECT B.sirket_isim, A.siparis_id, A.siparis_tarihi 
FROM sirketler AS B
LEFT JOIN siparisler AS A
ON B.sirket_id = A.sirket_id;

-- FULL JOIN ile
select a.sirket_isim ,b.siparis_id,b.siparis_tarihi
from sirketler as a
full join
siparisler as b
on a.sirket_id=b.sirket_id;
 
 
-- SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
-- bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
SELECT B.sirket_isim, B.sirket_id, A.siparis_id, A.siparis_tarihi 
FROM sirketler AS B
FULL JOIN siparisler AS A 
ON B.sirket_id = A.sirket_id;
 







