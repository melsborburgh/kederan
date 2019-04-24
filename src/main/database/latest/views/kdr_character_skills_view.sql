create or replace force view KDR_CHARACTER_SKILLS_VIEW as
select  sk.skill_name,
        sl.level_id,
        sk.skill_id,
        sl.skill_level_id,
        sl.skill_desc,
        cs.char_id,
        cs.char_skill_id,
        cv.char_name,
        sl.skill_cost
from    kdr_skill_levels sl,
        kdr_skills sk,
        kdr_char_skills cs,
        kdr_characters_view cv
where   sl.skill_id         = sk.skill_id
and     cs.skill_level_id   = sl.skill_level_id
and     cv.char_id          = cs.char_id;