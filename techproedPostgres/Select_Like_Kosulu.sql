-- ******* SELECT - LIKE kosulu *******
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

-- Soru10 : 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select * from personel Where isim ILIKE 'a%n'

-- Soru11 :ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select * from personel Where isim LIKE '_a_u%'

-- Soru12 :İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel Where isim ~~* '%e%' and isim ~~* '%r%'

-- Soru13 :İçinde 'm' ve 'e' bulunan personel isimlerini listeleyiniz
select isim from personel Where isim ~~* '%m%' and isim ~~* '%e%'

-- Soru14 : 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select isim from personel Where isim ~~* '_e%' and isim ~~* '%y%'
-- 2.yol
select isim from personel Where isim ~~* '_e%y%' 

-- Soru15 : a harfi olmayan personeli listeleyin
select isim from personel Where isim !~~* '%a%' 

-- Soru16 : 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel Where isim ~~* 'A_____a%'

-- Soru17 : a harfi olmayan personeli listeleyin
select * from personel where isim not like '%a%'

-- Soru18 : Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select isim from personel where isim like '%r_'








