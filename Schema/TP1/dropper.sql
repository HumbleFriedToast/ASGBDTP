-- dropper.sql
-- Drops trigger(s) and all tables for a full schema reset.
-- Run with: sqlplus system/oracle@XEPDB1 @dropper.sql

SET ECHO ON
SET SERVEROUTPUT ON

PROMPT Dropping known triggers (if any)...
BEGIN
  FOR trg IN (
    SELECT object_name FROM user_objects
    WHERE object_type = 'TRIGGER' AND object_name IN ('ACHAT_DATE_CHECK_TRG')
  ) LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP TRIGGER "'||trg.object_name||'"';
      DBMS_OUTPUT.PUT_LINE('Dropped trigger: ' || trg.object_name);
    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Could not drop trigger: ' || trg.object_name || ' (ignored)');
    END;
  END LOOP;
END;
/

PROMPT Dropping tables (CASCADE CONSTRAINTS PURGE)...
BEGIN
  FOR t IN (
    SELECT table_name FROM user_tables
    WHERE table_name IN (
      'ACHAT','TROPHEE','SESSIONJEU','JEU','STUDIODEV','JOUER'
    )
  ) LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP TABLE "' || t.table_name || '" CASCADE CONSTRAINTS PURGE';
      DBMS_OUTPUT.PUT_LINE('Dropped table: ' || t.table_name);
    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Could not drop table: ' || t.table_name || ' (ignored)');
    END;
  END LOOP;
END;
/

PROMPT Listing remaining tables...
SELECT table_name FROM user_tables ORDER BY table_name;

PROMPT Done.
EXIT
