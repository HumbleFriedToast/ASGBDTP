
-- Q18) Jointure : lister les joueurs et les jeux qu'ils ont achetés (date + prix)
SELECT j.USERNAME, je.Titre, a.DateAchat, je.Prix
FROM Jouer j
JOIN Achat a ON j.ID_Jouer = a.ID_Jouer
JOIN Jeu je ON a.ID_Jeu = je.ID_Jeu;

-- Q19) Agrégation : calculer le prix moyen des achats par joueur
SELECT a.ID_Jouer, AVG(je.Prix) AS Prix_moy
FROM Achat a
JOIN Jeu je ON a.ID_Jeu = je.ID_Jeu
GROUP BY a.ID_Jouer;

--Q20)requete 19 mais avec des VUEs
CREATE OR REPLACE VIEW Vue_Achat_Jeu AS
SELECT a.ID_Jouer, je.Prix
FROM Achat a
JOIN Jeu je ON a.ID_Jeu = je.ID_Jeu;

SELECT ID_Jouer, AVG(Prix) AS Prix_moy
FROM Vue_Achat_Jeu
GROUP BY ID_Jouer;