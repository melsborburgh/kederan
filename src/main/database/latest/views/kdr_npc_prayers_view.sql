
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_NPC_PRAYERS_VIEW (NPC_PRAYER_ID, 
NPC_ID, NPC_NAME, PRAYER_ID, PRAYER_LEVEL, PRAYER_NAME, DEITY_CODE) AS 
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

