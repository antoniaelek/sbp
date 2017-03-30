CREATE DATABASE sbpDz2 
       IN dbspace1                 -- bazu kreirati u prostoru baze podataka dbspace1 (vidjeti 1. predavanje)
       WITH LOG;                   -- aktivirati logièki dnevnik za bazu podataka     (kasnije vidjeti 5. predavanje) 

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

INSERT INTO stud VALUES('0555000011', 'Krešimir', 'Salopek');
INSERT INTO stud VALUES('0555000027', 'Andrej', 'Jurèiæ');
INSERT INTO stud VALUES('0555000032', 'Adonis', 'Miæiæ');
INSERT INTO stud VALUES('0555000048', 'Krešimir', 'Vagiæ');
INSERT INTO stud VALUES('0555000053', 'Hrvoje', 'Korkut');
INSERT INTO stud VALUES('0555000069', 'Siniša', 'Bet');
INSERT INTO stud VALUES('0555000074', 'Hrvoje', 'Buneta');
INSERT INTO stud VALUES('0555000095', 'Vladimir', 'Mušanoviæ');
INSERT INTO stud VALUES('0555000102', 'Ivor', 'Purkoviæ');
INSERT INTO stud VALUES('0555000118', 'Maroje', 'Klepiæ');
INSERT INTO stud VALUES('0555000123', 'Tomislav', 'Lipovac');
INSERT INTO stud VALUES('0555000139', 'Vedran', 'Kauzlariæ');
INSERT INTO stud VALUES('0555000144', 'Tonei', 'Matkoviæ');
INSERT INTO stud VALUES('0555000165', 'Ozren', 'Jurèeviæ');
INSERT INTO stud VALUES('0555000170', 'Lobell', 'Æubeliæ');
INSERT INTO stud VALUES('0555000186', 'Kristijan', 'Paškoto');
INSERT INTO stud VALUES('0555000191', 'Vladimir', 'Mihelèiæ');
INSERT INTO stud VALUES('0555000209', 'Bojan', 'Pepelar');
INSERT INTO stud VALUES('0555000214', 'Vedran', 'Žuža');
INSERT INTO stud VALUES('0555000235', 'Tomislav', 'Štimac');
INSERT INTO stud VALUES('0555000240', 'Marko', 'Janežiæ');
INSERT INTO stud VALUES('0555000256', 'Davor', 'Pahliæ');
INSERT INTO stud VALUES('0555000261', 'Srðan', 'Tkalèec');
INSERT INTO stud VALUES('0555000277', 'Mate', 'Maras');
INSERT INTO stud VALUES('0555000282', 'Dejan', 'Makarun');
INSERT INTO stud VALUES('0555000298', 'Marko', 'Prkaèin');
INSERT INTO stud VALUES('0555000305', 'Kristijan', 'Koriæ');
INSERT INTO stud VALUES('0555000310', 'Tomislav', 'Pauloviæ');
INSERT INTO stud VALUES('0555000326', 'Mario', 'Ivanšiæ');
INSERT INTO stud VALUES('0555000331', 'Ognjen', 'Muževiæ');
INSERT INTO stud VALUES('0555000347', 'Dinko', 'Pleško');
INSERT INTO stud VALUES('0555000352', 'Marko', 'Karloviæ');
INSERT INTO stud VALUES('0555000368', 'Igor', 'Peraniæ');
INSERT INTO stud VALUES('0555000373', 'Ivan', 'Ded');
INSERT INTO stud VALUES('0555000389', 'Nikica', 'Vidoviæ');
INSERT INTO stud VALUES('0555000394', 'Krunoslav', 'Kiršiæ');
INSERT INTO stud VALUES('0555000401', 'Hrvoje', 'Vego');
INSERT INTO stud VALUES('0555000417', 'Tomislav', 'Makar');
INSERT INTO stud VALUES('0555000422', 'Igor', 'Cigiæ');
INSERT INTO stud VALUES('0555000438', 'Marko', 'Èop');
INSERT INTO stud VALUES('0555000443', 'Neven', 'Kolariæ');
INSERT INTO stud VALUES('0555000459', 'Domagoj', 'Topiæ');
INSERT INTO stud VALUES('0555000464', 'Marko', 'Ravnik');
INSERT INTO stud VALUES('0555000485', 'Ante', 'Milièiæ');
INSERT INTO stud VALUES('0555000490', 'Branimir', 'Dragièeviæ');
INSERT INTO stud VALUES('0555000508', 'Zlatko', 'Matas');
INSERT INTO stud VALUES('0555000513', 'Simon', 'Glavan');
INSERT INTO stud VALUES('0555000529', 'Krunoslav', 'Ðukiæ');
INSERT INTO stud VALUES('0555000534', 'Krešimir', 'Dujmoviæ');
INSERT INTO stud VALUES('0555000555', 'Krešo', 'Glad');
INSERT INTO stud VALUES('0555000560', 'Pavle', 'Stankoviæ');
INSERT INTO stud VALUES('0555000576', 'Krešimir', 'Rodiæ');
INSERT INTO stud VALUES('0555000581', 'Ninoslav', 'Brajkoviæ');
INSERT INTO stud VALUES('0555000597', 'Tihomir', 'Æikoviæ');
INSERT INTO stud VALUES('0555000604', 'Maja', 'Splait');
INSERT INTO stud VALUES('0555000625', 'Ivan', 'Grahovac');
INSERT INTO stud VALUES('0555000630', 'Dragutin', 'Miškulin');
INSERT INTO stud VALUES('0555000646', 'Danijel', 'Medica');
INSERT INTO stud VALUES('0555000651', 'Gordan', 'Miljeviæ');
INSERT INTO stud VALUES('0555000667', 'Ante', 'Veliæ');
INSERT INTO stud VALUES('0555000672', 'Hrvoje', 'Fabris');
INSERT INTO stud VALUES('0555000688', 'Tomislav', 'Glavièiæ');
INSERT INTO stud VALUES('0555000693', 'Egon', 'Jurkoviæ');
INSERT INTO stud VALUES('0555000700', 'Zrinoslav', 'Huziak');
INSERT INTO stud VALUES('0555000716', 'Amir', 'Torbarina');
INSERT INTO stud VALUES('0555000721', 'Melko', 'Lipovac');
INSERT INTO stud VALUES('0555000737', 'Domagoj', 'Zlojutro');
INSERT INTO stud VALUES('0555000742', 'Mario', 'Vidaèiæ');
INSERT INTO stud VALUES('0555000758', 'Radoslav', 'Velièan');
INSERT INTO stud VALUES('0555000763', 'Krešimir', 'Kovrlija');
INSERT INTO stud VALUES('0555000779', 'Daniel', 'Lekiæ');
INSERT INTO stud VALUES('0555000784', 'Saša', 'Krajnoviæ');
INSERT INTO stud VALUES('0555000807', 'Krešimir', 'Dusper');
INSERT INTO stud VALUES('0555000812', 'Luka', 'Maturanec');
INSERT INTO stud VALUES('0555000828', 'Antonio', 'Bitanga');
INSERT INTO stud VALUES('0555000833', 'Marko', 'Èaèiæ');
INSERT INTO stud VALUES('0555000849', 'Ivo', 'Zriliæ');
INSERT INTO stud VALUES('0555000854', 'Tomislav-Ivan', 'Rukavina');
INSERT INTO stud VALUES('0555000875', 'Krešimir', 'Demo');
INSERT INTO stud VALUES('0555000880', 'Tonei', 'Lovriæ');
INSERT INTO stud VALUES('0555000896', 'Marijo', 'Štefulinac');
INSERT INTO stud VALUES('0555000903', 'Goran', 'Dragoviæ-Cetniski');
INSERT INTO stud VALUES('0555000919', 'Tin', 'Zlopaša');
INSERT INTO stud VALUES('0555000924', 'Martin', 'Klanjèiæ');
INSERT INTO stud VALUES('0555000945', 'Vjekoslav', 'KOLONIÆ');
INSERT INTO stud VALUES('0555000950', 'Mijo', 'Klasiæ');
INSERT INTO stud VALUES('0555000966', 'Ivan', 'Pauliæ');
INSERT INTO stud VALUES('0555000971', 'Mislav', 'Zuzzi');
INSERT INTO stud VALUES('0555000987', 'Vladimir', 'Bura');
INSERT INTO stud VALUES('0555000992', 'Vedran', 'Franèiškoviæ');
INSERT INTO stud VALUES('0555001003', 'Domagoj', 'Glavaš');
INSERT INTO stud VALUES('0555001019', 'Mario', 'Karabaiæ');
INSERT INTO stud VALUES('0555001024', 'Zoran', 'Tuk');
INSERT INTO stud VALUES('0555001045', 'Aleksandar', 'Hrešiæ');
INSERT INTO stud VALUES('0555001050', 'Filip', 'Drakuliæ');
INSERT INTO stud VALUES('0555001066', 'Ivan', 'Kabalin');
INSERT INTO stud VALUES('0555001071', 'Boris', 'Orliæ');
INSERT INTO stud VALUES('0555001087', 'Dražen', 'Chiole');
INSERT INTO stud VALUES('0555001092', 'Josip', 'Janeš');
INSERT INTO stud VALUES('0555001115', 'Marko', 'Harapin');
INSERT INTO stud VALUES('0555001120', 'Dubravko', 'Zamliæ');
INSERT INTO stud VALUES('0555001136', 'Radovan', 'Maruna');
INSERT INTO stud VALUES('0555001141', 'Darko', 'Kopljar');
INSERT INTO stud VALUES('0555001157', 'Zvonimir', 'Perica');
INSERT INTO stud VALUES('0555001162', 'Ivan', 'Maljiæ');
INSERT INTO stud VALUES('2902984553', 'Dalibor', 'Miheliæ');
INSERT INTO stud VALUES('0555001183', 'Jerko', 'Begiæ');
INSERT INTO stud VALUES('0555001199', 'Damir', 'Mužiæ');
INSERT INTO stud VALUES('0555001206', 'Dario', 'Zagriæ');
INSERT INTO stud VALUES('0555001211', 'Damir', 'Faèini');
INSERT INTO stud VALUES('2902984550', 'Dejan', 'Bakiæ');
INSERT INTO stud VALUES('0555001232', 'Danijel', 'Mariæ');
INSERT INTO stud VALUES('0555001248', 'Genadij', 'Skomina');
INSERT INTO stud VALUES('0555001253', 'Mladen', 'Markoviæ');
INSERT INTO stud VALUES('0555001269', 'Slobodan', 'Czerny');
INSERT INTO stud VALUES('0555001274', 'Marko', 'Milanoviæ');
INSERT INTO stud VALUES('0555001295', 'Filip', 'Šoštariæ');
INSERT INTO stud VALUES('0555001302', 'Marko', 'Poropat');
INSERT INTO stud VALUES('0555001318', 'Branimir', 'Kukiæ');
INSERT INTO stud VALUES('0555001323', 'Dalibor', 'Stepanèiæ');
INSERT INTO stud VALUES('0555001339', 'Fran', 'Èebuhar');
INSERT INTO stud VALUES('0555001344', 'Seden', 'Grguriæ');
INSERT INTO stud VALUES('0555001365', 'Hrvoje', 'Pribaniæ');
INSERT INTO stud VALUES('0555001370', 'Vedran', 'Uzelac');
INSERT INTO stud VALUES('0555001386', 'Matija', 'Penaviæ');
INSERT INTO stud VALUES('0555001391', 'Marko', 'Hulusija');
INSERT INTO stud VALUES('0555001409', 'Miran', 'Cvikiæ');
INSERT INTO stud VALUES('0555001414', 'Fililp', 'Blaževiæ');
INSERT INTO stud VALUES('0555001435', 'Vedran', 'Biga');
INSERT INTO stud VALUES('0555001440', 'Boris', 'Dujmoviæ');
INSERT INTO stud VALUES('2902984552', 'Ivan', 'Malnar');
INSERT INTO stud VALUES('0555001461', 'Nikša', 'Kraguljac');
INSERT INTO stud VALUES('0555001477', 'Jurij', 'Zuboviæ');
INSERT INTO stud VALUES('0555001482', 'Nikola', 'Lešiæ');
INSERT INTO stud VALUES('0555001498', 'Miroslav', 'Matiješeviæ');
INSERT INTO stud VALUES('0555001505', 'Igor', 'Garbajs Nikolac');
INSERT INTO stud VALUES('0555001510', 'Marin', 'Palle');
INSERT INTO stud VALUES('0555001526', 'Goran', 'Brala');
INSERT INTO stud VALUES('0555001531', 'Mirza', 'Jurèiæ');
INSERT INTO stud VALUES('0555001547', 'Domagoj', 'Šimuniæ');
INSERT INTO stud VALUES('0555001552', 'Krešo', 'Fumiæ');
INSERT INTO stud VALUES('0555001568', 'Ivan', 'Rašetina');
INSERT INTO stud VALUES('0555001573', 'Valentin', 'Tevanoviæ');
INSERT INTO stud VALUES('0555001589', 'Igor', 'Vanèina');
INSERT INTO stud VALUES('0555001594', 'Luka', 'Grguriæ');
INSERT INTO stud VALUES('0555001601', 'Bojan', 'Bataljaku');
INSERT INTO stud VALUES('0555001617', 'Jan', 'Èemeljiæ');
INSERT INTO stud VALUES('0555001622', 'Željko', 'Gobo');
INSERT INTO stud VALUES('0555001638', 'Davor', 'Barkiæ');
INSERT INTO stud VALUES('0555001643', 'Domagoj', 'Orliæ');

-- relacija studGrupa na poèetku vježbe ostaje prazna