
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_ITEM_VIEW (ITEM_ID, ITEM_NAME, CO
MP_SEARCH_SKILL_ARRAY, SKILLS_LIST, SKILLS_LIST_C, ITEM_TYPES_ARRAY, TYPES_LIST,
 ITEM_DESC, ITEM_COST, RECIPE_COST, ITEM_LEVEL, ITEM_DIRECT_EFFECT, ITEM_BONUS_E
FFECT, ITEM_BAD_EFFECT) AS 
  select      i.item_id,
            i.item_name,
            i.comp_search_skill_array,
            get_search_skill(i.comp_search_skill_array) skills_list,
            get_search_skill_color(i.comp_search_skill_array) skills_list_c,
            i.item_types_array,
            get_item_types(i.item_types_array) types_list,
            i.item_desc,
            i.item_cost,
            get_recipe_base_cost(recipe_id) recipe_cost,
            i.item_level,
            i.item_direct_effect,
            i.item_bonus_effect,
            i.item_bad_effect
from        kdr_items i;

