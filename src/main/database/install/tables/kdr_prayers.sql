CREATE TABLE  KDR_PRAYERS
   (	PRAYER_ID NUMBER NOT NULL ENABLE,
	PRAYER_NAME VARCHAR2(300) NOT NULL ENABLE,
	PRAYER_DISTANCE NUMBER NOT NULL ENABLE,
	PRAYER_DURATION NUMBER NOT NULL ENABLE,
	PRAYER_TARGET VARCHAR2(300) NOT NULL ENABLE,
	PRAYER_LEVEL NUMBER(2,0) NOT NULL ENABLE,
	PRAYER_DESC CLOB,
	PRAYER_DIVINITY_COST VARCHAR2(300) NOT NULL ENABLE,
	DEITY_CODE VARCHAR2(100),
	PRAYER_USAGE VARCHAR2(300),
	AUDIT_CREATION_DATE DATE INVISIBLE,
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_DATE DATE INVISIBLE,
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,
	 CONSTRAINT KDR_PRAYERS_PK PRIMARY KEY (PRAYER_ID)
  USING INDEX  ENABLE
   )