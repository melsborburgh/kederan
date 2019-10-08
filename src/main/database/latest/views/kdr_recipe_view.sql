
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RECIPE_VIEW (RECIPE_TYPE_NAME, RE
CIPE_TYPE_DESC, RECIPE_ID, RECIPE_NAME, RECIPE_LEVEL, RECIPE_INSTRUCTIONS, RECIP
E_EFFECT, RECIPE_TYPE_ID, RECIPE_BASE_COST) AS 
  select  rt.recipe_type_name,
        rt.recipe_type_desc,
        re.RECIPE_ID,
        re.RECIPE_NAME,
        re.RECIPE_LEVEL,
        re.RECIPE_INSTRUCTIONS,
        re.RECIPE_EFFECT,
        re.RECIPE_TYPE_ID,
        get_recipe_base_cost(re.recipe_id)      as recipe_base_cost
from    kdr_recipes        re,
        kdr_recipe_types   rt
where   re.recipe_type_id = rt.recipe_type_id;

