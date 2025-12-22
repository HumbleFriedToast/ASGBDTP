--PARTIE 2: Ajouter Attributs
ALTER TABLE `Jouer`
    ADD COLUMN `Pays` VARCHAR(100) NOT NULL;
ALTER TABLE `Jeu`
    ADD COLUMN `DateSortie` DATE NOT NULL;
--PARTIE 3: Ajouter Contraint Not null
ALTER TABLE `Achat`
    MODIFY COLUMN `DateAchat` DATE NOT NULL;
ALTER TABLE `SessionJeu`
    MODIFY COLUMN `DureeSession` TIME NOT NULL;
--PARTIE 4: reduction de la taille d'un attribut
ALTER TABLE `Jouer`
    MODIFY COLUMN `Email` VARCHAR(80) NOT NULL;
ALTER TABLE `Jeu`
    MODIFY COLUMN `Genre` VARCHAR(50) NOT NULL;

--PARTIE 5:supression d'un collonne
ALTER TABLE `Jouer`
    DROP COLUMN `Age`;
ALTER TABLE `Jeu`
    DROP COLUMN `DateSortie`;
--PARTIE 6: renommer une table
RENAME TABLE `Trophée` TO `Trophee`;
RENAME TABLE `StudioDev` TO `Studio_Dev`;
--PARTIE 7: Ajouter la contrainte spécifiant qu’un attribut non déclaré clé étrangère fait référence à la cléd’uneautretable
ALTER TABLE `SessionJeu`
    ADD CONSTRAINT `sessionjeu_id_jouer_foreign` FOREIGN KEY(`ID_Jouer`) REFERENCES `Jouer`(`ID_Jouer`);
ALTER TABLE `Achat`
    ADD CONSTRAINT `achat_id_jeu_foreign` FOREIGN KEY(`ID_Jeu`) REFERENCES `Jeu`(`ID_Jeu`);
--PARTIE 8: contrainte des attributes intra-table 
--Nom de joueur et Email ne doivent pas être identiques
Alter Table `Jouer`
    ADD CONSTRAINT `nom_email_check` CHECK (Pseudo <> Email);

--PArtie 9: contrainte inter-table
--La date d’achat d’un jeu doit être postérieure à la date de création du studio de développement du jeu
Alter Table `Achat`
    ADD CONSTRAINT `achat_date_check` CHECK (DateAchat > (SELECT DateCreation FROM Studio_Dev JOIN Jeu ON Studio_Dev.ID_StudioDev = Jeu.ID_StudioDev WHERE Jeu.ID_Jeu = Achat.ID_Jeu));
--SECTION 2: LANGAGE DE MANIPULATION DE DONNEES (DML)
--PARTIE 1: insertion de donnes
