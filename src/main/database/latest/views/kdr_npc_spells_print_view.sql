create or replace force view kdr_npc_spells_print_view as
with x as (
    select      spell_type_name, spell_level, spell_name, ns.npc_id
    from        kdr_npc_spells_view ns, kdr_spell_types st
    where       ns.spell_type_code = st.spell_type_code
)
select      npc_id, spell_type_name, '' || spell_level spell_level, LISTAGG(spell_name, ', ') WITHIN GROUP (ORDER BY spell_level, spell_name) spells
from        x
group by    npc_id, spell_type_name, spell_level
order by    1,2,3,4;
/