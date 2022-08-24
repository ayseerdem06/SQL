-- Personel tablosu oluşturalım 
CREATE TABLE personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar (50)
);
select * from personel;
--Varolan personel tablosundan pers_id,sehir,
--adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
CREATE TABLE personel_adres
as
select 	pers_id, sehir from personel;
select * from personel;

--DML DATA MANIPULATION LANGUAGE
--INSERT --UPDATE -- DELETE
insert into personel values (100, 'Ayşe Erdem', 'Ankara', 10000, 'A', 'Altındağ Ankara');
insert into personel values (101, 'Emsal Efe ', 'Ankara', 12000, 'B', 'Mamak Ankara');
insert into personel values (102, 'Yasemin Türker', 'İstanbul', 11000, 'C', 'Beşiktaş İstanbul');
insert into personel values (103, 'Esra Demirci', 'İzmir', 13000, 'D', 'Karşıyaka İzmir');

select * from personel;

-- listeye yeniden isim eklemek istediğimizde
insert into personel (isim,sehir) values ('Hatice Çolak','Erzincan');
select isim from personel;  -- sadece istenen bir veriyi görmek istediğimizde kullanırız
select * from personel WHERE maas>11000;  -- koşullu arama yapmak istediğimde WHERE kullanırız.
delete from personel WHERE maas=10000;

--DDL DATA DEFINITION LANGUAGE
--CREATE --ALTER --DROP --SET --RENAME --ADD
--Set, Rename ve Add ana 3 komutun (Create, Alter, Drop) alt komutlari gibi
-- ALTER : sütun  , DROP: Silme , RENAME: değiştirme , ADD: ekleme 

create table fabrika(
pers_id serial,
isim varchar(20),
soyisim varchar(20),
brans varchar(20),
yas int,
maas int,
sehir varchar(20)
);
select * from fabrika;
alter table fabrika add sigorta char(3), add rutbe char(15);
-- alter add ile fabrika tablomuza sigorta ve rutbe sütunu ekledik 
alter table fabrika rename column isim to ad;
alter table fabrika rename column soyisim to soyad;
-- alter rename ile istediğimiz sutunun adında değişiklik yapabiliriz 
alter table fabrika drop column rutbe;
-- alter drop column ile istediğimiz sütünu yada istediğimiz tablonun tamamını silebiliriz. 
select * from fabrika;
insert into fabrika values (105, 'Esra', 'Demirci', 'Boya', 33, 10000, 'Ankara');
insert into fabrika values (104, 'Huseyin', 'Nohut', 'Zimpara', 34, 11000, 'Van');
insert into fabrika values (101, 'Selim', 'Deniz', 'Ulastirma', 40, 12000, 'Ardahan');
insert into fabrika values (103, 'Gulsah', 'Spring', 'Elektrik',41, 15000, 'Sinop');
insert into fabrika values (100, 'Hatice', 'Colak', 'Tesisat', 35, 19000, 'Usak');
insert into fabrika values (102, 'Mert', 'Demirci', 'Yukleme', 45, 15000, 'Manisa');
delete from fabrika WHERE brans='Boya';
-- delete ile bransa göre where şartına bağlı olarak istediğimiz veriyi sildik 
select * from fabrika;
insert into fabrika values (106, 'Ayşe', 'Erdem','Mobilya',40, 15000, 'Ankara');

create table ogrencıler(
id serial,
adsoyad varchar(30),
babadi varchar(15),
yazılıNotu serial
);
insert into ogrencıler values(default, 'Ali Can', 'Hasan',75);
insert into ogrencıler values(default, 'Ahmet Şen', 'Hüseyin',80);
insert into ogrencıler values(default, 'Derya Çam', 'Ali',60);

select * from ogrencıler;

--TCL - Transaction Control Lang.
--Begin - Savepoint - rollback - commit
--Transaction veritabanı sistemlerinde bir işlem başladığında başlar ve işlem bitince sona erer
--Bu işlemler veri tabanı oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir

Begin;
insert into fabrika values (default, 'Emsal','Efe','Mus. Hizm.',40, 18000,'Konya');
insert into fabrika values (default, 'Avni','Sen','Boya',36, 15000,'Kastamonu');
select * from fabrika;
savepoint x;
insert into fabrika values (default, 'Yasemin','Turker','Mus. Hizm.',30, 18000,'Yozgat');
insert into fabrika values (default, 'Cihan','Ciftci','Zimpara',36, 15000,'Edirne');
rollback to x;
commit;


-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
-- Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.
