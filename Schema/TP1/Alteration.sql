-- Q2) PARTIE 2: Ajouter Attributs


ALTER TABLE Achat
    ADD (Prix INT NOT NULL);

ALTER TABLE Jeu
    ADD (DateSortie DATE NOT NULL);

    
-- Q3) PARTIE 3: Ajouter Contraint Not null
ALTER TABLE Achat
    MODIFY (DateAchat DATE NOT NULL);
ALTER TABLE SessionJeu
    MODIFY (DureeSession INTERVAL DAY(0) TO SECOND(0) NOT NULL);

-- Q4) PARTIE 4: reduction de la taille d'un attribut
ALTER TABLE Jouer
    MODIFY (Email VARCHAR2(80) NOT NULL);
ALTER TABLE Jeu
    MODIFY (Genre VARCHAR2(50) NOT NULL);

-- Q5) PARTIE 5: suppression d'une colonne
ALTER TABLE Jouer
    DROP COLUMN Age;
ALTER TABLE Jeu
    DROP COLUMN DateSortie;
-- Q6) PARTIE 6: renommer une table
-- Le renommage de la table TROPHEE a été effectué dans le script principal.
RENAME StudioDev TO Studio_Dev;
-- Q7) PARTIE 7: Ajouter la contrainte spécifiant qu’un attribut non déclaré clé étrangère fait référence à la cle d'une autre table
ALTER TABLE SessionJeu
    ADD CONSTRAINT sessionjeu_id_jouer_fk FOREIGN KEY (ID_Jouer) REFERENCES Jouer (ID_Jouer);
ALTER TABLE Achat
    ADD CONSTRAINT achat_id_jeu_fk FOREIGN KEY (ID_Jeu) REFERENCES Jeu (ID_Jeu);
-- Q8) PARTIE 8: contrainte des attributes intra-table 
--Nom de joueur et Email ne doivent pas être identiques
ALTER TABLE Jouer
    ADD CONSTRAINT nom_email_check CHECK (Pseudo <> Email);

-- Q9) PARTIE 9: contrainte inter-table
--La date d’achat d’un jeu doit être postérieure à la date de création du studio de développement du jeu
-- Oracle n'autorise pas les sous-requêtes inter-tables dans une contrainte CHECK.
-- Implémentation via trigger pour vérifier que DateAchat > DateCreation du studio du jeu.
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

