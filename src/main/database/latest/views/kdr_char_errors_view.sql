
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHAR_ERRORS_VIEW (LABEL, CHAR_ID,
 TEXT) AS 
  with xp_data as (select char_id, get_total_xp(char_id) total_xp, get_total_xp_
spend(char_id) total_xp_spend from kdr_characters)
select      'Soorten rasvaardigheden' label, 
            char_id,
            'Dit personage heeft rasvaardigheden van een ras waartoe het niet be
hoort: <b>' 
                ||  get_illegal_race_skills(char_id) 
                || '</b>' as text
from        kdr_characters
where       get_illegal_race_skills(char_id) is not null
union all
select      'Aantal rasvaardigheden', 
            char_id, 
            'Meer rasvaardigheden geselecteerd voor ras <b>'|| race_name || ' ['
 || current_amount || ']</b> dan toegestaan <b>[' || race_skill_amount || ']</b>
.'
from        KDR_CHAR_RACE_SKILL_AMOUNT_VW
where       current_amount > race_skill_amount
union all
select      'Uitgegeven xp',
            char_id, 
            'Meer xp uitgegeven <b>[' || total_xp_spend || ']</b> dan toegestaan
 <b>[' || total_xp || ']</b>.'            
from        xp_data
where       total_xp < total_xp_spend
order by    2,3;

