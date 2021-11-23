CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_RECIPE_BASE_PRICE" (
    i_recipe_id kdr_recipe_components.recipe_id%type)
return number
is
    r_result number;
begin
    select      nvl(sum
            (
                ( nvl(kdr_items_api.get_item_cost(item_id), 0) * comp_amount )
                +
                ( get_lowest_component_price(item_type_id, comp_level) * comp_amount )
            ),0) as base_price
    into        r_result
    from        kdr_recipe_components
    where       recipe_id = i_recipe_id;

    return nvl(r_result,0);
end;