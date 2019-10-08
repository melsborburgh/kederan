
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RACE_SKILL_LEVELS (CATEGORY_NAME,
 SKILL_NAME, SKILL_CATEGORY, SKILL_LEVEL_ID, SKILL_ID, LEVEL_ID, SKILL_COST, SKI
LL_DESC, SKILL_MANA_GAIN, SKILL_DIV_GAIN, SKILL_XP_GAIN, SKILL_ARCANE_GAIN, SKIL
L_CHAOS_GAIN, SKILL_HP_GAIN) AS 
  select rsc.category_name,
           sk.skill_name,
           sk.skill_category,
           sl.SKILL_LEVEL_ID,
           sl.SKILL_ID,
           sl.LEVEL_ID,
           sl.SKILL_COST,
           sl.SKILL_DESC,
           sl.SKILL_MANA_GAIN,
           sl.SKILL_DIV_GAIN,
           sl.SKILL_XP_GAIN,
           sl.SKILL_ARCANE_GAIN,
           sl.SKILL_CHAOS_GAIN,
           sl.SKILL_HP_GAIN
    from kdr_race_skill_categories_view   rsc,
         kdr_skills                       sk,
         kdr_skill_levels                 sl
    where sk.skill_category = rsc.category_id
          and sl.skill_id = sk.skill_id;

