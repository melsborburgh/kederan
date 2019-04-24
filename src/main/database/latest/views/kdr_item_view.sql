create or replace view kdr_item_view as
select      i.item_id,
            i.item_name,
            i.comp_search_skill_array,
            get_search_skill(i.comp_search_skill_array) skills_list,
            get_search_skill_color(i.comp_search_skill_array) skills_list_c,
            i.item_types_array,
            get_item_types(i.item_types_array) types_list,
            i.item_desc,
            i.item_cost,
            i.item_level,
            i.item_direct_effect,
            i.item_bonus_effect,
            i.item_bad_effect
from        kdr_items i;