--insertions normale:
--table: Jouer
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()
INSERT INTO Jouer Values()

--table: Jeu
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()
INSERT INTO Jeu Values()


--table: Achat
INSERT INTO Achat Values()
INSERT INTO Achat Values()
INSERT INTO Achat Values()
INSERT INTO Achat Values()
INSERT INTO Achat Values()
INSERT INTO Achat Values()
INSERT INTO Achat Values()

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




--insertions avec erreurs:
--table: Jouer (doublon ID_Jouer)
--table: Achat (clé étrangère invalide ID_Jeu)
--table: SessionJeu (contrainte nom_email_check violée)
--table: Achat (trigger achat_date_check_trg violé)
--table: Jeu (clé étrangère invalide ID_StudioDev)