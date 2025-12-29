--Requete de Jointure:


--Requete de Group by:
--calculer le prix moyen des achats par joueur
SELECT ID_Jouer,AVG(Prix) AS Prix_moy
FROM Achat
GROUP BY ID_Jouer