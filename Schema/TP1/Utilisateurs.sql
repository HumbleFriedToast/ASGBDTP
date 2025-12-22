--SECTION 0: CREATION D'UN UTILISATEUR ET ATTRIBUTION DE PRIVILEGES
--Creation of User
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'secure_password';
--Granting Privileges
GRANT SELECT, INSERT, UPDATE ON my_database.* TO 'new_user'@'localhost';
--Creation of TableSpace "Faycal_TBS" and  temporary tablespace "Faycal_temp_TBS"
CREATE TABLESPACE Faycal_TBS
    ADD DATAFILE 'C:/path_to_your_directory/Faycal_TBS_file.db
    ' SIZE 50M
    AUTOEXTEND ON
    NEXT 10M
    MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL;
CREATE TEMPORARY TABLESPACE Faycal_temp_TBS
    ADD TEMPFILE 'C:/path_to_your_directory/Faycal_temp_TBS_file.db
    ' SIZE 20M
    AUTOEXTEND ON
--creation of user DALIL FAYCAL with default tablespace Faycal_TBS and temporary tablespace Faycal_temp_TBS
CREATE USER DALIL_FAYCAL IDENTIFIED BY 'your_password'
DEFAULT TABLESPACE Faycal_TBS
TEMPORARY TABLESPACE Faycal_temp_TBS;
GRANT CONNECT, RESOURCE TO DALIL_FAYCAL;
--Granting DALIL FAYCAL Priviliges
GRANT SELECT, INSERT, UPDATE ON my_database.* TO DALIL_FAYCAL;

