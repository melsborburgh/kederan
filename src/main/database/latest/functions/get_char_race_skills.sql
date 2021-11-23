CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_CHAR_RACE_SKILLS"
(i_char_id in NUMBER)
return VARCHAR2
is
    r_char_skills varchar2(300);
begin
    select  listagg(cs.skill_level_id,':') within group(order by cs.skill_level_id)
    into    r_char_skills
    from    kdr_char_skills cs, kdr_race_skill_levels rsl
    where   cs.char_id = i_char_id
    and     cs.skill_level_id = rsl.skill_level_id;

    return r_char_skills;
end;