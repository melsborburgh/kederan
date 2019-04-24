create or replace force view kdr_components_view as
select      i.*, b.column_value as component_type
from        kdr_items i,
            table(apex_string.split(i.item_types_array, ':')) b