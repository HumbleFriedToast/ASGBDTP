--Requete de Jointure:
--Requete de Group by:
--calculer le prix moyen des achats par joueur
-- Q1) Jointure : lister les joueurs et les jeux qu'ils ont achetés (date + prix)
SELECT j.Pseudo, je.Titre, a.DateAchat, a.Prix
FROM Jouer j
JOIN Achat a ON j.ID_Jouer = a.ID_Jouer
JOIN Jeu je ON a.ID_Jeu = je.ID_Jeu;

-- Q2) Agrégation : calculer le prix moyen des achats par joueur
SELECT a.ID_Jouer, AVG(a.Prix) AS Prix_moy
FROM Achat a
GROUP BY a.ID_Jouer;

-- Q3) Somme du temps de jeu par joueur (somme des INTERVALs)
SELECT s.ID_Jouer, SUM(s.DureeSession) AS TotalDuree
FROM SessionJeu s
GROUP BY s.ID_Jouer;

-- Q4) Top jeux par nombre d'achats
SELECT je.Titre, COUNT(*) AS NbAchat
FROM Achat a
JOIN Jeu je ON a.ID_Jeu = je.ID_Jeu
GROUP BY je.Titre
ORDER BY NbAchat DESC;

-- Q5) Jeux développés par des studios créés avant 1990 (exemple de sous-requête)
SELECT * FROM Jeu
WHERE ID_StudioDev IN (
	SELECT ID_StudioDev FROM StudioDev WHERE DateCreation < TO_DATE('1990-01-01','YYYY-MM-DD')
);

-- Q6) Liste des trophées par jeu
SELECT je.Titre, t.NomTrophee, t.Points
FROM TROPHEE t
JOIN Jeu je ON t.ID_Jeu = je.ID_Jeu
ORDER BY je.Titre, t.Points DESC;

-- Q7) Joueurs n'ayant jamais acheté (LEFT JOIN + IS NULL)
SELECT j.ID_Jouer, j.Pseudo
FROM Jouer j
LEFT JOIN Achat a ON j.ID_Jouer = a.ID_Jouer
WHERE a.ID_Jouer IS NULL;