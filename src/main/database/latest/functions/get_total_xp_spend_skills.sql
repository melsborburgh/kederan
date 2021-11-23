create or replace FUNCTION GET_TOTAL_XP_SPEND_SKILLS
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount            number;
begin
    -- Determine amount of XP spend via skills
    with data as (
        select      coalesce(sum(sl.skill_cost),0) total
        from        kdr_skill_levels sl,
                    kdr_char_skills cs
        where       sl.skill_level_id   = cs.skill_level_id
        and         cs.char_id          = i_char_id)
    select  data.total
    into    r_amount
    from    data;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;