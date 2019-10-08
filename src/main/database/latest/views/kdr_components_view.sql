
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_COMPONENTS_VIEW (ITEM_ID, ITEM_NA
ME, ITEM_DESC, ITEM_COST, ITEM_LEVEL, ITEM_DIRECT_EFFECT, ITEM_BONUS_EFFECT, ITE
M_BAD_EFFECT, ITEM_TYPES_ARRAY, COMP_SEARCH_SKILL_ARRAY, COMPONENT_TYPE_ID, ITEM
_TYPE_NAME, COMPONENT_TYPE) AS 
  select      i.ITEM_ID,i.ITEM_NAME,i.ITEM_DESC,i.ITEM_COST,i.ITEM_LEVEL,i.ITEM_
DIRECT_EFFECT,i.ITEM_BONUS_EFFECT,i.ITEM_BAD_EFFECT,i.ITEM_TYPES_ARRAY,i.COMP_SE
ARCH_SKILL_ARRAY, b.column_value as component_type_id, ITEM_TYPE_NAME, it.compon
ent_type
from        kdr_items i,
            table(apex_string.split(i.item_types_array, ':')) b,
            kdr_item_types it
where       b.column_value = it.ITEM_TYPE_ID;

