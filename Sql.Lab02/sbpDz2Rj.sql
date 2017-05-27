--------------------------------------------------------------------------------
-------------------------------------- 1 ---------------------------------------
--------------------------------------------------------------------------------
-- a) Dogodi se iznimka -701, koja je uhvaćena, izvršava se ON EXCEPTION blok, a kako -701 nije u (-702,-703) tu se ništa ne događa, procedura nakon obrade iznimke završava.
-- b) Razlika u odnosu na prethodni zadatak je što postoji END EXCEPTION WITH RESUME, pa će nakon obrade pogreške -701 na isti način kao u prošlom primjeru, procedura nastaviti s izvršvanjem na sljedećoj liniji, gdje će se dignuti iznimka -702, a u njenoj obradi će se dignuti iznimka -746 s porukom "Pogreska -702", koja neće biti uhvaćena.
-- c) Dignnut će se iznimka -701, u njenoj obradi se neće ispisati ništa, nakon čega će se izvršavanje nastaviti od linije "RAISE EXCEPTION -703;", jer se ON EXCEPTION blok nalazi izvan BEGIN ... END bloka. Kada se digne iznimka -703,  u njenoj obradi će se dignuti iznimka -746 s porukom "Pogreska -703", koja neće biti uhvaćena.
-- d) Najprije će se dići iznimka -701, koja će biti uhvaćena naredbom "ON EXCEPTION IN (-701)" u BEGIN ... END bloku. Ta obrada će dići iznimku -702, koja će biti uhvaćena naredbom "ON EXCEPTION", a u obradi će se dići iznimka -746 s porukom "Broj dva", koja neće biti uhvaćena.

--------------------------------------------------------------------------------
------------------------------------- 2.a) -------------------------------------
--------------------------------------------------------------------------------
DROP PROCEDURE brisiGrupu;
CREATE PROCEDURE brisiGrupu(grupaId char(10))
  DEFINE brSt SMALLINT;
  LET brSt = (SELECT brojStud FROM grupa WHERE ozngrupa LIKE grupaId);
  IF brSt < 5 THEN
    DELETE FROM studGrupa WHERE ozngrupa LIKE grupaId;
  ELSE
    RAISE EXCEPTION -746, 0, 'Brisanje zabranjeno. U grupu ' || TRIM(grupaId)
                              || ' upisano ' || brSt || ' studenata.';
  END IF;
END PROCEDURE;

DROP TRIGGER brisiGrupuTrigger;
CREATE TRIGGER brisiGrupuTrigger
  DELETE ON grupa
  REFERENCING OLD AS staraGrupa
  FOR EACH ROW
      (EXECUTE PROCEDURE brisiGrupu(staraGrupa.ozngrupa));

--------------------------------------------------------------------------------
------------------------------------- 2.b) -------------------------------------
--------------------------------------------------------------------------------
DROP PROCEDURE kapacitet;
CREATE PROCEDURE kapacitet(grupaId char(10))
  DEFINE kap INT;
  DEFINE brSt SMALLINT;
  LET brSt = (SELECT brojStud FROM grupa WHERE ozngrupa LIKE grupaId);
  LET kap = (SELECT kapacitet FROM grupa WHERE ozngrupa LIKE grupaId);
  IF kap = brSt THEN
    RAISE EXCEPTION -746, 0, 'Premašen kapacitet grupe.';
  END IF;
END PROCEDURE;

DROP TRIGGER kapacitetInsertTrigger;
CREATE TRIGGER kapacitetInsertTrigger
  INSERT ON studGrupa
  REFERENCING NEW AS staraGrupa
  FOR EACH ROW
      (EXECUTE PROCEDURE kapacitet(staraGrupa.ozngrupa));

DROP TRIGGER kapacitetUpdateTrigger;
CREATE TRIGGER kapacitetUpdateTrigger
  UPDATE of oznGrupa ON studGrupa
  REFERENCING OLD AS staraGrupa
  FOR EACH ROW
      (EXECUTE PROCEDURE kapacitet(staraGrupa.ozngrupa));

--------------------------------------------------------------------------------
------------------------------------- 2.c) -------------------------------------
--------------------------------------------------------------------------------
DROP PROCEDURE azurirajBrStud;
CREATE PROCEDURE azurirajBrStud(grupaId char(10), prib int)
  DEFINE brSt SMALLINT;
  LET brSt = (SELECT brojStud FROM grupa WHERE ozngrupa LIKE grupaId) + prib;
  UPDATE grupa SET brojStud = brSt WHERE ozngrupa LIKE grupaId;
END PROCEDURE;

DROP TRIGGER uvecajBrStudTrigger;
CREATE TRIGGER uvecajBrStudTrigger
  INSERT ON studGrupa
  REFERENCING NEW AS novaGrupa
  FOR EACH ROW
      (EXECUTE PROCEDURE azurirajBrStud(novaGrupa.ozngrupa, 1));

DROP TRIGGER umanjiBrStudTrigger;
CREATE TRIGGER umanjiBrStudTrigger
  DELETE ON studGrupa
  REFERENCING OLD AS staraGrupa
  FOR EACH ROW
      (EXECUTE PROCEDURE azurirajBrStud(staraGrupa.ozngrupa, -1));

DROP TRIGGER azurirajBrStudTrigger;
CREATE TRIGGER azurirajBrStudTrigger
  UPDATE of oznGrupa ON studGrupa
  REFERENCING OLD AS s NEW AS n
  FOR EACH ROW
      (EXECUTE PROCEDURE azurirajBrStud(s.ozngrupa, -1),
       EXECUTE PROCEDURE azurirajBrStud(n.ozngrupa, 1));

--------------------------------------------------------------------------------
-------------------------------------- 3 ---------------------------------------
--------------------------------------------------------------------------------
CREATE PROCEDURE upisStudenta(studJmbag char(10))
  DEFINE postoji SMALLINT;
  DEFINE upisan SMALLINT;
  DEFINE slobodno SMALLINT;
  DEFINE gr char(10);
  LET postoji = (SELECT COUNT(jmbag) FROM stud WHERE jmbag LIKE studJmbag);
  LET upisan = (SELECT COUNT(oznGrupa) FROM studGrupa WHERE jmbag LIKE studJmbag);
  LET slobodno = (SELECT COUNT(*) FROM grupa WHERE kapacitet > brojStud);
  IF postoji = 0 THEN
    RAISE EXCEPTION -746, 0, 'Student ne postoji';
  ELIF upisan != 0 THEN
    RAISE EXCEPTION -746, 0, 'Student je već upisan u nastavnu grupu';
  ELIF slobodno = 0 THEN
    RAISE EXCEPTION -746, 0, 'Sve grupe su već popunjene';
  END IF;
  LET gr = (SELECT FIRST 1 oznGrupa
            FROM (SELECT brojStud/kapacitet AS popunjenost,
                         oznGrupa
                  FROM grupa
                  ORDER BY popunjenost, oznGrupa
                 )
          );
  INSERT INTO studgrupa VALUES(studJmbag, gr);
END PROCEDURE;

--------------------------------------------------------------------------------
-------------------------------------- 4 ---------------------------------------
--------------------------------------------------------------------------------
CREATE FUNCTION studentiPoGrupama()
  RETURNING CHAR(10) AS r_jmbag,
            NCHAR(25) AS r_prez,
            NCHAR(25) AS r_ime,
            INT AS r_cont,
            CHAR(10) AS r_curr

  DEFINE s_jmbag CHAR(10);
  DEFINE s_gr CHAR(10);
  DEFINE s_prez NCHAR(25);
  DEFINE s_ime NCHAR(25);
  DEFINE GLOBAL cont INT DEFAULT -1;
  DEFINE GLOBAL curr char(10) DEFAULT NULL;
  LET cont = cont + 1;
  LET curr = (SELECT SKIP cont FIRST 1 oznGrupa FROM
    (SELECT DISTINCT ozngrupa
     FROM grupa ORDER BY oznGrupa
    ));

  IF curr IS NULL THEN
    RAISE EXCEPTION -746, 0, 'Više nema grupa';
  END IF;

  FOREACH SELECT stud.jmbag, prezStud, imeStud, ozngrupa
    INTO s_jmbag, s_prez, s_ime, s_gr
    FROM stud JOIN studGrupa ON stud.jmbag = studGrupa.jmbag
    IF s_gr LIKE curr THEN
      RETURN s_jmbag, s_prez, s_ime, cont, curr WITH RESUME;
    END IF
  END FOREACH
END FUNCTION;

--------------------------------------------------------------------------------
-------------------------------------- 5 ---------------------------------------
--------------------------------------------------------------------------------
CREATE PROCEDURE rasporediPoGrupama()
  DEFINE s_jmbag CHAR(10);
  FOREACH SELECT jmbag
    INTO s_jmbag
    FROM stud
    WHERE jmbag NOT IN (SELECT UNIQUE jmbag FROM studGrupa)
    EXECUTE PROCEDURE upisStudenta();
  END FOREACH
END PROCEDURE;
