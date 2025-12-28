--SECTION 0: CREATION D'UN UTILISATEUR ET ATTRIBUTION DE PRIVILEGES
--Creation of User
--SECTION 0: CREATION D'UN UTILISATEUR ET ATTRIBUTION DE PRIVILEGES (Oracle)
-- Création d'un utilisateur minimal (adapter le mot de passe)
CREATE USER NEW_USER IDENTIFIED BY secure_password;
GRANT CREATE SESSION TO NEW_USER;
-- Pour accorder des droits sur des objets précis, accordez-les après la création des objets :
-- GRANT SELECT, INSERT, UPDATE ON schema.table TO NEW_USER;

-- Création d'un tablespace (adapter le chemin des fichiers selon votre installation Oracle)
CREATE TABLESPACE Faycal_TBS DATAFILE '/opt/oracle/oradata/Faycal_TBS_file.db' SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL;
CREATE TEMPORARY TABLESPACE Faycal_temp_TBS TEMPFILE '/opt/oracle/oradata/Faycal_temp_TBS_file.db' SIZE 20M AUTOEXTEND ON NEXT 10M;

-- Création de l'utilisateur DALIL_FAYCAL avec tablespace par défaut
CREATE USER DALIL_FAYCAL IDENTIFIED BY your_password DEFAULT TABLESPACE Faycal_TBS TEMPORARY TABLESPACE Faycal_temp_TBS;
GRANT CREATE SESSION, CREATE TABLE TO DALIL_FAYCAL;
-- Exemples droit d'accès sur des objets :
-- GRANT SELECT, INSERT, UPDATE ON schema.table TO DALIL_FAYCAL;

