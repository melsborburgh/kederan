
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTER_SKILLS_VIEW (SKILL_NAME
, LEVEL_ID, SKILL_ID, SKILL_LEVEL_ID, SKILL_DESC, CHAR_ID, CHAR_SKILL_ID, CHAR_N
AME, SKILL_COST, SKILL_GENERAL_DESC, CATEGORY_ID, CATEGORY_NAME, CATEGORY_DESC, 
CATEGORY_TYPE) AS 
  select  sk.skill_name,
        sl.level_id,
        sk.skill_id,
        sl.skill_level_id,
        sl.skill_desc,
        cs.char_id,
        cs.char_skill_id,
        cv.char_name,
        sl.skill_cost,
        sk.skill_desc as skill_general_desc,
        sc.CATEGORY_ID,sc.CATEGORY_NAME,sc.CATEGORY_DESC,sc.CATEGORY_TYPE
from    kdr_skill_levels sl,
        kdr_skills sk,
        kdr_char_skills cs,
        kdr_characters_view cv,
        kdr_skill_categories sc
where   sl.skill_id         = sk.skill_id
and     cs.skill_level_id   = sl.skill_level_id
and     cv.char_id          = cs.char_id
and     sc.category_id      = sk.skill_category;

