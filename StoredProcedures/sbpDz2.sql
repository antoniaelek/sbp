CREATE DATABASE sbpDz2 
       IN dbspace1                 -- bazu kreirati u prostoru baze podataka dbspace1 (vidjeti 1. predavanje)
       WITH LOG;                   -- aktivirati logi�ki dnevnik za bazu podataka     (kasnije vidjeti 5. predavanje) 

CREATE TABLE grupa (
  oznGrupa        CHAR(10)      NOT NULL
, kapacitet       INTEGER       NOT NULL
, brojStud        INTEGER       NOT NULL

, PRIMARY KEY (oznGrupa) CONSTRAINT pkGrupa
); 

CREATE TABLE stud (
  JMBAG           CHAR(10)      NOT NULL 
, imeStud         NCHAR(25)     NOT NULL 
, prezStud        NCHAR(25)     NOT NULL

, PRIMARY KEY (JMBAG) CONSTRAINT pkStud
);


CREATE TABLE studGrupa (
  JMBAG           CHAR(10)      NOT NULL 
, oznGrupa        CHAR(10)      NOT NULL

, PRIMARY KEY (JMBAG, oznGrupa) CONSTRAINT pkStudGrupa
, FOREIGN KEY (JMBAG) REFERENCES stud (JMBAG) CONSTRAINT fkStudGrupaStud
, FOREIGN KEY (oznGrupa) REFERENCES grupa (oznGrupa) CONSTRAINT fkStudGrupaGrupa
);


INSERT INTO grupa VALUES('P4A', 25, 0);
INSERT INTO grupa VALUES('P4B', 20, 0);
INSERT INTO grupa VALUES('P1', 40, 0);
INSERT INTO grupa VALUES('P2', 30, 0);
INSERT INTO grupa VALUES('P3', 50, 0);

INSERT INTO stud VALUES('0555000011', 'Kre�imir', 'Salopek');
INSERT INTO stud VALUES('0555000027', 'Andrej', 'Jur�i�');
INSERT INTO stud VALUES('0555000032', 'Adonis', 'Mi�i�');
INSERT INTO stud VALUES('0555000048', 'Kre�imir', 'Vagi�');
INSERT INTO stud VALUES('0555000053', 'Hrvoje', 'Korkut');
INSERT INTO stud VALUES('0555000069', 'Sini�a', 'Bet');
INSERT INTO stud VALUES('0555000074', 'Hrvoje', 'Buneta');
INSERT INTO stud VALUES('0555000095', 'Vladimir', 'Mu�anovi�');
INSERT INTO stud VALUES('0555000102', 'Ivor', 'Purkovi�');
INSERT INTO stud VALUES('0555000118', 'Maroje', 'Klepi�');
INSERT INTO stud VALUES('0555000123', 'Tomislav', 'Lipovac');
INSERT INTO stud VALUES('0555000139', 'Vedran', 'Kauzlari�');
INSERT INTO stud VALUES('0555000144', 'Tonei', 'Matkovi�');
INSERT INTO stud VALUES('0555000165', 'Ozren', 'Jur�evi�');
INSERT INTO stud VALUES('0555000170', 'Lobell', '�ubeli�');
INSERT INTO stud VALUES('0555000186', 'Kristijan', 'Pa�koto');
INSERT INTO stud VALUES('0555000191', 'Vladimir', 'Mihel�i�');
INSERT INTO stud VALUES('0555000209', 'Bojan', 'Pepelar');
INSERT INTO stud VALUES('0555000214', 'Vedran', '�u�a');
INSERT INTO stud VALUES('0555000235', 'Tomislav', '�timac');
INSERT INTO stud VALUES('0555000240', 'Marko', 'Jane�i�');
INSERT INTO stud VALUES('0555000256', 'Davor', 'Pahli�');
INSERT INTO stud VALUES('0555000261', 'Sr�an', 'Tkal�ec');
INSERT INTO stud VALUES('0555000277', 'Mate', 'Maras');
INSERT INTO stud VALUES('0555000282', 'Dejan', 'Makarun');
INSERT INTO stud VALUES('0555000298', 'Marko', 'Prka�in');
INSERT INTO stud VALUES('0555000305', 'Kristijan', 'Kori�');
INSERT INTO stud VALUES('0555000310', 'Tomislav', 'Paulovi�');
INSERT INTO stud VALUES('0555000326', 'Mario', 'Ivan�i�');
INSERT INTO stud VALUES('0555000331', 'Ognjen', 'Mu�evi�');
INSERT INTO stud VALUES('0555000347', 'Dinko', 'Ple�ko');
INSERT INTO stud VALUES('0555000352', 'Marko', 'Karlovi�');
INSERT INTO stud VALUES('0555000368', 'Igor', 'Perani�');
INSERT INTO stud VALUES('0555000373', 'Ivan', 'Ded');
INSERT INTO stud VALUES('0555000389', 'Nikica', 'Vidovi�');
INSERT INTO stud VALUES('0555000394', 'Krunoslav', 'Kir�i�');
INSERT INTO stud VALUES('0555000401', 'Hrvoje', 'Vego');
INSERT INTO stud VALUES('0555000417', 'Tomislav', 'Makar');
INSERT INTO stud VALUES('0555000422', 'Igor', 'Cigi�');
INSERT INTO stud VALUES('0555000438', 'Marko', '�op');
INSERT INTO stud VALUES('0555000443', 'Neven', 'Kolari�');
INSERT INTO stud VALUES('0555000459', 'Domagoj', 'Topi�');
INSERT INTO stud VALUES('0555000464', 'Marko', 'Ravnik');
INSERT INTO stud VALUES('0555000485', 'Ante', 'Mili�i�');
INSERT INTO stud VALUES('0555000490', 'Branimir', 'Dragi�evi�');
INSERT INTO stud VALUES('0555000508', 'Zlatko', 'Matas');
INSERT INTO stud VALUES('0555000513', 'Simon', 'Glavan');
INSERT INTO stud VALUES('0555000529', 'Krunoslav', '�uki�');
INSERT INTO stud VALUES('0555000534', 'Kre�imir', 'Dujmovi�');
INSERT INTO stud VALUES('0555000555', 'Kre�o', 'Glad');
INSERT INTO stud VALUES('0555000560', 'Pavle', 'Stankovi�');
INSERT INTO stud VALUES('0555000576', 'Kre�imir', 'Rodi�');
INSERT INTO stud VALUES('0555000581', 'Ninoslav', 'Brajkovi�');
INSERT INTO stud VALUES('0555000597', 'Tihomir', '�ikovi�');
INSERT INTO stud VALUES('0555000604', 'Maja', 'Splait');
INSERT INTO stud VALUES('0555000625', 'Ivan', 'Grahovac');
INSERT INTO stud VALUES('0555000630', 'Dragutin', 'Mi�kulin');
INSERT INTO stud VALUES('0555000646', 'Danijel', 'Medica');
INSERT INTO stud VALUES('0555000651', 'Gordan', 'Miljevi�');
INSERT INTO stud VALUES('0555000667', 'Ante', 'Veli�');
INSERT INTO stud VALUES('0555000672', 'Hrvoje', 'Fabris');
INSERT INTO stud VALUES('0555000688', 'Tomislav', 'Glavi�i�');
INSERT INTO stud VALUES('0555000693', 'Egon', 'Jurkovi�');
INSERT INTO stud VALUES('0555000700', 'Zrinoslav', 'Huziak');
INSERT INTO stud VALUES('0555000716', 'Amir', 'Torbarina');
INSERT INTO stud VALUES('0555000721', 'Melko', 'Lipovac');
INSERT INTO stud VALUES('0555000737', 'Domagoj', 'Zlojutro');
INSERT INTO stud VALUES('0555000742', 'Mario', 'Vida�i�');
INSERT INTO stud VALUES('0555000758', 'Radoslav', 'Veli�an');
INSERT INTO stud VALUES('0555000763', 'Kre�imir', 'Kovrlija');
INSERT INTO stud VALUES('0555000779', 'Daniel', 'Leki�');
INSERT INTO stud VALUES('0555000784', 'Sa�a', 'Krajnovi�');
INSERT INTO stud VALUES('0555000807', 'Kre�imir', 'Dusper');
INSERT INTO stud VALUES('0555000812', 'Luka', 'Maturanec');
INSERT INTO stud VALUES('0555000828', 'Antonio', 'Bitanga');
INSERT INTO stud VALUES('0555000833', 'Marko', '�a�i�');
INSERT INTO stud VALUES('0555000849', 'Ivo', 'Zrili�');
INSERT INTO stud VALUES('0555000854', 'Tomislav-Ivan', 'Rukavina');
INSERT INTO stud VALUES('0555000875', 'Kre�imir', 'Demo');
INSERT INTO stud VALUES('0555000880', 'Tonei', 'Lovri�');
INSERT INTO stud VALUES('0555000896', 'Marijo', '�tefulinac');
INSERT INTO stud VALUES('0555000903', 'Goran', 'Dragovi�-Cetniski');
INSERT INTO stud VALUES('0555000919', 'Tin', 'Zlopa�a');
INSERT INTO stud VALUES('0555000924', 'Martin', 'Klanj�i�');
INSERT INTO stud VALUES('0555000945', 'Vjekoslav', 'KOLONI�');
INSERT INTO stud VALUES('0555000950', 'Mijo', 'Klasi�');
INSERT INTO stud VALUES('0555000966', 'Ivan', 'Pauli�');
INSERT INTO stud VALUES('0555000971', 'Mislav', 'Zuzzi');
INSERT INTO stud VALUES('0555000987', 'Vladimir', 'Bura');
INSERT INTO stud VALUES('0555000992', 'Vedran', 'Fran�i�kovi�');
INSERT INTO stud VALUES('0555001003', 'Domagoj', 'Glava�');
INSERT INTO stud VALUES('0555001019', 'Mario', 'Karabai�');
INSERT INTO stud VALUES('0555001024', 'Zoran', 'Tuk');
INSERT INTO stud VALUES('0555001045', 'Aleksandar', 'Hre�i�');
INSERT INTO stud VALUES('0555001050', 'Filip', 'Drakuli�');
INSERT INTO stud VALUES('0555001066', 'Ivan', 'Kabalin');
INSERT INTO stud VALUES('0555001071', 'Boris', 'Orli�');
INSERT INTO stud VALUES('0555001087', 'Dra�en', 'Chiole');
INSERT INTO stud VALUES('0555001092', 'Josip', 'Jane�');
INSERT INTO stud VALUES('0555001115', 'Marko', 'Harapin');
INSERT INTO stud VALUES('0555001120', 'Dubravko', 'Zamli�');
INSERT INTO stud VALUES('0555001136', 'Radovan', 'Maruna');
INSERT INTO stud VALUES('0555001141', 'Darko', 'Kopljar');
INSERT INTO stud VALUES('0555001157', 'Zvonimir', 'Perica');
INSERT INTO stud VALUES('0555001162', 'Ivan', 'Malji�');
INSERT INTO stud VALUES('2902984553', 'Dalibor', 'Miheli�');
INSERT INTO stud VALUES('0555001183', 'Jerko', 'Begi�');
INSERT INTO stud VALUES('0555001199', 'Damir', 'Mu�i�');
INSERT INTO stud VALUES('0555001206', 'Dario', 'Zagri�');
INSERT INTO stud VALUES('0555001211', 'Damir', 'Fa�ini');
INSERT INTO stud VALUES('2902984550', 'Dejan', 'Baki�');
INSERT INTO stud VALUES('0555001232', 'Danijel', 'Mari�');
INSERT INTO stud VALUES('0555001248', 'Genadij', 'Skomina');
INSERT INTO stud VALUES('0555001253', 'Mladen', 'Markovi�');
INSERT INTO stud VALUES('0555001269', 'Slobodan', 'Czerny');
INSERT INTO stud VALUES('0555001274', 'Marko', 'Milanovi�');
INSERT INTO stud VALUES('0555001295', 'Filip', '�o�tari�');
INSERT INTO stud VALUES('0555001302', 'Marko', 'Poropat');
INSERT INTO stud VALUES('0555001318', 'Branimir', 'Kuki�');
INSERT INTO stud VALUES('0555001323', 'Dalibor', 'Stepan�i�');
INSERT INTO stud VALUES('0555001339', 'Fran', '�ebuhar');
INSERT INTO stud VALUES('0555001344', 'Seden', 'Grguri�');
INSERT INTO stud VALUES('0555001365', 'Hrvoje', 'Pribani�');
INSERT INTO stud VALUES('0555001370', 'Vedran', 'Uzelac');
INSERT INTO stud VALUES('0555001386', 'Matija', 'Penavi�');
INSERT INTO stud VALUES('0555001391', 'Marko', 'Hulusija');
INSERT INTO stud VALUES('0555001409', 'Miran', 'Cviki�');
INSERT INTO stud VALUES('0555001414', 'Fililp', 'Bla�evi�');
INSERT INTO stud VALUES('0555001435', 'Vedran', 'Biga');
INSERT INTO stud VALUES('0555001440', 'Boris', 'Dujmovi�');
INSERT INTO stud VALUES('2902984552', 'Ivan', 'Malnar');
INSERT INTO stud VALUES('0555001461', 'Nik�a', 'Kraguljac');
INSERT INTO stud VALUES('0555001477', 'Jurij', 'Zubovi�');
INSERT INTO stud VALUES('0555001482', 'Nikola', 'Le�i�');
INSERT INTO stud VALUES('0555001498', 'Miroslav', 'Matije�evi�');
INSERT INTO stud VALUES('0555001505', 'Igor', 'Garbajs Nikolac');
INSERT INTO stud VALUES('0555001510', 'Marin', 'Palle');
INSERT INTO stud VALUES('0555001526', 'Goran', 'Brala');
INSERT INTO stud VALUES('0555001531', 'Mirza', 'Jur�i�');
INSERT INTO stud VALUES('0555001547', 'Domagoj', '�imuni�');
INSERT INTO stud VALUES('0555001552', 'Kre�o', 'Fumi�');
INSERT INTO stud VALUES('0555001568', 'Ivan', 'Ra�etina');
INSERT INTO stud VALUES('0555001573', 'Valentin', 'Tevanovi�');
INSERT INTO stud VALUES('0555001589', 'Igor', 'Van�ina');
INSERT INTO stud VALUES('0555001594', 'Luka', 'Grguri�');
INSERT INTO stud VALUES('0555001601', 'Bojan', 'Bataljaku');
INSERT INTO stud VALUES('0555001617', 'Jan', '�emelji�');
INSERT INTO stud VALUES('0555001622', '�eljko', 'Gobo');
INSERT INTO stud VALUES('0555001638', 'Davor', 'Barki�');
INSERT INTO stud VALUES('0555001643', 'Domagoj', 'Orli�');

-- relacija studGrupa na po�etku vje�be ostaje prazna