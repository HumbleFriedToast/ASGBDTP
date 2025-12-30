-- Q1) Insertions normales:
-- Q1) table: Jouer
INSERT INTO Jouer Values(1, 'PlayerOne', 'Player@gmail.com', 25);
INSERT INTO Jouer Values(2, 'GamerGirl', 'Girl@gmail.com', 22);
INSERT INTO Jouer Values(3, 'NoobMaster', 'Master@gmail.com', 30);
INSERT INTO Jouer Values(4, 'ProGamer', 'Pro@gmail.com', 28);
INSERT INTO Jouer Values(5, 'lafriqin', 'dreach@gmail.com', 26);
INSERT INTO Jouer Values(6, 'Eren','Freedom@gmail.com', 21);
INSERT INTO Jouer Values(7, 'Hassan','Skyrim@gmail.com', 24);
--table: Jeu
-- ClassificationAge uses codes: E, E10+, T, M, AO (as enforced by the CHECK constraint)
INSERT INTO Jeu Values(1,'Valorant', 'Shooter', 'T', 'PC', 1);
INSERT INTO Jeu Values(2,'EldenRing','RolePlaying','M','PC',2);
INSERT INTO Jeu Values(3,'FIFA23','Sports','E','PC',3);
INSERT INTO Jeu Values(4,'Minecraft','Sandbox','E','PC',4);
INSERT INTO Jeu Values(5,'TheWitcher3','RolePlaying','M','PC',2);
INSERT INTO Jeu Values(6,'Cyberpunk2077','RolePlaying','M','PC',2);
INSERT INTO Jeu Values(7,'AmongUs','Party','E','PC',4);

--table: Achat
-- Include `Prix` column (added in Alteration.sql). Use explicit column list to avoid ambiguity.
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(1, 1, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 30);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(2, 2, TO_DATE('2022-02-20', 'YYYY-MM-DD'), 60);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(3, 3, TO_DATE('2022-03-25', 'YYYY-MM-DD'), 40);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(4, 4, TO_DATE('2022-04-30', 'YYYY-MM-DD'), 25);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(5, 5, TO_DATE('2022-05-10', 'YYYY-MM-DD'), 50);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(6, 6, TO_DATE('2022-06-15', 'YYYY-MM-DD'), 45);
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat, Prix) VALUES(7, 7, TO_DATE('2022-07-20', 'YYYY-MM-DD'), 5);


--table: SessionJeu
-- Use HOUR TO MINUTE interval literals for clarity
INSERT INTO SessionJeu Values(1, TO_DATE('2022-08-01', 'YYYY-MM-DD'), INTERVAL '02:00' HOUR TO MINUTE, 1);
INSERT INTO SessionJeu Values(2, TO_DATE('2022-08-02', 'YYYY-MM-DD'), INTERVAL '01:30' HOUR TO MINUTE, 2);
INSERT INTO SessionJeu Values(3, TO_DATE('2022-08-03', 'YYYY-MM-DD'), INTERVAL '03:15' HOUR TO MINUTE, 3);
INSERT INTO SessionJeu Values(4, TO_DATE('2022-08-04', 'YYYY-MM-DD'), INTERVAL '04:00' HOUR TO MINUTE, 4);
INSERT INTO SessionJeu Values(5, TO_DATE('2022-08-05', 'YYYY-MM-DD'), INTERVAL '02:45' HOUR TO MINUTE, 5);
INSERT INTO SessionJeu Values(6, TO_DATE('2022-08-06', 'YYYY-MM-DD'), INTERVAL '05:00' HOUR TO MINUTE, 6);
INSERT INTO SessionJeu Values(7, TO_DATE('2022-08-07', 'YYYY-MM-DD'), INTERVAL '01:15' HOUR TO MINUTE, 7);

--table: TROPHEE
INSERT INTO TROPHEE Values(1, 'FirstBlood', 10, 1);
INSERT INTO TROPHEE Values(2,'SharpShooter', 20, 1);
INSERT INTO TROPHEE Values(3,'DragonSlayer', 30, 2);
INSERT INTO TROPHEE Values(4,'Champion', 25, 3);
INSERT INTO TROPHEE Values(5,'Builder', 15, 4);
INSERT INTO TROPHEE Values(6,'MonsterHunter', 35, 5);
INSERT INTO TROPHEE Values(7,'StealthMaster', 20, 6);

--table: StudioDev
INSERT INTO StudioDev Values(1, 'RiotGames', TO_DATE('2006-09-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(2, 'FromSoftware', TO_DATE('1986-11-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(3, 'EA Sports', TO_DATE('1982-05-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(4, 'Mojang Studios', TO_DATE('2009-11-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(5, 'CD Projekt Red', TO_DATE('2002-07-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(6, 'Innersloth', TO_DATE('2015-06-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(7, 'Bethesda', TO_DATE('1986-10-01', 'YYYY-MM-DD'));




-- Q1) Insertions avec erreurs:

-- Q1.a) table: Jouer (doublon ID_Jouer)---------------------------------
INSERT INTO Jouer Values(1, 'Fake!', 'fakeemail@gmail.com', 20);
--Explication:
--violation de contrainte d'integrite (le cle Primaire est UNIQUE)
------------------------------------------------------------------

--table: Achat (clé étrangère invalide ID_Jeu)--------------------
INSERT INTO Achat Values(2, 999, TO_DATE('2022-09-01', 'YYYY-MM-DD'));
--Explication:
--violation: contrainte d'integrite de reference (Foreign Key) (ID_Jeu 999 n'existe pas dans la table Jeu)
------------------------------------------------------------------

--table: SessionJeu (valeur NULL non autorisée pour DureeSession)------
INSERT INTO SessionJeu Values(8, NULL, INTERVAL '2' HOUR, 1);
--Explication:
--violation: contrainte NOT NULL sur l'attribut DateSession
------------------------------------------------------------------

--table: Achat (trigger achat_date_check_trg violé)
INSERT INTO Achat Values(3, 2, TO_DATE('1980-01-01', 'YYYY-MM-DD'));
--Explication:
--violation: la date d'achat (1980-01-01) est  inferieur à la date de creation du studio (1986-11-01) du jeu eldenring
------------------------------------------------------------------

--table: Jeu (clé étrangère invalide ID_StudioDev)----------------
INSERT INTO Jeu Values(8,'FakeGame', 'Action', '16+', 'PC', 999);
--Explication:
--violation: contrainte d'integrite de reference (Foreign Key) (ID_StudioDev 999 n'existe pas dans la table StudioDev)
------------------------------------------------------------------




-- Q1) Insertion (special)
