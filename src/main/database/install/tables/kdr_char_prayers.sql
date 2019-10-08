CREATE TABLE  KDR_CHAR_PRAYERS
   (	CHAR_PRAYER_ID NUMBER NOT NULL ENABLE,
	CHAR_ID NUMBER NOT NULL ENABLE,
	PRAYER_ID NUMBER NOT NULL ENABLE,
	AUDIT_CREATION_DATE DATE INVISIBLE,
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_DATE DATE INVISIBLE,
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,
	 CONSTRAINT KDR_CHAR_PRAYERS_PK PRIMARY KEY (CHAR_PRAYER_ID)
  USING INDEX  ENABLE,
	 CONSTRAINT KDR_CHAR_PRAYERS UNIQUE (CHAR_ID, PRAYER_ID)
  USING INDEX  ENABLE
   )