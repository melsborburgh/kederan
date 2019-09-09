create or replace trigger KDR_PLOT_CATEGORIES_bir_AUDIT
before INSERT on        
KDR_PLOT_CATEGORIES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
   

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_CATEGORIES_bur_AUDIT
before UPDATE on        
KDR_PLOT_CATEGORIES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
   

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_TAGS_bir_AUDIT
before INSERT on              
KDR_CHAR_TAGS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_TAGS_bur_AUDIT
before UPDATE on              
KDR_CHAR_TAGS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHARACTERS_bir_AUDIT
before INSERT on             
KDR_CHARACTERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHARACTERS_bur_AUDIT
before UPDATE on             
KDR_CHARACTERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_EVENTS_bir_AUDIT
before INSERT on            
KDR_CHAR_EVENTS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_EVENTS_bur_AUDIT
before UPDATE on            
KDR_CHAR_EVENTS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_ITEMS_bir_AUDIT
before INSERT on             
KDR_CHAR_ITEMS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_ITEMS_bur_AUDIT
before UPDATE on             
KDR_CHAR_ITEMS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_LANGUAGES_bir_AUDIT
before INSERT on         
KDR_CHAR_LANGUAGES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
    

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_LANGUAGES_bur_AUDIT
before UPDATE on         
KDR_CHAR_LANGUAGES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
    

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_NOTES_bir_AUDIT
before INSERT on             
KDR_CHAR_NOTES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_NOTES_bur_AUDIT
before UPDATE on             
KDR_CHAR_NOTES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_PRAYERS_bir_AUDIT
before INSERT on           
KDR_CHAR_PRAYERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_PRAYERS_bur_AUDIT
before UPDATE on           
KDR_CHAR_PRAYERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_RECIPES_bir_AUDIT
before INSERT on           
KDR_CHAR_RECIPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_RECIPES_bur_AUDIT
before UPDATE on           
KDR_CHAR_RECIPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_SKILLS_bir_AUDIT
before INSERT on            
KDR_CHAR_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_SKILLS_bur_AUDIT
before UPDATE on            
KDR_CHAR_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_SPELLS_bir_AUDIT
before INSERT on            
KDR_CHAR_SPELLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_CHAR_SPELLS_bur_AUDIT
before UPDATE on            
KDR_CHAR_SPELLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_DEITIES_bir_AUDIT
before INSERT on KDR_DEITIES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_DEITIES_bur_AUDIT
before UPDATE on KDR_DEITIES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_DISTANCES_bir_AUDIT
before INSERT on              
KDR_DISTANCES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_DISTANCES_bur_AUDIT
before UPDATE on              
KDR_DISTANCES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_DURATIONS_bir_AUDIT
before INSERT on              
KDR_DURATIONS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_DURATIONS_bur_AUDIT
before UPDATE on              
KDR_DURATIONS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_EVENTS_bir_AUDIT
before INSERT on KDR_EVENTS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_EVENTS_bur_AUDIT
before UPDATE on KDR_EVENTS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_EVENT_TYPES_bir_AUDIT
before INSERT on            
KDR_EVENT_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_EVENT_TYPES_bur_AUDIT
before UPDATE on            
KDR_EVENT_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_ITEMS_bir_AUDIT
before INSERT on KDR_ITEMS
for    
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_ITEMS_bur_AUDIT
before UPDATE on KDR_ITEMS
for    
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_ITEM_TYPES_bir_AUDIT
before INSERT on             
KDR_ITEM_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_ITEM_TYPES_bur_AUDIT
before UPDATE on             
KDR_ITEM_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_LAMMIES_bir_AUDIT
before INSERT on KDR_LAMMIES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_LAMMIES_bur_AUDIT
before UPDATE on KDR_LAMMIES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_LANGUAGES_bir_AUDIT
before INSERT on              
KDR_LANGUAGES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_LANGUAGES_bur_AUDIT
before UPDATE on              
KDR_LANGUAGES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_MENU_bir_AUDIT
before INSERT on KDR_MENU
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date :=  
localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
           

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_MENU_bur_AUDIT
before UPDATE on KDR_MENU
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date :=  
localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
           

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_NPCS_bir_AUDIT
before INSERT on KDR_NPCS
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date :=  
localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
           

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_NPCS_bur_AUDIT
before UPDATE on KDR_NPCS
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date :=  
localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
           

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_NPC_PRAYERS_bir_AUDIT
before INSERT on            
KDR_NPC_PRAYERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_NPC_PRAYERS_bur_AUDIT
before UPDATE on            
KDR_NPC_PRAYERS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_NPC_SKILLS_bir_AUDIT
before INSERT on             
KDR_NPC_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_NPC_SKILLS_bur_AUDIT
before UPDATE on             
KDR_NPC_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_NPC_SPELLS_bir_AUDIT
before INSERT on             
KDR_NPC_SPELLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_NPC_SPELLS_bur_AUDIT
before UPDATE on             
KDR_NPC_SPELLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLAYERS_bir_AUDIT
before INSERT on KDR_PLAYERS
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_PLAYERS_bur_AUDIT
before UPDATE on KDR_PLAYERS
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_PLOT_bir_AUDIT
before INSERT on KDR_PLOT
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date :=  
localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
           

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_PLOT_bur_AUDIT
before UPDATE on KDR_PLOT
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date :=  
localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
           

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_PLOT_NPCS_bir_AUDIT
before INSERT on              
KDR_PLOT_NPCS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_NPCS_bur_AUDIT
before UPDATE on              
KDR_PLOT_NPCS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
         

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_PROPS_bir_AUDIT
before INSERT on             
KDR_PLOT_PROPS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_PROPS_bur_AUDIT
before UPDATE on             
KDR_PLOT_PROPS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_SIZES_bir_AUDIT
before INSERT on             
KDR_PLOT_SIZES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_SIZES_bur_AUDIT
before UPDATE on             
KDR_PLOT_SIZES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
        

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_TIMING_bir_AUDIT
before INSERT on            
KDR_PLOT_TIMING
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PLOT_TIMING_bur_AUDIT
before UPDATE on            
KDR_PLOT_TIMING
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_PRAYERS_bir_AUDIT
before INSERT on KDR_PRAYERS
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_PRAYERS_bur_AUDIT
before UPDATE on KDR_PRAYERS
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_RACES_bir_AUDIT
before INSERT on KDR_RACES
for    
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_RACES_bur_AUDIT
before UPDATE on KDR_RACES
for    
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_RECIPES_bir_AUDIT
before INSERT on KDR_RECIPES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_RECIPES_bur_AUDIT
before UPDATE on KDR_RECIPES
for
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_RECIPE_COMPONENTS_bir_AUDIT
before INSERT on      
KDR_RECIPE_COMPONENTS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
 

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_RECIPE_COMPONENTS_bur_AUDIT
before UPDATE on      
KDR_RECIPE_COMPONENTS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
 

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_RECIPE_TYPES_bir_AUDIT
before INSERT on           
KDR_RECIPE_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_RECIPE_TYPES_bur_AUDIT
before UPDATE on           
KDR_RECIPE_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SEARCH_SKILLS_bir_AUDIT
before INSERT on          
KDR_SEARCH_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
     

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SEARCH_SKILLS_bur_AUDIT
before UPDATE on          
KDR_SEARCH_SKILLS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
     

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SKILLS_bir_AUDIT
before INSERT on KDR_SKILLS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_SKILLS_bur_AUDIT
before UPDATE on KDR_SKILLS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_SKILL_CATEGORIES_bir_AUDIT
before INSERT on       
KDR_SKILL_CATEGORIES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
  

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SKILL_CATEGORIES_bur_AUDIT
before UPDATE on       
KDR_SKILL_CATEGORIES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
  

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SKILL_CATEGORY_TYPES_bir_AUDIT
before INSERT on   
KDR_SKILL_CATEGORY_TYPES
for each row 
-- Generated on 09-09-2019               
14:15:28
begin
    :new.audit_creation_date := localtimestamp;
                

:new.audit_creation_user := fnc_get_audit_user;
    :new.audit_creation_source  
:= sys_context('userenv','module');
end;
/
                                    

create or replace trigger KDR_SKILL_CATEGORY_TYPES_bur_AUDIT
before UPDATE on   
KDR_SKILL_CATEGORY_TYPES
for each row 
-- Generated on 09-09-2019               
14:15:28
begin
    :new.audit_mutation_date := localtimestamp;
                

:new.audit_mutation_user := fnc_get_audit_user;
    :new.audit_mutation_source  
:= sys_context('userenv','module');
end;
/
                                    

create or replace trigger KDR_SKILL_LEVELS_bir_AUDIT
before INSERT on           
KDR_SKILL_LEVELS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SKILL_LEVELS_bur_AUDIT
before UPDATE on           
KDR_SKILL_LEVELS
for each row 
-- Generated on 09-09-2019 14:15:28
begin
      

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SPELLS_bir_AUDIT
before INSERT on KDR_SPELLS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_SPELLS_bur_AUDIT
before UPDATE on KDR_SPELLS
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_SPELL_TYPES_bir_AUDIT
before INSERT on            
KDR_SPELL_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_creation_date := localtimestamp;
    :new.audit_creation_user :=     
fnc_get_audit_user;
    :new.audit_creation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_SPELL_TYPES_bur_AUDIT
before UPDATE on            
KDR_SPELL_TYPES
for each row 
-- Generated on 09-09-2019 14:15:28
begin
       

:new.audit_mutation_date := localtimestamp;
    :new.audit_mutation_user :=     
fnc_get_audit_user;
    :new.audit_mutation_source :=                           
sys_context('userenv','module');
end;
/
                                       

create or replace trigger KDR_TAGS_bir_AUDIT
before INSERT on KDR_TAGS
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date :=  
localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
           

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_TAGS_bur_AUDIT
before UPDATE on KDR_TAGS
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date :=  
localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
           

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_TODO_bir_AUDIT
before INSERT on KDR_TODO
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date :=  
localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
           

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_TODO_bur_AUDIT
before UPDATE on KDR_TODO
for each 
row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date :=  
localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
           

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_USAGES_bir_AUDIT
before INSERT on KDR_USAGES
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_creation_date
:= localtimestamp;
    :new.audit_creation_user := fnc_get_audit_user;
        

:new.audit_creation_source := sys_context('userenv','module');
end;
/
         

create or replace trigger KDR_USAGES_bur_AUDIT
before UPDATE on KDR_USAGES
for  
each row 
-- Generated on 09-09-2019 14:15:28
begin
    :new.audit_mutation_date
:= localtimestamp;
    :new.audit_mutation_user := fnc_get_audit_user;
        

:new.audit_mutation_source := sys_context('userenv','module');
end;
/
         

