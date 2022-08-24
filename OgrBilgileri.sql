/*
DDL - DATA DEFINATION LANG.DATA
CREATE - ALTER - DROP
*/
CREATE table ogrenci (
ogr_no int,
ogr_isimsoyisim VARCHAR(30),    
notlar REAL,
yas INT,    
adres VARCHAR(50),
kayit_tarih DATE            
);
--VAR OLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE table ogr_notlari
AS
SELECT ogr_no, notlar FROM ogrenci;
SELECT * FROM ogrenci;
SELECT * FROM ogr_notlari;