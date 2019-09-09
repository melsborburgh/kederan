create or replace force view KDR_CHARACTER_SPELLS_VIEW as
select  cs.char_spell_id,
        cs.char_id,
        cv.char_name,
        sp.spell_id,
        sp.spell_type_code,
        st.spell_type_name,
        sp.spell_level,
        sp.spell_name,
        sp.spell_distance,
        di.distance_name || ' (' || di.distance_desc || ')' as spell_distance_d,
        sp.spell_target,
        sp.spell_desc,
        sp.spell_usage
from    kdr_spells sp,
        kdr_char_spells cs,
        kdr_characters_view cv,
        kdr_spell_types st,
        kdr_distances di
where   sp.spell_id         = cs.spell_id
and     cv.char_id          = cs.char_id
and     di.distance_id      = sp.spell_distance
and     sp.spell_type_code  = st.spell_type_code;
/