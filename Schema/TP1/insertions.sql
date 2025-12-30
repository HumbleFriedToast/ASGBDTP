--Q14.1) Insertions sans erreurs:
-- Note: schema altered — `Pseudo` renamed to `USERNAME`, `Age` removed.
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(1, 'PlayerOne', 'Player@gmail.com', 'France');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(2, 'GamerGirl', 'Girl@gmail.com', 'USA');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(3, 'NoobMaster', 'Master@gmail.com', 'UK');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(4, 'ProGamer', 'Pro@gmail.com', 'Germany');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(5, 'lafriqin', 'dreach@gmail.com', 'Algeria');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(6, 'Eren','Freedom@gmail.com', 'Turkey');
INSERT INTO Jouer (ID_Jouer, USERNAME, Email, Pays) VALUES(7, 'Hassan','Skyrim@gmail.com', 'Morocco');
--table: StudioDev
INSERT INTO StudioDev Values(1, 'RiotGames', TO_DATE('2006-09-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(2, 'FromSoftware', TO_DATE('1986-11-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(3, 'EA Sports', TO_DATE('1982-05-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(4, 'Mojang Studios', TO_DATE('2009-11-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(5, 'CD Projekt Red', TO_DATE('2002-07-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(6, 'Innersloth', TO_DATE('2015-06-01', 'YYYY-MM-DD'));
INSERT INTO StudioDev Values(7, 'Bethesda', TO_DATE('1986-10-01', 'YYYY-MM-DD'));

--table: Jeu
-- ClassificationAge uses codes: E, E10+, T, M, AO (as enforced by the CHECK constraint)
-- `Jeu` now has `DateSortie` (NOT NULL) and keeps `Prix` in the table.
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(1, 'Valorant', 'Shooter', 'T', 'PC', 1, 0, TO_DATE('2020-06-02','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(2, 'EldenRing', 'RolePlaying', 'M', 'PC', 2, 60, TO_DATE('2022-02-25','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(3, 'FIFA23', 'Sports', 'E', 'PC', 3, 50, TO_DATE('2022-09-27','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(4, 'Minecraft', 'Sandbox', 'E', 'PC', 4, 30, TO_DATE('2011-11-18','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(5, 'TheWitcher3', 'RolePlaying', 'M', 'PC', 5, 40, TO_DATE('2015-05-19','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(6, 'Cyberpunk2077', 'RolePlaying', 'M', 'PC', 5, 60, TO_DATE('2020-12-10','YYYY-MM-DD'));
INSERT INTO Jeu (ID_Jeu, Titre, Genre, ClassificationAge, Plateform, ID_StudioDev, Prix, DateSortie) VALUES(7, 'AmongUs', 'Party', 'E', 'PC', 6, 5, TO_DATE('2018-06-15','YYYY-MM-DD'));

--table: TROPHEE
INSERT INTO TROPHEE Values(1, 'FirstBlood', 10, 1);
INSERT INTO TROPHEE Values(2,'SharpShooter', 20, 1);
INSERT INTO TROPHEE Values(3,'DragonSlayer', 30, 2);
INSERT INTO TROPHEE Values(4,'Champion', 25, 3);
INSERT INTO TROPHEE Values(5,'Builder', 15, 4);
INSERT INTO TROPHEE Values(6,'MonsterHunter', 35, 5);
INSERT INTO TROPHEE Values(7,'StealthMaster', 20, 6);

--table: Achat
-- Include `Prix` column (added in Alteration.sql). Use explicit column list to avoid ambiguity.
-- `Achat` columns: (ID_Jouer, ID_Jeu, DateAchat). `DateAchat` is NOT NULL after alteration.
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(1, 1, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(2, 2, TO_DATE('2022-02-20', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(3, 3, TO_DATE('2022-03-25', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(4, 4, TO_DATE('2022-04-30', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(5, 5, TO_DATE('2022-05-10', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(6, 6, TO_DATE('2022-06-15', 'YYYY-MM-DD'));
INSERT INTO Achat (ID_Jouer, ID_Jeu, DateAchat) VALUES(7, 7, TO_DATE('2022-07-20', 'YYYY-MM-DD'));


--table: SessionJeu
-- Use HOUR TO MINUTE interval literals for clarity
-- `DureeSession` uses INTERVAL DAY TO SECOND(0); provide literals accordingly. Columns: (ID_Session, DateSession, DureeSession, ID_Jouer)
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(1, TO_DATE('2022-08-01', 'YYYY-MM-DD'), INTERVAL '0 02:00:00' DAY TO SECOND, 1);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(2, TO_DATE('2022-08-02', 'YYYY-MM-DD'), INTERVAL '0 01:30:00' DAY TO SECOND, 2);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(3, TO_DATE('2022-08-03', 'YYYY-MM-DD'), INTERVAL '0 03:15:00' DAY TO SECOND, 3);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(4, TO_DATE('2022-08-04', 'YYYY-MM-DD'), INTERVAL '0 04:00:00' DAY TO SECOND, 4);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(5, TO_DATE('2022-08-05', 'YYYY-MM-DD'), INTERVAL '0 02:45:00' DAY TO SECOND, 5);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(6, TO_DATE('2022-08-06', 'YYYY-MM-DD'), INTERVAL '0 05:00:00' DAY TO SECOND, 6);
INSERT INTO SessionJeu (ID_Session, DateSession, DureeSession, ID_Jouer) VALUES(7, TO_DATE('2022-08-07', 'YYYY-MM-DD'), INTERVAL '0 01:15:00' DAY TO SECOND, 7);



