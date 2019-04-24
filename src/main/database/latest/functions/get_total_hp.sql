create or replace function get_total_hp
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_hp number;
begin
    select      coalesce(sum(sl.skill_hp_gain),0) + 4
    into        r_hp
    from        kdr_skill_levels sl,
                kdr_char_skills cs
    where       cs.skill_level_id   = sl.skill_level_id
    and         char_id             = i_char_id;

    return r_hp;
exception
    when no_data_found then
        return 4;
end;
/