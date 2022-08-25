-- ******* SELECT - SIMILAR TO - REGEX(Regular Expression) *******
/*
SIMILAR TO : Daha karmasik pattern(kalip) ile sorgulama islemi icin SIMIAR TO kullanilabilir
Sadece PostgreSQL'de kullanilir. Buyuk kucuk harf onemlidir.

REGEX : Herhangi bir kod, metin icerisinde  istenen yazi veya kod parcasinin aranip bulunmasini 
saglayan kendine ait bir soz dizimi olan bir yapidir.
MySQL'de (REGEXP_LIKE) olarak kullanilir.
PostgreSQL'de "~" karakteri ile kullanilir
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);



   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

-- Soru1 : İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya islemi icin | karakteri kullanilir
-- SIMILIR TO ile:
select * from kelimeler WHERE kelime SIMILAR TO '%(at|ot|Ot|oT|OT|At|aT|AT)%';
-- LIKE ile:
select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%';
-- REGEX ile:
select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at';

-- Soru2 : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
select * from kelimeler WHERE kelime SIMILAR TO 'ho%|hi%';
select * from kelimeler WHERE kelime ~~* 'ho%' or kelime ~~* 'hi%';
select * from kelimeler WHERE kelime ~* 'h[oi](.*)'; -- Regex'te ".(nokta)bir karakteri temsil eder"
-- h[oi] = h ile başlayan o veya i ile devam eden, * hepsi anlaminda kullanilir

-- Soru3 : Sonu 't' veya 'm' ile bitenleri listeleyeniz
select * from kelimeler WHERE kelime SIMILAR TO '%t|%m';
select * from kelimeler WHERE kelime ~~* '%t' or kelime ~~* '%m';
select * from kelimeler WHERE kelime ~* '(.*[tm]$)';-- $ : bitir anlaminda kullaniliyor

-- Soru4 : h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
select * from kelimeler WHERE kelime SIMILAR TO 'h[a-z,A-Z,0-9]t';
select * from kelimeler WHERE kelime ~~* 'h_t';
select * from kelimeler WHERE kelime ~* 'h[a-z,A-Z,0-9]t';
SELECT * from kelimeler where kelime ~* 'h(.)t$'

-- Soru5 : İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
-- SIMILIR TO ile:
select * from kelimeler WHERE kelime SIMILAR TO 'h[a-e](.*)%t' ;
-- REGEX ile:
select kelime from kelimeler WHERE kelime ~* 'h[a-e](.*)t' ;

-- Soru6 : İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime SIMILAR TO 's%|a%|y%'
-- REGEX ile:
select kelime from kelimeler WHERE kelime ~ '^[say].(.*)' -- ^baslangic'i temsil eder

-- Soru7 : Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
-- REGEX ile:
select kelime from kelimeler WHERE kelime ~'(.*)[maf]$'

-- Soru8 : İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select * from kelimeler WHERE kelime SIMILAR TO 'h[a|i]t'
-- REGEX ile:
select * from kelimeler WHERE kelime ~* 'h[a|i]t'

-- Soru9 : İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime SIMILAR TO '[h|H][a-z,A-Z,0-9][t|T]'
select * from kelimeler WHERE kelime ~ '^[b-s].l(.*)$'

-- Soru9 : içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select kelime from kelimeler WHERE kelime SIMILAR TO '%[o][o]%'
select kelime from kelimeler WHERE kelime SIMILAR TO '%[o]{2}%'-- suslu parantez icinde belirttigimiz rakam bir onceki koseli parantez icinde kac tane oldugunu belirtir
-- REGEX ile:
select kelime from kelimeler WHERE kelime ~ '(.*)o(.*)o(.*)'

-- Soru10 : içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select kelime from kelimeler WHERE kelime SIMILAR TO '%[o]{4}%'

-- Soru10 : 'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime SIMILAR TO '(s%|a%|y%)(.*)[m|f]' 
-- REGEX ile:
select kelime from kelimeler WHERE kelime ~ '(s|a|y)(.*)[m|f]' 




