CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_SKILLS_TO_CHOOSE_PUBLIC" (i_char_id in number)
return varchar2
is
    r_skill_result varchar2(4000);
begin
    with x as (
        -- Basic skills
        select      skill_id, min(level_id) level_id
        from        kdr_skills_per_level
        where       type_basic = 'Y'
        and         skill_super = 'N'
        and         skill_level_id not in (
                        select      skill_level_id
                        from        kdr_character_skills_view
                        where       char_id = i_char_id
                    )
        group by    skill_id
        union all
        -- Super / prestige skills (40 xp required in category)
        select      skill_id, min(level_id)
        from        kdr_skills_per_level
        where       skill_super = 'Y'
        and         category_id in (
            select      category_id
            from        kdr_character_skills_view
            where       char_id = i_char_id
            group by    category_id
            having      sum(skill_cost) >= 40
        )
        group by    skill_id
    )
    select      LISTAGG(skill_level_id, ':') WITHIN GROUP (ORDER BY category_id) skill_listing
    into        r_skill_result
    from        kdr_skills_per_level spl, x
    where       spl.skill_id = x.skill_id
    and         spl.level_id = x.level_id
    order by    spl.category_name, spl.skill_name;

    return r_skill_result;
end;