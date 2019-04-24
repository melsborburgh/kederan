create or replace force view kdr_npc_prayers_view as
select  cp.npc_prayer_id,
        cp.npc_id,
        cv.npc_name,
        pr.prayer_id,
        pr.prayer_level,
        pr.prayer_name,
        pr.deity_code
from    kdr_prayers         pr,
        kdr_npc_prayers    cp,
        kdr_npcs_view cv
where   pr.prayer_id        = cp.prayer_id
and     cv.npc_id          = cp.npc_id;