CREATE TABLE STAFFAPP.APP_ITEMTYPE
(
  ID           NUMBER(19)                       NOT NULL,
  CREATED_AT   TIMESTAMP(6)                     NOT NULL,
  DESCRIPTION  VARCHAR2(255 CHAR),
  ENABLED      NUMBER(1),
  IMAGE        BLOB,
  MODIFIED_AT  TIMESTAMP(6),
  TYPE_NAME    VARCHAR2(255 CHAR)               NOT NULL
)
LOB (IMAGE) STORE AS SECUREFILE (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  NOCACHE
  LOGGING)
TABLESPACE USERS
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


ALTER TABLE STAFFAPP.APP_ITEMTYPE ADD (
  PRIMARY KEY
  (ID)
  USING INDEX
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);


--  There is no statement for index STAFFAPP.SYS_C007798.
--  The object is created when the parent object is created.
