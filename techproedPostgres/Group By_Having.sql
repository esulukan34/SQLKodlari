-- ***** GROUP BY - HAVING *****
/*
HAVING ifadesinin islemi WHERE ifadesininkine cok benziyor
Ancak kumeleme fonksiyonlari ile WHERE ifadesi birlikte
kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur. 
GROUP BY ile kullanilir, gruplamadan sonraki sart icin 
group by dan sonra HAVING kullanilir
*/

--Soru1 : Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas),1) as maas_ortalamasi from personel 
WHERE cinsiyet = 'E'
group by ulke 
HAVING avg(maas)>3000

--Odev : Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
