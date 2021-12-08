ALTER TABLE STAFFAPP.CONFIRMATION_TOKEN ADD (
  CONSTRAINT FKO9FL25WQYH7W7MNFKDQEN1RCM
  FOREIGN KEY (APP_USER_ID)
  REFERENCES STAFFAPP.APP_USER (ID)
  ENABLE VALIDATE);

ALTER TABLE STAFFAPP.APP_ITEM ADD (
  CONSTRAINT FK9VE4TXWDTOO9IL4VQJG4TM6U2
  FOREIGN KEY (APP_EMPLOYEE_ID)
  REFERENCES STAFFAPP.APP_EMPLOYEE (ID)
  ENABLE VALIDATE
,  CONSTRAINT FKIK6GBR24F6KHGWXPR7KRRXTXD
  FOREIGN KEY (APP_LOCATION_ID)
  REFERENCES STAFFAPP.APP_LOCATION (ID)
  ENABLE VALIDATE);

ALTER TABLE STAFFAPP.APP_EMPLOYEE ADD (
  CONSTRAINT FKFP8HI4P7QEVKJH11CH5DB22EF
  FOREIGN KEY (APP_LOCATION_ID)
  REFERENCES STAFFAPP.APP_LOCATION (ID)
  ENABLE VALIDATE
,  CONSTRAINT FKH8QUBC9WP8PWPK9RYWF25UXUJ
  FOREIGN KEY (APP_COMPANY_ID)
  REFERENCES STAFFAPP.APP_COMPANY (ID)
  ENABLE VALIDATE);

ALTER TABLE STAFFAPP.APP_ITEM_HIST ADD (
  CONSTRAINT FKCXBJKW5P4V5JJQGLU45X1ODF1
  FOREIGN KEY (APP_LOCATION_ID)
  REFERENCES STAFFAPP.APP_LOCATION (ID)
  ENABLE VALIDATE
,  CONSTRAINT FKR8MTYXCRSD8A2JM57EHB26210
  FOREIGN KEY (APP_EMPLOYEE_ID)
  REFERENCES STAFFAPP.APP_EMPLOYEE (ID)
  ENABLE VALIDATE);

ALTER TABLE STAFFAPP.APP_EMPLOYEE_HIST ADD (
  CONSTRAINT FKNSBDXFWHXPDOIA94ISEMJ2QSY
  FOREIGN KEY (APP_COMPANY_ID)
  REFERENCES STAFFAPP.APP_COMPANY (ID)
  ENABLE VALIDATE
,  CONSTRAINT FKRRSNNAH9L6LT5A1Y1865IAU8X
  FOREIGN KEY (APP_LOCATION_ID)
  REFERENCES STAFFAPP.APP_LOCATION (ID)
  ENABLE VALIDATE);