create or replace function get_total_xp_spend_spells
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount            number;
begin
    -- Determine amount of XP spend via spells
    with data as (
        select      coalesce(sum(sp.spell_level),0) total
        from        kdr_char_spells cs,
                    kdr_spells sp
        where       sp.spell_id         = cs.spell_id
        and         cs.char_id          = i_char_id)
    select  data.total
    into    r_amount
    from    data;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;
/