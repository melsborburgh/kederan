
  CREATE TABLE KDR_DURATIONS 
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
   ;

