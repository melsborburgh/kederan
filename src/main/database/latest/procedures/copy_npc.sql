create or replace PROCEDURE COPY_NPC (
    i_npc_id kdr_npcs.npc_id%type,
    i_npc_name kdr_npcs.npc_name%type default null
)
is
    v_kdr_npcs_rt               kdr_npcs%rowtype;
    v_kdr_npc_spells_rt         kdr_npc_spells%rowtype;
    v_kdr_npc_skills_rt         kdr_npc_skills%rowtype;
    v_kdr_npc_prayers_rt        kdr_npc_prayers%rowtype;
    v_new_npc_id                kdr_npcs.npc_id%type;
begin
    v_kdr_npcs_rt := kdr_npcs_api.read_row(p_npc_id => i_npc_id);

    -- Set name for new npc (if provided)
    v_kdr_npcs_rt.npc_id    := null;
    v_kdr_npcs_rt.npc_name  := coalesce(i_npc_name,v_kdr_npcs_rt.npc_name || ' (kopie)');
    -- dbms_output.put_line(v_kdr_npcs_rt.npc_name);

    -- Create new npc, based upon existing
    v_new_npc_id := kdr_npcs_api.create_row(p_row => v_kdr_npcs_rt);
    -- dbms_output.put_line(v_new_npc_id);

    -- Add skill of original npc to new npc
    begin
        for rec in (select npc_id, skill_level_id from kdr_npc_skills where npc_id = i_npc_id) loop
            v_kdr_npc_skills_rt := kdr_npc_skills_api.read_row(p_npc_id => rec.npc_id, p_skill_level_id => rec.skill_level_id );

            -- dbms_output.put_line(v_kdr_npc_skills_rt.npc_skill_id);

            v_kdr_npc_skills_rt.npc_id          := v_new_npc_id;
            v_kdr_npc_skills_rt.npc_skill_id    := null;
            kdr_npc_skills_api.create_row(p_row => v_kdr_npc_skills_rt);
        end loop;
    end;

    -- Add spell of original npc to new npc
    begin
        for rec in (select spell_id from kdr_npc_spells where npc_id = i_npc_id) loop
            -- dbms_output.put_line(rec.spell_id);

            v_kdr_npc_spells_rt.npc_spell_id    := null;
            v_kdr_npc_spells_rt.npc_id          := v_new_npc_id;
            v_kdr_npc_spells_rt.spell_id        := rec.spell_id;
            kdr_npc_spells_api.create_row(p_row => v_kdr_npc_spells_rt);
        end loop;
    end;

    -- Add prayer of original npc to new npc
    begin
        for rec in (select prayer_id from kdr_npc_prayers where npc_id = i_npc_id) loop
            -- dbms_output.put_line(rec.prayer_id);

            v_kdr_npc_prayers_rt.npc_prayer_id    := null;
            v_kdr_npc_prayers_rt.npc_id           := v_new_npc_id;
            v_kdr_npc_prayers_rt.prayer_id        := rec.prayer_id;
            kdr_npc_prayers_api.create_row(p_row => v_kdr_npc_prayers_rt);
        end loop;
    end;

    commit;
end;