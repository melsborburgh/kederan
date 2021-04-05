create or replace view kdr_race_comp_view as
select r1.race_name base_race_name
,      r2.race_name breed_race_name
,      max(comp_status) max_comp_status
from   KDR_RACE_COMPATIBILTY rc,
     kdr_races r1,
     kdr_races r2
where  rc.base_race_id = r1.race_id
and    rc.breed_race_id = r2.race_id
group
by     r1.race_name
,      r2.race_name
;



-- select *
-- from   table( pivot(' select base_race_id
--                       ,      breed_race_id
--                       ,      max(comp_status) max_comp_status
--                       from   KDR_RACE_COMPATIBILTY
--                       group
--                       by     base_race_id
--                       ,      breed_race_id
--                       order by base_race_id
--                     ')
--             )
-- order by 1;