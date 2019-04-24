create or replace force view KDR_npc_SPELLS_VIEW as
select  cs.npc_spell_id,
        cs.npc_id,
        cv.npc_name,
        sp.spell_id,
        sp.spell_type_code,
        sp.spell_level,
        sp.spell_name
from    kdr_spells      sp,
        kdr_npc_spells  cs,
        kdr_npcs_view   cv
where   sp.spell_id = cs.spell_id
and     cv.npc_id   = cs.npc_id;