CREATE TABLE  KDR_SKILL_CATEGORY_TYPES
   (	TYPE_ID NUMBER,
	TYPE_NAME VARCHAR2(100),
	TYPE_DESC VARCHAR2(4000),
	AUDIT_CREATION_DATE DATE INVISIBLE,
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_DATE DATE INVISIBLE,
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,
	 CONSTRAINT KDR_SKILL_CATEGORY_TYPES_PK PRIMARY KEY (TYPE_ID)
  USING INDEX  ENABLE
   )