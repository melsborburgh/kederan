
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_NPCS_SKILLS_VIEW (SKILL_NAME, CAT
EGORY_NAME, LEVEL_ID, SKILL_ID, SKILL_LEVEL_ID, SKILL_DESC, NPC_ID, NPC_SKILL_ID
, NPC_NAME, SKILL_COST) AS 
  select  sk.skill_name,
        sc.category_name,
        sl.level_id,
        sk.skill_id,
        sl.skill_level_id,
        sl.skill_desc,
        cs.NPC_id,
        cs.NPC_skill_id,
        cv.NPC_name,
        sl.skill_cost
from    kdr_skill_levels       sl,
        kdr_skills             sk,
        kdr_NPC_skills         cs,
        kdr_npcs_view          cv,
        kdr_skill_categories   sc
where   sl.skill_id         = sk.skill_id
and     cs.skill_level_id   = sl.skill_level_id
and     cv.NPC_id           = cs.NPC_id
and     sc.category_id      = sk.skill_category;

