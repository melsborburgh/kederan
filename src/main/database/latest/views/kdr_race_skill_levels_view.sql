
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RACE_SKILL_LEVELS_VIEW (RACE_ID, 
RACE_NAME, RACE_DESC, RACE_XP_PEN, RACE_GOLD, RACE_SKILL_CATEGORY, RACE_SKILL_AM
OUNT, RACE_TYPE, CATEGORY_ID, CATEGORY_NAME, CATEGORY_DESC, CATEGORY_TYPE, TYPE_
ID, TYPE_NAME, TYPE_DESC, SKILL_NAME, SK_SKILL_DESC, SKILL_CATEGORY, SKILL_LEVEL
_ID, SKILL_ID, LEVEL_ID, SKILL_COST, SKILL_DESC, SKILL_MANA_GAIN, SKILL_DIV_GAIN
, SKILL_XP_GAIN, SKILL_ARCANE_GAIN, SKILL_CHAOS_GAIN, SKILL_HP_GAIN) AS 
  select  ra.RACE_ID,ra.RACE_NAME,ra.RACE_DESC,ra.RACE_XP_PEN,ra.RACE_GOLD,ra.RA
CE_SKILL_CATEGORY,ra.RACE_SKILL_AMOUNT,ra.RACE_TYPE,
        sc.CATEGORY_ID,sc.CATEGORY_NAME,sc.CATEGORY_DESC,sc.CATEGORY_TYPE,
        sct.TYPE_ID,sct.TYPE_NAME,sct.TYPE_DESC,
        sk.SKILL_NAME,
        sk.SKILL_DESC SK_SKILL_DESC,
        sk.SKILL_CATEGORY,
        sl.SKILL_LEVEL_ID,sl.SKILL_ID,sl.LEVEL_ID,sl.SKILL_COST,sl.SKILL_DESC,sl
.SKILL_MANA_GAIN,sl.SKILL_DIV_GAIN,sl.SKILL_XP_GAIN,sl.SKILL_ARCANE_GAIN,sl.SKIL
L_CHAOS_GAIN,sl.SKILL_HP_GAIN
from    kdr_skill_categories        sc,
        kdr_skill_category_types    sct,
        kdr_races                   ra,
        kdr_skills                  sk,
        kdr_skill_levels            sl
where   1=1
and     sc.category_type            = sct.type_id
and     ra.race_skill_category      = sc.category_id
and     sk.skill_category           = sc.category_id
and     sl.skill_id                 = sk.skill_id;

