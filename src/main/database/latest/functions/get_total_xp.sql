create or replace function get_total_xp
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount    number;
    r_xp_pen    number;
begin
    -- Basic amount of experience (XP) per character is 20
    r_amount := 20;

    -- Determine amount of XP penalty subtracted by chose race
    r_amount := r_amount - coalesce(kdr_races_api.get_race_xp_pen( p_race_id => kdr_characters_api.get_race_id( p_char_id => i_char_id ) ),0);

    -- Determine amount of XP gained via skills
    select      coalesce(sum(sl.skill_xp_gain),0)
    into        r_xp_pen
    from        kdr_skill_levels sl,
                kdr_char_skills cs
    where       sl.skill_level_id   = cs.skill_level_id
    and         cs.char_id          = i_char_id;

    r_amount := r_amount + r_xp_pen;

    return r_amount;
exception
    when no_data_found then
        return 20;
end;