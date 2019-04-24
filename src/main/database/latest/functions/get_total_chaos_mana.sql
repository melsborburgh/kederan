create or replace function get_total_chaos_mana
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount number;
begin
    select      coalesce(sum(sl.skill_chaos_gain),0)
    into        r_amount
    from        kdr_skill_levels sl,
                kdr_char_skills cs
    where       cs.skill_level_id = sl.skill_level_id
    and         char_id = i_char_id;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;