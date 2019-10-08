
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTER_PRAYERS_VIEW (CHAR_PRAY
ER_ID, CHAR_ID, CHAR_NAME, PRAYER_ID, PRAYER_NAME, PRAYER_DISTANCE, PRAYER_DURAT
ION, PRAYER_TARGET, PRAYER_LEVEL, PRAYER_DESC, PRAYER_DIVINITY_COST, DEITY_CODE,
 PRAYER_USAGE, PRAYER_DISTANCE_D, DEITY_NAME) AS 
  select  cs.char_prayer_id,
        cs.char_id,
        cv.char_name,
        sp.PRAYER_ID,sp.PRAYER_NAME,sp.PRAYER_DISTANCE,sp.PRAYER_DURATION,sp.PRA
YER_TARGET,sp.PRAYER_LEVEL,sp.PRAYER_DESC,sp.PRAYER_DIVINITY_COST,sp.DEITY_CODE,
sp.PRAYER_USAGE,
        di.distance_name || ' (' || di.distance_desc || ')' as prayer_distance_d
,
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

