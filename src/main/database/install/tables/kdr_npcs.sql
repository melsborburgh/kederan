-- TODO : NPC resistances toevoegen

create table kdr_npcs
(
    NPC_ID              NUMBER not null enable,
    PLOT_ID             NUMBER not null enable,
    NPC_RACE            VARCHAR2(100),
    NPC_NAME            VARCHAR2(300),
    NPC_PERSONALITY     VARCHAR2(1000),
    NPC_SKILLS          VARCHAR2(1000),
    NPC_HITPOINTS       NUMBER,
    NPC_MANA            NUMBER,
    NPC_DIVINITY        NUMBER,
    NPC_ITEMS           VARCHAR2(1000),
    NPC_DRESSCODE       VARCHAR2(1000),
    NPC_DESC            CLOB,
    CONSTRAINT kdr_npcs_pk PRIMARY KEY (NPC_ID),
    CONSTRAINT kdr_npcs_plot_id_fk FOREIGN KEY (plot_id) REFERENCES kdr_plot(plot_id) ON DELETE CASCADE
);

create table kdr_npcs
(
    NPC_ID              NUMBER not null enable,
    NPC_RACE            VARCHAR2(100),
    NPC_NAME            VARCHAR2(300),
    NPC_PERSONALITY     VARCHAR2(1000),
    NPC_SKILLS          VARCHAR2(1000),
    NPC_HITPOINTS       NUMBER,
    NPC_MANA            NUMBER,
    NPC_ARC_MANA        NUMBER,
    NPC_CHAOS_MANA      NUMBER,
    NPC_DIVINITY        NUMBER,
    NPC_ITEMS           VARCHAR2(1000),
    NPC_DRESSCODE       VARCHAR2(1000),
    NPC_DESC            CLOB,
    CONSTRAINT kdr_npcs_pk PRIMARY KEY (NPC_ID)
);

create or replace trigger kdr_npcs_plot_id_trg  
   before insert on kdr_npcs
   for each row 
begin  
   if inserting then 
      if :NEW.NPC_ID is null then 
         select KDR_NPC_ID_SEQ.nextval into :NEW."NPC_ID" from dual; 
      end if; 
   end if; 
end;