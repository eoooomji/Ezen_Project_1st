-- 생성자 Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   위치:        2023-01-24 17:16:47 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE area_sido (
    sido_num  NUMBER NOT NULL,
    sido_name VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE area_sido ADD CONSTRAINT area_sido_pk PRIMARY KEY ( sido_num );

CREATE TABLE area_sigungu (
    sigungu_num        NUMBER NOT NULL,
    sigungu_name       VARCHAR2(100) NOT NULL,
    area_sido_sido_num NUMBER NOT NULL
)
LOGGING;

ALTER TABLE area_sigungu ADD CONSTRAINT area_sigungu_pk PRIMARY KEY ( sigungu_num );

CREATE TABLE areas (
    area_num                 NUMBER NOT NULL,
    area_title               VARCHAR2(600) NOT NULL,
    area_address1            VARCHAR2(400) NOT NULL,
    area_address2            VARCHAR2(400),
    area_mapx                VARCHAR2(30) NOT NULL,
    area_mapy                VARCHAR2(30) NOT NULL,
    area_image               VARCHAR2(100),
    area_image2              VARCHAR2(100),
    area_overview            CLOB,
    area_create_date         DATE NOT NULL,
    readcount                NUMBER,
    area_sigungu_sigungu_num NUMBER NOT NULL
)
LOGGING;

ALTER TABLE areas ADD CONSTRAINT areas_pk PRIMARY KEY ( area_num );

CREATE TABLE cm_board (
    bno         NUMBER NOT NULL,
    title       VARCHAR2(100) NOT NULL,
    readcount   NUMBER,
    create_date DATE,
    content     VARCHAR2(4000) NOT NULL,
    user_num    NUMBER NOT NULL
)
LOGGING;

ALTER TABLE cm_board ADD CONSTRAINT cm_board_pk PRIMARY KEY ( bno );

CREATE TABLE cm_comment (
    cno           NUMBER NOT NULL,
    board_comment VARCHAR2(2000),
    comment_date  DATE,
    user_num      NUMBER NOT NULL,
    bno           NUMBER NOT NULL
)
LOGGING;

ALTER TABLE cm_comment ADD CONSTRAINT cm_comment_pk PRIMARY KEY ( cno );

CREATE TABLE tags (
    tag_num  NUMBER NOT NULL,
    tag_name VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE tags ADD CONSTRAINT tags_pk PRIMARY KEY ( tag_num );

CREATE TABLE tags_areas (
    areas_area_num NUMBER NOT NULL,
    tags_tag_num   NUMBER NOT NULL
)
LOGGING;

CREATE TABLE us (
    user_num NUMBER NOT NULL,
    nickname VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE us ADD CONSTRAINT us_pk PRIMARY KEY ( user_num );

ALTER TABLE area_sigungu
    ADD CONSTRAINT area_sigungu_area_sido_fk FOREIGN KEY ( area_sido_sido_num )
        REFERENCES area_sido ( sido_num )
    NOT DEFERRABLE;

ALTER TABLE areas
    ADD CONSTRAINT areas_area_sigungu_fk FOREIGN KEY ( area_sigungu_sigungu_num )
        REFERENCES area_sigungu ( sigungu_num )
    NOT DEFERRABLE;

ALTER TABLE cm_board
    ADD CONSTRAINT cm_board_us_fk FOREIGN KEY ( user_num )
        REFERENCES us ( user_num )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE cm_comment
    ADD CONSTRAINT cm_comment_cm_board_fk FOREIGN KEY ( bno )
        REFERENCES cm_board ( bno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE cm_comment
    ADD CONSTRAINT cm_comment_us_fk FOREIGN KEY ( user_num )
        REFERENCES us ( user_num )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE tags_areas
    ADD CONSTRAINT tags_areas_areas_fk FOREIGN KEY ( areas_area_num )
        REFERENCES areas ( area_num )
    NOT DEFERRABLE;

ALTER TABLE tags_areas
    ADD CONSTRAINT tags_areas_tags_fk FOREIGN KEY ( tags_tag_num )
        REFERENCES tags ( tag_num )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
