create or replace force view kdr_character_prayers_view as
select  cs.char_prayer_id,
        cs.char_id,
        cv.char_name,
        sp.*,
        di.distance_name || ' (' || di.distance_desc || ')' as prayer_distance_d,
        dt.deity_name
from    kdr_prayers             sp,
        kdr_char_prayers        cs,
        kdr_characters_view     cv,
        kdr_deities             dt,
        kdr_distances           di
where   sp.prayer_id        = cs.prayer_id
and     cv.char_id          = cs.char_id
and     sp.deity_code       = dt.deity_code
and     di.distance_id      = sp.prayer_distance;
/