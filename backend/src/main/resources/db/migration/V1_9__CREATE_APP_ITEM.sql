CREATE TABLE STAFFAPP.APP_ITEM
(
  ID               NUMBER(19)                   NOT NULL,
  BARCODE          VARCHAR2(255 CHAR)           NOT NULL,
  CREATED_AT       TIMESTAMP(6)                 NOT NULL,
  DESCRIPTION      VARCHAR2(255 CHAR)           NOT NULL,
  ENABLED          NUMBER(1),
  IMAGE            BLOB,
  ITEM_NAME        VARCHAR2(255 CHAR)           NOT NULL,
  MANUFACTURED_AT  TIMESTAMP(6)                 NOT NULL,
  MODIFIED_AT      TIMESTAMP(6),
  APP_EMPLOYEE_ID  NUMBER(19),
  APP_ITEMTYPE_ID  NUMBER(19)                   NOT NULL,
  APP_LOCATION_ID  NUMBER(19)
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


CREATE UNIQUE INDEX STAFFAPP.UK_3O6CBOQ82MWX186MLO1CJMN3W ON STAFFAPP.APP_ITEM
(BARCODE)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE STAFFAPP.APP_ITEM ADD (
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
  ENABLE VALIDATE
,  CONSTRAINT UK_3O6CBOQ82MWX186MLO1CJMN3W
  UNIQUE (BARCODE)
  USING INDEX STAFFAPP.UK_3O6CBOQ82MWX186MLO1CJMN3W
  ENABLE VALIDATE);


--  There is no statement for index STAFFAPP.SYS_C007786.
--  The object is created when the parent object is created.
