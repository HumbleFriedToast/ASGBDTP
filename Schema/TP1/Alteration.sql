-- Q6) PARTIE 2: Ajouter Attributs


ALTER TABLE Jeu
    ADD (DateSortie DATE NOT NULL);

    
-- Q7) PARTIE 3: Ajouter Contraint Not null
ALTER TABLE Achat
    MODIFY (DateAchat DATE NOT NULL);
ALTER TABLE SessionJeu
    MODIFY (DureeSession INTERVAL DAY(0) TO SECOND(0) NOT NULL);

-- Q8) PARTIE 4: reduction de la taille d'un attribut
ALTER TABLE Jouer
    MODIFY (Email VARCHAR2(80));

-- Q9) PARTIE 5: suppression d'une colonne
ALTER TABLE Jouer DROP COLUMN Age;

-- Q10) PARTIE 6: renommer une column
ALTER TABLE Jouer RENAME COLUMN Pseudo to USERNAME;

-- Q11) PARTIE 7: Ajouter la contrainte spécifiant qu’un attribut non déclaré clé étrangère fait référence à la cle d'une autre table
ALTER TABLE Achat ADD CONSTRAINT achat_id_jeu_fk FOREIGN KEY (ID_Jeu) REFERENCES Jeu (ID_Jeu);



--Q12) PARTIE 12: trigger pour contrainte intea-table
--Nom de joueur et Email ne doivent pas être identiques
ALTER TABLE Jouer ADD CONSTRAINT nom_email_check CHECK (USERNAME <> Email);
--Q13) PARTIE 13: trigger pour contrainte inter-table
--REMARQUE:dans Oracle, les contraintes CHECK ne peuvent pas référencer d'autres tables.
--donc on utilise un trigger pour cette contrainte.
--contrainte: la date d'achat doit être postérieure à la date de création du studio de développement du jeu acheté.
CREATE OR REPLACE TRIGGER achat_date_check_trg
BEFORE INSERT OR UPDATE ON Achat
FOR EACH ROW
DECLARE
    v_datecreation DATE;
BEGIN
    SELECT s.DateCreation
    INTO v_datecreation
    FROM StudioDev s
    JOIN Jeu j ON s.ID_StudioDev = j.ID_StudioDev
    WHERE j.ID_Jeu = :NEW.ID_Jeu;
    IF :NEW.DateAchat <= v_datecreation THEN
        RAISE_APPLICATION_ERROR(-20001, 'La date d''achat doit être postérieure à la date de création du studio.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Jeu ou studio introuvable pour vérifier la date d''achat.');
END;

