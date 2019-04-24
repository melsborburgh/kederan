create or replace force view kdr_race_skill_levels_view as
select  ra.*,
        sc.*,
        sct.*,
        sk.SKILL_NAME,
        sk.SKILL_DESC SK_SKILL_DESC,
        sk.SKILL_CATEGORY,
        sl.*
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