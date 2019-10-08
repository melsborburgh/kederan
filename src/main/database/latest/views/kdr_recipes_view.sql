
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RECIPES_VIEW (RECIPE_TYPE_NAME, R
ECIPE_TYPE_DESC, RECIPE_ID, RECIPE_NAME, RECIPE_LEVEL, RECIPE_INSTRUCTIONS, RECI
PE_EFFECT, RECIPE_TYPE_ID) AS 
  select      rt.recipe_type_name, rt.recipe_type_desc, re.RECIPE_ID,re.RECIPE_N
AME,re.RECIPE_LEVEL,re.RECIPE_INSTRUCTIONS,re.RECIPE_EFFECT,re.RECIPE_TYPE_ID
from        kdr_recipes re,
            kdr_recipe_types rt
where       re.recipe_type_id   = rt.recipe_type_id;

