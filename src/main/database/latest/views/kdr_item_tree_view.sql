
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_ITEM_TREE_VIEW (STATUS, level, TI
TLE, ICON, VALUE, TOOLTIP, LINK) AS 
  select  case
            when connect_by_isleaf = 1 then
            0
            when level = 1 then
            1
            else
            -1
        end as status,
        level as level,
        name as title,
        null as icon,
        id as value,
        tooltip as tooltip,
        'javascript:$s(''P27_ITEM_ID'', ' || apex_escape.js_literal(id) ||');' a
s link 
from (
        select  to_char(it1.item_type_id) id,
                to_char(item_type_parent) parent_id,
                it1.item_type_name 
                  || case when component_type is not null then ' (' || component
_type || ')' end name,
                it1.item_type_desc        tooltip
        from    kdr_item_types it1
        union all   
        select  to_number(b.column_value) || '_' || i.item_id id,
                to_char(b.column_value) parent_id,
                i.item_name
                || case when item_level is not null then ' (' || item_level || '
)' end as item_name ,
                i.item_desc
        from    kdr_items i, table(apex_string.split(i.item_types_array, ':')) b
        

        order by 3
     )
start with parent_id is null
connect by parent_id = prior id

        /*select  i.item_type_id || '_' || i.item_id,
                to_char(i.item_type_id),
                i.item_name || case when item_level is not null then ' (niv. ' |
| item_level || ')' end,
                i.item_desc
        from    kdr_items i*/;

