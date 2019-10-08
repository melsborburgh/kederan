
  CREATE TABLE KDR_MENU 
   (	MENU_LEVEL NUMBER,  
	MENU_LABEL VARCHAR2(200) NOT NULL ENABLE,  
	MENU_TARGET VARCHAR2(1000),  
	MENU_CURRENT VARCHAR2(5),  
	MENU_ICON VARCHAR2(1000),  
	MENU_IMAGE VARCHAR2(1000),  
	MENU_SEQ VARCHAR2(5),  
	MENU_ITEM_ID NUMBER,  
	MENU_PARENT_ID NUMBER,  
	MENU_TYPE VARCHAR2(10),  
	AUDIT_CREATION_DATE DATE INVISIBLE,  
	AUDIT_CREATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_CREATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_DATE DATE INVISIBLE,  
	AUDIT_MUTATION_USER VARCHAR2(1000) INVISIBLE,  
	AUDIT_MUTATION_SOURCE VARCHAR2(1000) INVISIBLE,  
	 CONSTRAINT KDR_MENU_PK PRIMARY KEY (MENU_ITEM_ID) 
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
