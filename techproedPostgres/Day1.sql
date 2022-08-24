/*
DDL - DATA DEFINATION LANG. 
CREATE - ALTER - DROP 
*/
-- CREATE - TABLO OLUSTURMA-
CREATE table ogrenci ( 
ogr_no int,
ogr_isim VARCHAR(30),
notlar REAL,
yas INT,
adres VARCHAR(50),

kayit_tarih DATE
);
-- VAROLAN TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE ogr_notlari
AS 
SELECT ogr_no, notlar from ogrenci; 

SELECT * FROM ogrenci; 
SELECT * FROM ogr_notlari;



