--insertions normale:
--table: Jouer
INSERT INTO Jouer Values(1, 'PlayerOne', 'Player@gmail.com', 25);
INSERT INTO Jouer Values(2, 'GamerGirl', 'Girl@gmail.com', 22);
INSERT INTO Jouer Values(3, 'NoobMaster', 'Master@gmail.com', 30);
INSERT INTO Jouer Values(4, 'ProGamer', 'Pro@gmail.com', 28);
INSERT INTO Jouer Values(5, 'lafriqin', 'dreach@gmail.com', 27);
INSERT INTO Jouer Values(6, 'Eren','Freedom@gmail.com',24);
INSERT INTO Jouer Values(7, 'Hassan','Skyrim@gmail.com',29);
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
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()
INSERT INTO SessionJeu Values()

--table: TROPHEE
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()
INSERT INTO TROPHEE Values()

--table: StudioDev
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()
INSERT INTO StudioDev Values()




--insertions avec erreurs:
--table: Jouer (doublon ID_Jouer)
--table: Achat (clé étrangère invalide ID_Jeu)
--table: SessionJeu (contrainte nom_email_check violée)
--table: Achat (trigger achat_date_check_trg violé)
--table: Jeu (clé étrangère invalide ID_StudioDev)