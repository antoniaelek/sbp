CREATE PROCEDURE evidentirajUlaz(dogId LIKE Dogadaj.Id)
    DEFINE sqle, isame INTEGER;
    DEFINE errdata CHAR(80);
    ON EXCEPTION SET sqle, isame, errdata
    ROLLBACK WORK;
    IF sqle = -530 AND errdata LIKE '%chkkapacitet%' THEN
            RAISE EXCEPTION -746, 0, 'Premasen kapacitet dogadaja!';
        ELSE
            RAISE EXCEPTION sqle, isame, errdata;
        END IF
    END EXCEPTION;

    BEGIN WORK;
    
    INSERT INTO Ulaz (IdDogadaj) VALUES (dogId);

    UPDATE Dogadaj SET BrGledatelja = BrGledatelja + 1
        WHERE Id = dogId;

    COMMIT WORK;
END PROCEDURE;