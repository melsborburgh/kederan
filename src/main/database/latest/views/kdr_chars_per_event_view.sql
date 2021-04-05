
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARS_PER_EVENT_VIEW AS
  select  ce.char_event_id,
        ce.event_id,
        ce.char_id,
        ce.char_event_xp_adj,
        ce.char_event_xp_remark,
        ev.event_name,
        ev.event_location,
        ev.event_type,
        ev.event_start_date,
        ev.event_end_date,
        ev.event_xp,
        et.event_type_desc,
        ch.char_name,
        get_total_xp(ch.char_id) - get_total_xp_spend(ch.char_id) char_unspend_xp,
        pl.player_id,
        pl.player_name
from    kdr_char_events     ce,
        kdr_events          ev,
        kdr_event_types     et,
        kdr_characters      ch,
        kdr_players         pl
where   ev.event_id     = ce.event_id
and     ev.event_type   = et.event_type_name
and     ch.char_id      = ce.char_id
and     ch.player_id    = pl.player_id;
