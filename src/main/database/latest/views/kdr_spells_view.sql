create or replace force editionable view KDR_SPELLS_VIEW as
select  sp.SPELL_id,
        sp.SPELL_name,
        sp.SPELL_distance,
        di.distance_name,
        di.distance_name || get_tooltip_icon('kdr_distances','distance_desc',' distance_id', sp.spell_distance) as distance_tooltip,
        sp.SPELL_duration,
        du.duration_name,
        du.duration_name || get_tooltip_icon('kdr_durations','duration_desc',' duration_id', sp.spell_duration) as duration_tooltip,
        sp.SPELL_target,
        sp.SPELL_level,
        sp.SPELL_desc,
        sp.SPELL_mana_cost,
        sp.spell_type_code,
        st.spell_type_name,
        st.spell_type_name  || get_tooltip_icon('kdr_spell_types','spell_type_desc',' spell_type_code', sp.spell_type_code) as spell_type_tooltip,
        sp.SPELL_usage,
        sp.public_view as SPELL_public_view,
        st.public_view as spell_type_public_view
  from  kdr_SPELLs       sp,
        kdr_distances    di,
        kdr_durations    du,
        kdr_spell_types  st
 where  sp.spell_type_code  = st.spell_type_code
 and    sp.SPELL_distance   = di.distance_id
 and    sp.SPELL_duration   = du.duration_id;
