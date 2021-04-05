create or replace view kdr_race_comp_table_view as
select *
from   table( pivot(' select base_race_name
                      ,      breed_race_name
                      ,      max(max_comp_status) max_comp_status
                      from   kdr_race_comp_view
                      group
                      by     base_race_name
                      ,      breed_race_name
                    ')
            )
order by 1;