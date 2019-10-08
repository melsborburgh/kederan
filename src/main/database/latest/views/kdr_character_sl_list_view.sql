
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTER_SL_LIST_VIEW (CHAR_ID, 
CHAR_NAME, CHAR_NAME_INITIALS, CHAR_DESC) AS 
  select      char_id, 
            char_name,  
            apex_string.get_initials(char_name,1) char_name_initials,
            race_name || 
            case 
                when char_occupation is not null and char_class is not null 
                then 
                    ' ' || char_class || ' / ' || char_occupation
                when char_occupation is not null 
                then 
                    ' ' || char_occupation
                when char_class is not null 
                then 
                    ' ' || char_class
            end char_desc
from        kdr_characters_view;

