DROP SEQUENCE IF EXISTS part_number_seq;
CREATE SEQUENCE part_number_seq START WITH 50000;

CREATE OR REPLACE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION triggerFunc()
    RETURNS trigger AS
    $BODY$
    BEGIN
        New.part_number := nextval('part_number_seq');
        return NEW;
    END;
    $BODY$
    LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER part_nyc_trigger BEFORE INSERT
ON part_nyc FOR EACH ROW
EXECUTE PROCEDURE triggerFunc();
