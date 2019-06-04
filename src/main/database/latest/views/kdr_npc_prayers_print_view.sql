create or replace force view kdr_npc_prayers_print_view as
with x as (
select      dt.deity_name, np.prayer_level, sp.prayer_name, np.npc_id
from        kdr_npc_prayers_view    np,
            kdr_prayers             sp,
            kdr_deities             dt
where       np.prayer_id    = sp.prayer_id
and         dt.deity_code   = sp.deity_code
)
select      npc_id, deity_name, '' || prayer_level prayer_level, LISTAGG(prayer_name, ', ') WITHIN GROUP (ORDER BY prayer_level) prayer_list
from        x
group by    npc_id, deity_name, prayer_level
order by    1,2,3,4;
/