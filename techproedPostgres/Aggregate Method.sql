-- ***** AGGREGATE METHOD KULLANIMI *****
/*
Aggregate methodlari (SUM(topla),COUNT(say),MIN,MAX,AVG(ortalama))
Subquery icinde de kullanilir
Ancak sorgu tek bir deger donduruyor olmalidir
SYNTEX: sum() seklinde olmali sum () arasinda bosluk olmamali
*/

select * from calisanlar2

-- Calisanlar2 tablosundaki en yuksek maas degerini listeyiniz
SELECT max(maas) from calisanlar2

--Calisanlar2 tablosundaki maaslarin toplamini listeleyiniz 
SELECT sum(maas) from calisanlar2

--Calisanlar tablosundaki maas ortalamalarını listeleyiniz
SELECT avg(maas) from calisanlar2
Select round(avg(maas)) from calisanlar2
Select round(avg(maas),2) from calisanlar2

--Calisanlar tablosundaki kac kisinin maas aldigini listeleyiniz

SELECT count(maas) from calisanlar2
SELECT * from markalar

-- Soru1 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

select marka_isim, calisan_sayisi, (select sum(maas) from calisanlar2 
WHERE marka_isim = isyeri) AS toplam_maas from markalar

--Soru2 : Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum 
--maasini listeleyen bir Sorgu yaziniz.

select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas from markalar

--Soru3 :Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, 
(select count(sehir) from calisanlar2 where marka_isim=isyeri) AS sehir_sayisi from markalar

--Soru4(interview) : En yüksek ikinci maas değerini çağırın.
select max(maas) AS enyuksek_ikincimaas from calisanlar2 
WHERE maas < (select max(maas) from calisanlar2)

--En yüksek ucuncu maas değerini çağırın.
select max(maas)as enYuksek_ucuncumaas from calisanlar2 where
maas<(select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2))

--Soru5(interview) :En düşük ikinci maas değerini çağırın.
select min(maas) AS endusuk_ikincimaas from calisanlar2
WHERE maas > (select min(maas) from calisanlar2)

-- En dusuk ucuncu maas değerini çağırın.
select min(maas) AS endusuk_ucuncumaas from calisanlar2 
where maas>(select min(maas) from calisanlar2 where maas>(select min(maas) from calisanlar2))



