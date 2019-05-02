create or replace procedure bulk_add_prayers_npc(
        i_npc_id            kdr_npcs.npc_id%type,
        i_deity_code        kdr_prayers.deity_code%type,
        i_prayer_level      kdr_prayers.prayer_level%type)
is
begin
    for rec in (
        select  prayer_id
        from    kdr_prayers
        where   prayer_level    = nvl(i_prayer_level,prayer_level)
        and     deity_code      = nvl(i_deity_code,deity_code)
        and     prayer_id not in (  select  prayer_id
                                    from    kdr_npc_prayers
                                    where   npc_id = i_npc_id
                                 )
        ) loop
        kdr_npc_prayers_api.create_or_update_row(p_npc_id=>i_npc_id,p_prayer_id=>rec.prayer_id);
    end loop;
    commit;
exception
  when dup_val_on_index then
    null;
end;
/