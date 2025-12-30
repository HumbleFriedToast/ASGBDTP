

-- Q14) Insertions avec erreurs:

-- Q14.2) table: Jouer (doublon ID_Jouer)---------------------------------
-- Still demonstrates PK violation; uses new columns/order
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(1, 'Fake!', 'fakeemail@gmail.com', 'Spain');
--Explication:
--violation de contrainte d'integrite (le cle Primaire est UNIQUE)
------------------------------------------------------------------

--Q14.3)table: Achat (clé étrangère invalide ID_Jeu)--------------------
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(2, 999, TO_DATE('2022-09-01', 'YYYY-MM-DD'));
--Explication:
--violation: contrainte d'integrite de reference (Foreign Key) (ID_Jeu 999 n'existe pas dans la table Jeu)
------------------------------------------------------------------

--Q14.4)table: SessionJeu (valeur NULL non autorisée pour DureeSession)------
-- Demonstrates NOT NULL violation on DateSession (NULL) after alterations
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(8, NULL, INTERVAL '0 02:00:00' DAY TO SECOND, 1);
--Explication:
--violation: contrainte NOT NULL sur l'attribut DateSession
------------------------------------------------------------------

--Q14.5)table: Achat (trigger achat_date_check_trg violé)
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(3, 2, TO_DATE('1980-01-01', 'YYYY-MM-DD'));
--Explication:
--violation: la date d'achat (1980-01-01) est  inferieur à la date de creation du studio (1986-11-01) du jeu eldenring
------------------------------------------------------------------

--Q14.6)table: Jeu (clé étrangère invalide ID_StudioDev)----------------
-- Provide all required columns including DateSortie and Prix; will violate FK on ID_StudioDev=999
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(8, 'FakeGame', 'Action', 'T', 'PC', 999, 20, TO_DATE('2025-01-01','YYYY-MM-DD'));
--Explication:
--violation: contrainte d'integrite de reference (Foreign Key) (ID_StudioDev 999 n'existe pas dans la table StudioDev)
------------------------------------------------------------------




