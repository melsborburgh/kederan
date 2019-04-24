create or replace function get_total_hp_npc
( i_npc_id in kdr_npcs.npc_id%type)
return number
is
    r_hp number;
begin
    select      coalesce(sum(sl.skill_hp_gain),4)
    into        r_hp
    from        kdr_skill_levels sl,
                kdr_npc_skills cs
    where       cs.skill_level_id   = sl.skill_level_id
    and         npc_id              = i_npc_id;

    return r_hp;
exception
    when no_data_found then
        return 4;
end;
/