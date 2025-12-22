
--SECTION 1: languages de  definition de donnees (DDL)
--PARTIE 1: Creation des tables
--les Tables Proposees:
CREATE TABLE `Jouer`(
    `ID_Jouer` BIGINT NOT NULL,
    `Pseudo` VARCHAR(32) NOT NULL,
    `Email` VARCHAR(100) NOT NULL,
    `Age` SMALLINT NOT NULL,
    PRIMARY KEY(`ID_Jouer`)
);

CREATE TABLE `Jeu`(
    `ID_Jeu` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Titre` VARCHAR(255) NOT NULL,
    `Genre` VARCHAR(100) NOT NULL,
    `ClassificationAge` VARCHAR(255) NOT NULL,
    `Plateform` VARCHAR(255) NOT NULL,
    `ID_StudioDev` BIGINT NOT NULL
);
CREATE TABLE `Achat`(
    `ID_Jouer` BIGINT NOT NULL,
    `ID_Jeu` VARCHAR(255) NOT NULL,
    `DateAchat` DATE NOT NULL,
    PRIMARY KEY(`ID_Jouer`)
);
ALTER TABLE
    `Achat` ADD PRIMARY KEY(`ID_Jeu`);
CREATE TABLE `SessionJeu`(
    `ID_Session` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `DateSession` DATE NOT NULL,
    `DureeSession` TIME NOT NULL,
    `ID_Jouer` BIGINT NOT NULL
);
CREATE TABLE `Trophée`(
    `ID_Trophée` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NomTrophée` VARCHAR(255) NOT NULL,
    `Points` INT NOT NULL,
    `ID_Jeu` BIGINT NOT NULL
);
CREATE TABLE `StudioDev`(
    `ID_StudioDev` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NomStudio` VARCHAR(255) NOT NULL,
    `DateCreation` DATE NOT NULL
);
ALTER TABLE
    `Trophée` ADD CONSTRAINT `trophée_id_jeu_foreign` FOREIGN KEY(`ID_Jeu`) REFERENCES `Jeu`(`ID_Jeu`);
ALTER TABLE
    `SessionJeu` ADD CONSTRAINT `sessionjeu_id_jouer_foreign` FOREIGN KEY(`ID_Jouer`) REFERENCES `Jouer`(`ID_Jouer`);
ALTER TABLE
    `Achat` ADD CONSTRAINT `achat_id_jouer_foreign` FOREIGN KEY(`ID_Jouer`) REFERENCES `Jouer`(`ID_Jouer`);
ALTER TABLE
    `Jeu` ADD CONSTRAINT `jeu_id_studiodev_foreign` FOREIGN KEY(`ID_StudioDev`) REFERENCES `StudioDev`(`ID_StudioDev`);
ALTER TABLE
    `Achat` ADD CONSTRAINT `achat_id_jeu_foreign` FOREIGN KEY(`ID_Jeu`) REFERENCES `Jeu`(`ID_Jeu`);
ALTER TABLE
    `Jeu` ADD CONSTRAINT `jeu_classificationage_check` CHECK (ClassificationAge IN ('E', 'E10+', 'T', 'M', 'AO'));
ALTER TABLE
    `Jeu` ADD CONSTRAINT `jeu_plateform_check` CHECK (Plateform IN ('XBOX', 'PLAYSTATION', 'SWITCH', 'PC', 'MOBILE'));
