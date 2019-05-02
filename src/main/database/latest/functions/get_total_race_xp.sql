create or replace function get_total_race_xp
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount    number;
begin

    -- Basic amount of experience (XP) per character is 20
    r_amount := 20;

    -- Determine amount of XP penalty subtracted by chosen basic race
    r_amount := r_amount - coalesce(kdr_races_api.get_race_xp_pen( p_race_id => kdr_characters_api.get_race_id( p_char_id => i_char_id ) ),0);

    -- Determine amount of XP penalty subtracted by chosen sub race
    r_amount := r_amount - coalesce(kdr_races_api.get_race_xp_pen( p_race_id => kdr_characters_api.get_race_id_sub( p_char_id => i_char_id ) ),0);
    return r_amount;
exception
    when no_data_found then
        return 20;
end;
/