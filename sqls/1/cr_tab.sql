-------------------------------------------------------------------------
--  FILENAME : sample_create_table.sql  
-------------------------------------------------------------------------
--  DESCRIPTION :
--
-------------------------------------------------------------------------

CREATE TABLE STADIUM_T (
STADIUM_ID    CHAR(3) NOT NULL,
STADIUM_NAME  VARCHAR2(20) NOT NULL,
HOMETEAM_ID   CHAR(3),
SEAT_COUNT    NUMBER,
ADDRESS     VARCHAR2(60),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
CONSTRAINT STADIUM_T_PK PRIMARY KEY (STADIUM_ID)
);

CREATE TABLE TEAM_T (
TEAM_ID     CHAR(3) NOT NULL,
REGION_NAME VARCHAR2(4) NOT NULL,
TEAM_NAME   VARCHAR2(20) NOT NULL,
E_TEAM_NAME VARCHAR2(50),
ORIG_YYYY   CHAR(4),
STADIUM_ID  CHAR(3) NOT NULL,
ZIP_CODE1   CHAR(3),
ZIP_CODE2   CHAR(3),
ADDRESS     VARCHAR2(60),
DDD         VARCHAR2(3),
TEL         VARCHAR2(10),
FAX         VARCHAR2(10),
HOMEPAGE    VARCHAR2(50),
OWNER       VARCHAR2(10),
CONSTRAINT TEAM_T_PK PRIMARY KEY (TEAM_ID),
CONSTRAINT TEAM_T_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM_T(STADIUM_ID)
);

CREATE TABLE PLAYER_T (
PLAYER_ID     CHAR(7) NOT NULL,
PLAYER_NAME   VARCHAR2(20) NOT NULL,
TEAM_ID       CHAR(3) NOT NULL,
E_PLAYER_NAME VARCHAR2(40),
NICKNAME      VARCHAR2(30),
JOIN_YYYY     CHAR(4),
POSITION      VARCHAR2(10),
BACK_NO       NUMBER(2),
NATION        VARCHAR2(20),
BIRTH         DATE,
SOLAR         CHAR(1),
HEIGHT        NUMBER(3),
WEIGHT        NUMBER(3),
CONSTRAINT PLAYER_T_PK PRIMARY KEY (PLAYER_ID),
CONSTRAINT PLAYER_T_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM_T(TEAM_ID)
);

CREATE TABLE SCHEDULE_T (
GUBUN        CHAR(1) NOT NULL,
STADIUM_ID   VARCHAR2(5) NOT NULL,
SCHE_DATE    CHAR(8) NOT NULL,
HOMETEAM_ID  CHAR(3) NOT NULL,
AWAYTEAM_ID  CHAR(3) NOT NULL,
HOME_SCORE   NUMBER(2),
AWAY_SCORE   NUMBER(2),
CONSTRAINT SCHEDULE_T_PK PRIMARY KEY (GUBUN, STADIUM_ID, SCHE_DATE)
);

CREATE TABLE TEAM_HISTORY_T (
TEAM_ID  CHAR(3) NOT NULL,
YYYY     CHAR(4) NOT NULL,
SEQ      NUMBER  NOT NULL,
COMMENTS  VARCHAR2(100),
CONSTRAINT TEAM_HISTORY_T_PK PRIMARY KEY (TEAM_ID, YYYY, SEQ)
);



