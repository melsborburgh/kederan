create or replace procedure bulk_add_spells_npc(
        i_npc_id            kdr_npcs.npc_id%type,
        i_spell_type_code   kdr_spells.spell_type_code%type,
        i_spell_level       kdr_spells.spell_level%type)
is
begin
    for rec in (select spell_id from kdr_spells where spell_type_code = i_spell_type_code and spell_level = i_spell_level and spell_id not in ( select spell_id from kdr_npc_spells where npc_id = i_npc_id) )loop
        dbms_output.put_line(rec.spell_id);
        kdr_npc_spells_api.create_row(p_npc_id=>i_npc_id,p_spell_id=>rec.spell_id);
    end loop;
    commit;
exception
  when dup_val_on_index then
    null;
end;
/