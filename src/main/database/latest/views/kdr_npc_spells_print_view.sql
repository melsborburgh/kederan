
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_NPC_SPELLS_PRINT_VIEW (NPC_ID, SP
ELL_TYPE_NAME, SPELL_LEVEL, SPELLS) AS 
  with x as (
    select      spell_type_name, spell_level, spell_name, ns.npc_id
    from        kdr_npc_spells_view ns, kdr_spell_types st
    where       ns.spell_type_code = st.spell_type_code
--    and         ns.npc_id          = :P11_NPC_ID
)
select      npc_id, spell_type_name, '' || spell_level spell_level, LISTAGG(spel
l_name, ', ') WITHIN GROUP (ORDER BY spell_level, spell_name) spells
from        x
group by    npc_id, spell_type_name, spell_level
order by    1,2,3,4;

