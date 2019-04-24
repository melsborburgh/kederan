create or replace function get_total_xp_spend_npc
( i_npc_id in kdr_npcs.npc_id%type)
return number
is
    r_amount            number;
begin

    with
        skills as (
        -- Determine amount of XP spend via skills
        select      coalesce(sum(sl.skill_cost),0) total
        from        kdr_skill_levels sl,
                    kdr_npc_skills cs
        where       sl.skill_level_id   = cs.skill_level_id
        and         cs.npc_id           = i_npc_id)
    ,
        spells as (
        -- Determine amount of XP spend via spells
        select      coalesce(sum(sp.spell_level),0) total
        from        kdr_npc_spells cs,
                    kdr_spells sp
        where       sp.spell_id         = cs.spell_id
        and         cs.npc_id           = i_npc_id)
    ,
        prayers as (
        -- Determine amount of XP spend via prayers
        select      coalesce(sum(pr.prayer_level),0) total
        from        kdr_npc_prayers cs,
                    kdr_prayers pr
        where       pr.prayer_id        = cs.prayer_id
        and         cs.npc_id           = i_npc_id)
    select  skills.total + spells.total + prayers.total
    into    r_amount
    from    skills, spells, prayers;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;
/