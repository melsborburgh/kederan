create or replace force view KDR_RECIPE_COMPONENTS_VIEW
as
select  rc.recipe_id,
        r.recipe_name,
        comp_amount
        || case when rc.comp_amount_upper is not null then '-' || comp_amount_upper end
        || 'x '
        ||
            case
            when rc.item_id is not null
            then i.item_name
            when rc.item_type_id is not null
            then
                case when rc.comp_level is not null then 'niv. ' || rc.comp_level || ' ' end
                || it.item_type_name
                || ' ('
                || it.component_type
                || ')'
            end
        ||
            case
                when comp_comment is not null then ' (' || comp_comment || ')'
            end
            comp_desc,
        rc.comp_id,
        rc.comp_amount,
        rc.item_id,
        i.item_name,
        rc.comp_level,
        rc.item_type_id,
        it.item_type_name,
        it.component_type
from    kdr_recipe_components   rc,
        kdr_items               i,
        kdr_item_types          it,
        kdr_recipes             r
where   rc.item_id = i.item_id(+)
and     rc.item_type_id = it.item_type_id(+)
and     rc.recipe_id = r.recipe_id;