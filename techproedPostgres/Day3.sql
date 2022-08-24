CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tum degerlerin benzersiz yani tek olmasini saglar
maas int NOT NULL,-- NOT NULL --> Bir sutunun NULL icermemsini yani bos olmamasini saglar
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
-- INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');-- UNIQUE
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- UNIQUE
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--PRIMARY KEY

select * from calisanlar;

-- ******* FOREIGN KEY ******  
CREATE TABLE adresler(
adres_id char(5),
sokak varchar(20),	
cadde varchar(30),
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar (id)
);
-- *** NOT: Foreign key
-- *** NOT: Primary key

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child tabloya ekleme yapamayiz

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

-- Calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;

DROP table calisanlar;// baska bir child(adresler) ile baglantısı oldugu icin silmedi

delete from calisanlar WHERE id = '10002'; --Parent (oncelikle childi sonra parenttakini silmemiz gerekiyor)

delete from adresler WHERE adres_id = '10002'; -- Child (oncelikle bunu sonra parenttakini silmemiz gerekiyor)

drop table calisanlar; // parenttan once child'da silmemiz gerekli

-- ******* ON DELETE CASCADE *******
-- Her defasinda once child tablodaki verileri silmek yerine ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz
-- Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
	
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);


CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
ON DELETE CASCADE -- bunu yazinca direkt parent'ta silebiliyorum
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
	
select * from talebeler;
select * from notlar;

delete from notlar WHERE talebe_id = '123';
	
delete from talebeler WHERE id = '126';	-- ON DELETE CASCADE kullandigimiz icin PARENT table'dan direkt silebildik
-- Parent table'dan sildigimiz icin child table'dan da silinmis olur
	
delete from talebeler;

DROP table talebeler CASCADE; -- PArent tabloyu kaldirmak istersek Drop table tablo_adi'ndan sonra 
-- CASCADE komutunu kullaniriz

-- Soru: Talebeler tablosundaki isim sutununu NOT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak degistiriniz
ALTER table talebeler
ALTER column isim TYPE VARCHAR(30), -- TYPE ile data turunu degistirdik
ALTER column isim SET NOT NULL; -- SET ile 

-- talebeler tablosundaki yazili_notu sutununa 60'dan buyuk sayi yazilabilsin
ALTER TABLE talebeler 
add CONSTRAINT sinir CHECK(yazili_notu>60);

INSERT INTO talebeler VALUES(128, 'Mustafa Can', 'Hasan',45); -- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler
select * from ogrenci_adres;

-- Tablodaki bir sutuna PRIMARY KEY ekleme
ALTER TABLE ogrenciler 
ADD PRIMARY KEY (id);
	
-- *** PRIMARY KEY olusturmada 2.yol
ALTER TABLE ogrenciler
ADD CONSTRAINT pk_id PRIMARY KEY (id);

-- *** PK'dan sonra FK atamasi
ALTER TABLE ogrenci_adres
ADD FOREIGN KEY(id) REFERENCES ogrenciler 
-- *** Not: Child tabloyu parent tablodan olusturdugumuz icin sutun adi verilmedi

-- *** FK'deki CONSTRAINT silme islemi
ALTER TABLE ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;
-- *** PK'deki CONSTRAINT silme islemi
ALTER TABLE ogrenciler DROP CONSTRAINT pk_id;

-- Soru1: Yazili notu 85'den buyuk olan talebe bilgilerini getirin
select * from talebeler WHERE yazili_notu>85

-- Soru2: Ismi 'Mustafa Bak' olan talebenin tum bilgilerini getirin
select * from talebeler WHERE isim = 'Mustafa Bak'

-- ******* SELECT komutunda -- BETWEEN kosulu *******
-- Between belirttiginiz iki veri arasindaki bilgileri listeler
-- Betwenn'de belirttigimiz degerler de listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
  	AND (ve) : Belirtilen sartlarin her ikisi de gerceklesiyorsa
o kayit listelenir, bir tanesi gerceklesmesse listelemez
  Select * from matematik_sinavi > 50 AND sinav2 > 50
Hem mat sinavi hem de sinav2 alani 50'den buyuk olan kayitlari listeler
	OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler 

select * from personel;

-- Soru1: id'si 1003 ile 1005 arasinda olan personel bilgisini listeleyiniz
select * from personel WHERE id BETWEEN '1003' AND '1005';
-- 2.yol:
select * from personel WHERE id>='1003' AND id<='1005';

-- Soru2: Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz
select * from personel WHERE isim BETWEEN 'Derya Soylu' AND 'Yavuz Bal';

-- Soru3: maasi 70000 veya ismi Sena olan personeli listele
select * from personel WHERE maas = 70000 OR isim = 'Sena Beyaz'

-- *** IN : Birden fazla mantıksal ifade ile tanimlayabilecegimiz durumlari 
-- tek komutta yazabilme imkani verir
-- Farkli sutunlar icin IN kullanilamaz

-- Soru4: id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
select * from personel WHERE id = '1001' or id= '1002' or id = '1004';

-- 2.yol:
select * from personel WHERE id IN ('1001','1002','1004');

-- Soru5:Maasi sadece 70000, 100000 olan personeli listele
select * from personel WHERE maas in(70000,100000);

/*
******* SELECT - LIKE kosulu *******
LIKE : Sorgulama yaparken belirli (pattern)kalip ifadeleri kullanabilmemizi saglar
ILIKE : Sorgulama yaparken buyuk/kucuk harfe duyarsiz olarak eslestirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~~
NOT ILIKE : !~~*

% --> 0 veya daha fazla karakteri belirtir
_ --> Tek bir karakteri belirtir
*/

-- Soru6 : Ismi A harfi ile baslayan personeli listele
select * from personel Where isim LIKE 'A%'; // A ile baslasin sonu ne olursa olsun demek

-- Soru7: Ismi t ile biten personeli listele
select * from personel Where isim LIKE '%t' // basi ne olursa olsun t ile bitenler

-- Soru8 : Isminin 2.harfi e olan personeli listeleyiniz
select * from personel Where isim LIKE '_e%'

-- Soru9 :Isminin 3.harfi r olan personeli listeleyiniz
select * from personel Where isim LIKE '__r%'


