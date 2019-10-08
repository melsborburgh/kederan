
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_NPC_SPELLS_VIEW (NPC_SPELL_ID, NP
C_ID, NPC_NAME, SPELL_ID, SPELL_TYPE_CODE, SPELL_LEVEL, SPELL_NAME) AS 
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

