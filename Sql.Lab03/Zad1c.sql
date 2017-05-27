CREATE TABLE Dogadaj (
      Id            SERIAL
    , Naziv	        VARCHAR(255)
    , BrGledatelja  INTEGER NOT NULL
    , Kapacitet     INTEGER  NOT NULL
    , PRIMARY KEY (Id) CONSTRAINT PkDogadaj
    , CHECK (Kapacitet >= BrGledatelja) CONSTRAINT ChkKapacitet
);

CREATE TABLE Ulaz (
      Id            SERIAL
    , DatumVrijeme  DATETIME YEAR TO SECOND 
                    DEFAULT CURRENT YEAR TO SECOND
    , IdDogadaj     INTEGER NOT NULL
    , PRIMARY KEY (Id) CONSTRAINT PkUlaz
    , FOREIGN KEY (IdDogadaj) REFERENCES Dogadaj (Id) 
        CONSTRAINT FkUlazDogadaj
    , UNIQUE (DatumVrijeme) CONSTRAINT UniqeDT
);

INSERT INTO Dogadaj (Naziv, BrGledatelja, Kapacitet) VALUES ('Test 1', 10, 15);
INSERT INTO Dogadaj (Naziv, BrGledatelja, Kapacitet) VALUES ('Test 2', 5, 5);
INSERT INTO Dogadaj (Naziv, BrGledatelja, Kapacitet) VALUES ('Test 3', 0, 25);
INSERT INTO Dogadaj (Naziv, BrGledatelja, Kapacitet) VALUES ('Test 4', 0, 10);
INSERT INTO Dogadaj (Naziv, BrGledatelja, Kapacitet) VALUES ('Test 5', 0, 15);

INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:24:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:26:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:28:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:30:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:32:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:34:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:38:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:41:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:43:00', 1);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-10-06 10:54:00', 1);

INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-12-22 22:12:00', 2);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-12-22 22:16:00', 2);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-12-22 22:18:00', 2);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-12-22 22:32:00', 2);
INSERT INTO Ulaz (DatumVrijeme, IdDogadaj) VALUES ('2016-12-22 22:55:00', 2);