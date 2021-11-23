CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_ILLEGAL_RACE_SKILLS" (i_char_id varchar2)
return varchar2
as
    r_skill_list varchar2(1000);
begin
    with x as(
        -- Rasvaardigheden die het personage daadwerkelijk heeft
        select      skill_level_id, category_name
        from        kdr_race_skill_levels a,
                    table(apex_string.split(GET_CHAR_RACE_SKILLS(i_char_id),':')) b
        where       b.column_value = a.skill_level_id
        minus
        -- Rasvaardigheden die het personage uit mag kiezen
        select      skill_level_id, category_name
        from        kdr_char_allowed_race_skills
        where       char_id = i_char_id
    )
    , y as (
    select      category_name, count(1) amount
    from        x
    group by    category_name
    )
    select  LISTAGG(amount || 'x ' || category_name, ', ')
             WITHIN GROUP (ORDER BY category_name) Illegal
    into    r_skill_list
    from    y;

    return r_skill_list;
end;