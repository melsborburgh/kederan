create or replace force view KDR_CHARACTER_SPELLS_VIEW as
select  cs.char_id,
        cv.char_name,
        sp.spell_type_code,
        sp.spell_level,
        sp.spell_name
from    kdr_spells sp,
        kdr_char_spells cs,
        kdr_characters_view cv
where   sp.spell_id         = cs.spell_id
and     cv.char_id          = cs.char_id;