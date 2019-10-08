
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RACE_SKILLS (CATEGORY_ID, CATEGOR
Y_NAME, CATEGORY_DESC, CATEGORY_TYPE, TYPE_ID, TYPE_NAME, TYPE_DESC, SKILL_ID, S
KILL_NAME, SKILL_DESC, SKILL_CATEGORY) AS 
  select      CATEGORY_ID,CATEGORY_NAME,CATEGORY_DESC,CATEGORY_TYPE,TYPE_ID,TYPE
_NAME,TYPE_DESC,SKILL_ID,SKILL_NAME,SKILL_DESC,SKILL_CATEGORY
from        kdr_race_skill_categories_view rsc,
            kdr_skills sk
where       sk.skill_category = rsc.category_id;

