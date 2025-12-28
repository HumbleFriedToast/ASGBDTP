--insertions normale:
--table: Jouer
INSERT INTO Jouer Values(1, 'PlayerOne', 'Player@gmail.com', 25,'Algeria');
INSERT INTO Jouer Values(2, 'GamerGirl', 'Girl@gmail.com', 22,'USA');
INSERT INTO Jouer Values(3, 'NoobMaster', 'Master@gmail.com', 30,'UK');
INSERT INTO Jouer Values(4, 'ProGamer', 'Pro@gmail.com', 28,'Canada');
INSERT INTO Jouer Values(5, 'lafriqin', 'dreach@gmail.com', 27,'Tunisia');
INSERT INTO Jouer Values(6, 'Eren','Freedom@gmail.com',24,'Germany');
INSERT INTO Jouer Values(7, 'Hassan','Skyrim@gmail.com',29,'Morocco');
--table: Jeu
INSERT INTO Jeu Values(1,'Valorant', 'shooter', '12+', 'PC', 1);
INSERT INTO Jeu Values(2,'EldenRing','RolePlaying','18+','PC',2);
INSERT INTO Jeu Values(3,'FIFA23','Sports','3+','PC',3);
INSERT INTO Jeu Values(4,'Minecraft','Sandbox','7+','PC',4);
INSERT INTO Jeu Values(5,'TheWitcher3','RolePlaying','18+','PC',2);
INSERT INTO Jeu Values(6,'Cyberpunk2077','RolePlaying','18+','PC',2);
INSERT INTO Jeu Values(7,'AmongUs','Party','7+','PC',4);

--table: Achat
INSERT INTO Achat Values(1, 1, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO Achat Values(2, 2, TO_DATE('2022-02-20', 'YYYY-MM-DD'));
INSERT INTO Achat Values(3, 3, TO_DATE('2022-03-25', 'YYYY-MM-DD'));
INSERT INTO Achat Values(4, 4, TO_DATE('2022-04-30', 'YYYY-MM-DD'));
INSERT INTO Achat Values(5, 5, TO_DATE('2022-05-10', 'YYYY-MM-DD'));
INSERT INTO Achat Values(6, 6, TO_DATE('2022-06-15', 'YYYY-MM-DD'));
INSERT INTO Achat Values(7, 7, TO_DATE('2022-07-20', 'YYYY-MM-DD'));


--table: SessionJeu
INSERT INTO SessionJeu Values(1, TO_DATE('2022-08-01', 'YYYY-MM-DD'), INTERVAL '2' HOUR, 1);
INSERT INTO SessionJeu Values(2, TO_DATE('2022-08-02', 'YYYY-MM-DD'), INTERVAL '1' HOUR + '30' MINUTE, 2);
INSERT INTO SessionJeu Values(3, TO_DATE('2022-08-03', 'YYYY-MM-DD'), INTERVAL '3' HOUR + '15' MINUTE, 3);
INSERT INTO SessionJeu Values(4, TO_DATE('2022-08-04', 'YYYY-MM-DD'), INTERVAL '4' HOUR, 4);
INSERT INTO SessionJeu Values(5, TO_DATE('2022-08-05', 'YYYY-MM-DD'), INTERVAL '2' HOUR + '45' MINUTE, 5);
INSERT INTO SessionJeu Values(6, TO_DATE('2022-08-06', 'YYYY-MM-DD'), INTERVAL '5' HOUR, 6);
INSERT INTO SessionJeu Values(7, TO_DATE('2022-08-07', 'YYYY-MM-DD'), INTERVAL '1' HOUR + '15' MINUTE, 7);

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




--insertions avec erreurs:

--table: Jouer (doublon ID_Jouer)---------------------------------
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