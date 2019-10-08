
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHAR_RACE_SKILL_AMOUNT_VW (CHAR_I
D, CHAR_NAME, RACE_NAME, SKILL_CATEGORY, RACE_SKILL_AMOUNT, CURRENT_AMOUNT) AS 
  with x as(
    select      ch.char_name,
                ra.race_name,
                ra.race_skill_amount,
                ra.race_skill_category
    from        kdr_characters         ch,
                kdr_races              ra,
                kdr_skill_categories   sc
    where       (
                    ra.race_id = ch.race_id
                    or
                    ra.race_id = ch.race_id_sub
                )
    and         sc.category_id = ra.race_skill_category
    order by    ch.char_name, ra.race_name
)
select      a.char_id,
            a.char_name,
            x.race_name,
            a.skill_category,
            x.race_skill_amount,
            count(distinct skill_level_id) current_amount
from        kdr_char_allowed_race_skills                                    a,
            table(apex_string.split(get_char_race_skills(a.char_id), ':'))   b,
            x
where       b.column_value = a.skill_level_id
and         x.race_skill_category = a.skill_category
group by    a.char_id, a.char_name, a.skill_category, x.race_skill_amount, x.rac
e_name
order by    1, 3;

