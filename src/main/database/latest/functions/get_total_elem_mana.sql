create or replace function get_total_elem_mana
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount     number;
    r_skill_mana number;
    r_spell_mana number;
begin
    /* Skills that grant extra mana*/
    select      coalesce(sum(skill_mana_gain),0)
    into        r_skill_mana
    from        kdr_skill_levels sl,
                kdr_char_skills cs
    where       cs.skill_level_id = sl.skill_level_id
    and         cs.char_id        = i_char_id;

    /* All elemental spells grant one mana*/
    select      coalesce(count(sp.spell_id),0)
    into        r_spell_mana
    from        kdr_char_spells sp
    where       sp.char_id = i_char_id;

    r_amount := r_skill_mana + r_spell_mana;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;
/