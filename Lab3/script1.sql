DROP TABLE IF EXISTS MUSICIANS          CASCADE;
DROP TABLE IF EXISTS INSTRUMENTS        CASCADE;
DROP TABLE IF EXISTS PLAYS              CASCADE;
DROP TABLE IF EXISTS SONGAPPEARS        CASCADE;
DROP TABLE IF EXISTS TELEPHONEHOME      CASCADE;
DROP TABLE IF EXISTS LIVES              CASCADE;
DROP TABLE IF EXISTS PLACE              CASCADE;
DROP TABLE IF EXISTS PERFORM            CASCADE;
DROP TABLE IF EXISTS PRODUCES           CASCADE;


CREATE TABLE MUSICIANS
(       
        SSN     CHAR(10)        NOT NULL UNIQUE,
        NAME    CHAR(30)        NOT NULL UNIQUE,
        PRIMARY KEY(SSN)
);

CREATE TABLE INSTRUMENTS
(       
        INSTRUMENTID    CHAR(55)        NOT NULL UNIQUE,
        KEY             CHAR(10),
        DNAME           CHAR(55),
        PRIMARY KEY (INSTRUMENTID)
);

CREATE TABLE PLAYS
(       
        SSN             CHAR(10)        NOT NULL UNIQUE,
        INSTRUMENTID    CHAR(55)        NOT NULL UNIQUE,
        PRIMARY KEY(SSN, INSTRUMENTID),
        FOREIGN KEY(SSN) REFERENCES MUSICIANS,
        FOREIGN KEY(INSTRUMENTID) REFERENCES INSTRUMENTS
);

CREATE TABLE PRODUCES
(
        ALBUMIDENTIFIER INTEGER         NOT NULL UNIQUE,
        SSN             CHAR(10)        NOT NULL UNIQUE,
        SPEED           INTEGER,
        TITLE           CHAR(55),
        PRIMARY KEY(ALBUMIDENTIFIER),
        FOREIGN KEY(SSN) REFERENCES MUSICIANS
 );

CREATE TABLE SONGAPPEARS
(
        SONGID          INTEGER         NOT NULL UNIQUE,
        AUTHOR          CHAR(55),
        TITLE           CHAR(55),
        ALBUMIDENTIFIER INTEGER         NOT NULL,
        PRIMARY KEY(SONGID),
        FOREIGN KEY(ALBUMIDENTIFIER) REFERENCES PRODUCES
);

CREATE TABLE PLACE
(
        ADDRESS         CHAR(55),
  		PRIMARY KEY(ADDRESS)
);

CREATE TABLE TELEPHONEHOME
(
        PHONE           CHAR(55)        NOT NULL UNIQUE,
        ADDRESS         CHAR(55),
        PRIMARY KEY(PHONE),
        FOREIGN KEY(ADDRESS) REFERENCES PLACE
);
CREATE TABLE LIVES
(
        SSN             CHAR(10)        NOT NULL UNIQUE,
        PHONE           CHAR(55)        NOT NULL UNIQUE,
        ADDRESS         CHAR(55),
        PRIMARY KEY(SSN, ADDRESS),
        FOREIGN KEY(PHONE) REFERENCES TELEPHONEHOME,
  		FOREIGN KEY(ADDRESS) REFERENCES PLACE,
        FOREIGN KEY(SSN) REFERENCES MUSICIANS
);
CREATE TABLE PERFORM
(
        SONGID          INTEGER         NOT NULL UNIQUE,
        SSN             CHAR(10)        NOT NULL UNIQUE,
        PRIMARY KEY(SSN, SONGID),
        FOREIGN KEY(SSN) REFERENCES MUSICIANS,
        FOREIGN KEY(SONGID) REFERENCES SONGAPPEARS
);
