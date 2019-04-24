create or replace force view kdr_npc_per_plot as
select  n.*,
        p.*,
        pn.plot_npc_quantity,
        pn.plot_npc_quantity_upper,
        e.event_name
from    kdr_npcs        n,
        kdr_plot        p,
        kdr_plot_npcs   pn,
        kdr_events      e
where   n.npc_id    = pn.npc_id
and     p.plot_id   = pn.plot_id
and     p.event_id  = e.event_id;