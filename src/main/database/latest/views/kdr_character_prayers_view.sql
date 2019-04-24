create or replace force view kdr_character_prayers_view as
select  cp.char_prayer_id,
        cp.char_id,
        cv.char_name,
        pr.prayer_id,
        pr.prayer_level,
        pr.prayer_name,
        pr.deity_code
from    kdr_prayers         pr,
        kdr_char_prayers    cp,
        kdr_characters_view cv
where   pr.prayer_id        = cp.prayer_id
and     cv.char_id          = cp.char_id;