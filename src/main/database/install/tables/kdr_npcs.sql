
  CREATE TABLE KDR_NPCS 
   (	NPC_ID NUMBER NOT NULL ENABLE,  
	NPC_RACE VARCHAR2(100),  
	NPC_NAME VARCHAR2(300) NOT NULL ENABLE,  
	NPC_PERSONALITY VARCHAR2(4000),  
	NPC_SKILLS VARCHAR2(4000),  
	NPC_HITPOINTS NUMBER,  
	NPC_MANA NUMBER,  
	NPC_ARC_MANA NUMBER,  
	NPC_CHAOS_MANA NUMBER,  
	NPC_DIVINITY NUMBER,  
	NPC_ITEMS VARCHAR2(4000),  
	NPC_DRESSCODE VARCHAR2(4000),  
	NPC_DESC CLOB,  
	NPC_SHORT_DESC VARCHAR2(200),  
	NPC_PLAYED_BY VARCHAR2(300),  
	AUDIT_CREATION_DATE DATE INVISIBLE,  
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_DATE DATE INVISIBLE,  
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	 CONSTRAINT KDR_NPCS_PK PRIMARY KEY (NPC_ID) 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
    ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 393216 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
   
 LOB (NPC_DESC) STORE AS BASICFILE (
   ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

