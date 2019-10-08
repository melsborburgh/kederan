create or replace force view kdr_recipe_view
as
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
/