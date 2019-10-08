
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTER_RECIPES_VIEW (CHAR_RECI
PE_ID, RECIPE_ID, CHAR_ID, RECIPE_TYPE_NAME, RECIPE_NAME, RECIPE_LEVEL, RECIPE_I
NSTRUCTIONS, RECIPE_EFFECT, RECIPE_TYPE_ID, CHAR_NAME) AS 
  select      cr.char_recipe_id char_recipe_id,
            re.recipe_id recipe_id,
            ch.char_id char_id,
            rt.recipe_type_name,
            re.recipe_name recipe_name,
            re.recipe_level recipe_level,
            re.recipe_instructions recipe_instructions,
            re.recipe_effect recipe_effect,
            re.recipe_type_id recipe_type_id,
            ch.char_name char_name
from        kdr_char_recipes cr,
            kdr_recipes re,
            kdr_recipe_types rt,
            kdr_characters ch
where       cr.recipe_id        = re.recipe_id
and         cr.char_id          = ch.char_id
and         re.recipe_type_id   = rt.recipe_type_id;

