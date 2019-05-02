create or replace function get_total_mana_divinity_gain
( i_char_id in kdr_characters.char_id%type)
return varchar2
is
    r_value     varchar2(100);
    v_mana      number;
    v_divinity  number;
begin

    -- Determine amount of mana gained from skills
    select  sum(SKILL_MANA_GAIN)
    into    v_mana
    from    kdr_char_skills cs,
            kdr_skills_per_level spl
    where   cs.char_id          = i_char_id
    and     cs.skill_level_id   = spl.skill_level_id;

    -- Determine amount of divinity gained from skills
    select  sum(SKILL_DIV_GAIN)
    into    v_divinity
    from    kdr_char_skills cs,
            kdr_skills_per_level spl
    where   cs.char_id          = i_char_id
    and     cs.skill_level_id   = spl.skill_level_id;

    -- Return string with total amount of mana and divinity gained from skills
    r_value :=  case when v_mana != 0 then '+' || v_mana || ' MP' end
                ||
                case when v_mana != 0 and v_divinity != 0 then ' & ' end
                ||
                case when v_divinity != 0 then '+' || v_divinity || ' DP' end;

    return r_value;
exception
    when no_data_found then
        return null;
end;
/