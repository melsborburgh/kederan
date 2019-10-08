
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHAR_ALLOWED_RACE_SKILLS (CHAR_ID
, CHAR_NAME, SKILL_NAME, SKILL_CATEGORY, SKILL_LEVEL_ID, CATEGORY_NAME) AS 
  select cha.char_id,
           cha.char_name,
           ski.skill_name,
           ski.skill_category,
           rsl.skill_level_id,
           rsl.category_name
    from kdr_race_skill_levels   rsl,
         kdr_races               rac,
         kdr_skills              ski,
         kdr_characters          cha
    where rsl.skill_id = ski.skill_id
          and ski.skill_category = rac.race_skill_category
          and(cha.race_id = rac.race_id
              or cha.race_id_sub = rac.race_id);

