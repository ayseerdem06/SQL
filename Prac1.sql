CREATE table hastane(
id char (4) PRIMARY KEY,
tc char(11) UNIQUE,
isim_soyisim varchar (30),
randevu_tarihi date,
polk varchar(20)
);

INSERT INTO hastane VALUES (1001,'12345678914','Ali Can','2022-08-12','Dahiliye');
INSERT INTO hastane VALUES (1002,'12345488914','Veli Yan','2022-08-20','KBB');
INSERT INTO hastane VALUES (1003,'12855678914','Hasan Gün','2022-08-14','Cildiye');
INSERT INTO hastane VALUES (1004,'12345678744','Fatma Al','2022-09-10','Nöroloji');
INSERT INTO hastane VALUES (1005,'12312678914','Asiye Gül','2022-07-02','Kardiyoloji');
INSERT INTO hastane VALUES (1006,'12345694914','Sena Sonmez','2022-09-22','Radyoloji');

select * from hastane;

-- FORAING KEY TABLE 

CREATE TABLE hpersonel(
personel_id char(4),
perad_soyad varchar(30),
unvan varchar (25),
yas int,
bolum varchar(20),	
CONSTRAINT fk FOREIGN KEY (personel_id) REFERENCES hastane(id) 
);

INSERT INTO hpersonel VALUES (1001,'Handan Bak','Doktor',40,'Ortopedi');
INSERT INTO hpersonel VALUES (1002,'Harun Yalın','Doktor',55,'Cildiye');
INSERT INTO hpersonel VALUES (1003,'Gamze Aydın','Hemşire',35,'KBB');
INSERT INTO hpersonel VALUES (1004,'Nur Ata','Hemşire',30,'Kardiyoloji');
INSERT INTO hpersonel VALUES (1005,'Sena Duman','Hemşire',25,'Nöroloji');
INSERT INTO hpersonel VALUES (1006,'Murat Sen','Doktor',41,'Radyoloji');

select * from hpersonel;

-- unvanı doktor olan hpersonelleri listele
select * from hpersonel WHERE unvan='Doktor';

-- yası 30 ile 45 arasındaki hpersonel leri listele
select * from hpersonel WHERE yas>30 AND yas<45;

-- id'si 1001,1002 ve 1004 olan hastane bilgilerini listele
select * from hastane WHERE  id='1001' or  id='1002' or  id='1003';


-- ismi H harfi ile başlayan personeli listele
select * from hpersonel WHERE perad_soyad ilike 'H%';

-- -- Ismi n harfi ile biten personeli listele
select * from hpersonel WHERE perad_soyad ilike '%n';

-- Isminin 2. harfi e olan personeli listeleyiniz
select * from hpersonel WHERE perad_soyad ilike '_e%';

--  İçerisinde 'ın' veya 'un' bulunan kelimeleri listeleyiniz
--SIMILAR TO ile
select * from hpersonel where perad_soyad SIMILAR TO '%(ın|un)%';
--LIKE ile 
select * from hpersonel where perad_soyad ILIKE '%ın%' or perad_soyad ILIKE '%un%';
-- REGEX  İLE 
select * from hpersonel where perad_soyad ~* 'ın' or  perad_soyad ~* 'un' ;

--hastane tablosunda Sonu 'n' veya 'l' ile biten isim soyisimleri listeleyeniz
select * from hastane where isim_soyisim ~* '(.*)[nl]$';

