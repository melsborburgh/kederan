
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_SKILLS_PER_LEVEL (SKILL_LEVEL_NAM
E, CATEGORY_ID, CATEGORY_NAME, CATEGORY_DESC, CATEGORY_TYPE, SKILL_ID, SKILL_NAM
E, SKILL_DESC, SKILL_CATEGORY, SKILL_LEVEL_ID, LEVEL_ID, SKILL_COST, SKILL_LEVEL
_DESC, SKILL_MANA_GAIN, SKILL_DIV_GAIN, SKILL_XP_GAIN, SKILL_ARCANE_GAIN, SKILL_
CHAOS_GAIN, SKILL_HP_GAIN) AS 
  select      skill_name
                || ' (' || sc.category_name || ')'
                || ' - '
                || level_id
                || ' (' || skill_cost || ' xp)' skill_level_name,
            sc.category_id,
            sc.category_name,
            sc.category_desc,
            sc.category_type,
            sk.skill_id,
            sk.skill_name,
            sk.skill_desc,
            sk.skill_category,
            sl.skill_level_id,
            sl.level_id,
            sl.skill_cost,
            sl.skill_desc as skill_level_desc,
            sl.skill_mana_gain,
            sl.skill_div_gain,
            sl.skill_xp_gain,
            sl.skill_arcane_gain,
            sl.skill_chaos_gain,
            sl.skill_hp_gain
from        kdr_skills              sk,
            kdr_skill_categories    sc,
            kdr_skill_levels        sl
where       sc.category_id  = sk.skill_category
and         sl.skill_id     = sk.skill_id;

