-- ***** LIMIT *****(kac veri getirmesini istedigimizde kullaniriz)

-- Soru1 : listeden ilk 5 veriyi listeleyiniz
select * from kisiler order by id limit 5

-- Soru2 : ilk 2 veriden sonra 5 veriyi listeleyiniz
select * from kisiler limit 5 OFFSET 2

-- Soru3 : id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler where id>5 limit 2

-- Soru4 : En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 OFFSET 3 --(offset 3 --> 3'ten sonrasini sec)



















