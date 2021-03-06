
  CREATE TABLE KDR_CHAR_EVENTS 
   (	CHAR_EVENT_ID NUMBER NOT NULL ENABLE,  
	EVENT_ID NUMBER NOT NULL ENABLE,  
	CHAR_ID NUMBER NOT NULL ENABLE,  
	CHAR_EVENT_XP_ADJ NUMBER,  
	CHAR_EVENT_XP_REMARK VARCHAR2(300),  
	AUDIT_CREATION_DATE DATE INVISIBLE,  
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_DATE DATE INVISIBLE,  
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	 CONSTRAINT KDR_CHAR_EVENTS_PK PRIMARY KEY (CHAR_EVENT_ID) 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    ENABLE, 
	 CONSTRAINT KDR_CHAR_EVENTS_UK UNIQUE (EVENT_ID, CHAR_ID) 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    ENABLE, 
	 CONSTRAINT KDR_CHAR_EVENTS_CHAR_FK FOREIGN KEY (CHAR_ID) 
	  REFERENCES KDR_CHARACTERS (CHAR_ID) ON DELETE CASCADE ENABLE,  
	 CONSTRAINT KDR_CHAR_EVENTS_EVENT_FK FOREIGN KEY (EVENT_ID) 
	  REFERENCES KDR_EVENTS (EVENT_ID) ENABLE 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
   ;

