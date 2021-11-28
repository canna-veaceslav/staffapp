CREATE TABLE STAFFAPP.APP_COMPANY
(
  ID            NUMBER(19)                      NOT NULL,
  COMPANY_NAME  VARCHAR2(255 CHAR)              NOT NULL,
  CREATED_AT    TIMESTAMP(6)                    NOT NULL,
  DESCRIPTION   VARCHAR2(255 CHAR),
  ENABLED       NUMBER(1),
  MODIFIED_AT   TIMESTAMP(6)
)
TABLESPACE STAFFAPP_DAT
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING
NOCOMPRESS
NOCACHE;


ALTER TABLE STAFFAPP.APP_COMPANY ADD (
  PRIMARY KEY
  (ID)
  USING INDEX
    TABLESPACE STAFFAPP_DAT
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);


--  There is no statement for index STAFFAPP.SYS_C00199635.
--  The object is created when the parent object is created.
