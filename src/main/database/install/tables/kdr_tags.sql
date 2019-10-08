CREATE TABLE  KDR_TAGS
   (	TAG_ID NUMBER(30,0) NOT NULL ENABLE,
	TAG_NAME VARCHAR2(1000) NOT NULL ENABLE,
	AUDIT_CREATION_DATE DATE INVISIBLE,
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_DATE DATE INVISIBLE,
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,
	 CONSTRAINT KDR_TAGS_PK PRIMARY KEY (TAG_ID)
  USING INDEX  ENABLE,
	 CONSTRAINT KDR_TAGS_UK1 UNIQUE (TAG_NAME)
  USING INDEX  ENABLE
   )