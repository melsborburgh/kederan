
  CREATE TABLE KDR_PRAYERS 
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
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    ENABLE, 
	 CONSTRAINT KDR_PRAYERS_DEITY_FK FOREIGN KEY (DEITY_CODE) 
	  REFERENCES KDR_DEITIES (DEITY_CODE) ENABLE,  
	 CONSTRAINT KDR_PRAYERS_DIST_FK FOREIGN KEY (PRAYER_DISTANCE) 
	  REFERENCES KDR_DISTANCES (DISTANCE_ID) ENABLE,  
	 CONSTRAINT KDR_PRAYERS_DURA_FK FOREIGN KEY (PRAYER_DURATION) 
	  REFERENCES KDR_DURATIONS (DURATION_ID) ENABLE 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 196608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
   
 LOB (PRAYER_DESC) STORE AS BASICFILE (
   ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

