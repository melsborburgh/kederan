
CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_CHAR_SKILLS"
(i_char_id in NUMBER)
return VARCHAR2
is
    r_char_skills varchar2(300);
begin
    select  listagg(skill_level_id,':') within group(order by skill_level_id)
    into    r_char_skills
    from    kdr_char_skills
    where   char_id = i_char_id;

    return r_char_skills;
end;