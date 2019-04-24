create or replace function get_total_xp_spend
( i_char_id in kdr_characters.char_id%type)
return number
is
    r_amount            number;
begin

    with
        skills as (
        -- Determine amount of XP spend via skills
        select      coalesce(sum(sl.skill_cost),0) total
        from        kdr_skill_levels sl,
                    kdr_char_skills cs
        where       sl.skill_level_id   = cs.skill_level_id
        and         cs.char_id          = i_char_id)
    ,
        spells as (
        -- Determine amount of XP spend via spells
        select      coalesce(sum(sp.spell_level),0) total
        from        kdr_char_spells cs,
                    kdr_spells sp
        where       sp.spell_id         = cs.spell_id
        and         cs.char_id          = i_char_id)
    ,
        prayers as (
        -- Determine amount of XP spend via prayers
        select      coalesce(sum(pr.prayer_level),0) total
        from        kdr_char_prayers cs,
                    kdr_prayers pr
        where       pr.prayer_id        = cs.prayer_id
        and         cs.char_id          = i_char_id)
    select  skills.total + spells.total + prayers.total
    into    r_amount
    from    skills, spells, prayers;

    return r_amount;
exception
    when no_data_found then
        return 20;
end;
/