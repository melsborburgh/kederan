CREATE TABLE  KDR_DURATIONS
   (	DURATION_ID NUMBER NOT NULL ENABLE,
	DURATION_NAME VARCHAR2(100) NOT NULL ENABLE,
	DURATION_DESC VARCHAR2(1000),
	DURATION_TYPE VARCHAR2(30),
	AUDIT_CREATION_DATE DATE INVISIBLE,
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_DATE DATE INVISIBLE,
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,
	 CONSTRAINT KDR_DURATIONS_PK PRIMARY KEY (DURATION_ID)
  USING INDEX  ENABLE
   )