CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_CHAR_START_GOLD"
( i_char_id in kdr_characters.char_id%type) return number
is
    r_gold number;
begin
    -- A character either gets the start gold from sub race (if filled in) or the base race or nothing (if both empty)
    r_gold :=   coalesce(
                            kdr_races_api.get_race_gold( p_race_id => kdr_characters_api.get_race_id_sub( p_char_id => i_char_id ) ),
                            kdr_races_api.get_race_gold( p_race_id => kdr_characters_api.get_race_id( p_char_id => i_char_id ) )
                            ,0);
    return r_gold;
exception
    when no_data_found then
        return 0;
end;