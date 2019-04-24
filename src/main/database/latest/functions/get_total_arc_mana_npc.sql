create or replace function get_total_arc_mana_npc
( i_npc_id in kdr_npcs.npc_id%type)
return number
is
    r_amount number;
begin
    select      coalesce(sum(sl.skill_arcane_gain),0)
    into        r_amount
    from        kdr_skill_levels sl,
                kdr_npc_skills cs
    where       cs.skill_level_id = sl.skill_level_id
    and         npc_id = i_npc_id;

    return r_amount;
exception
    when no_data_found then
        return 0;
end;
/