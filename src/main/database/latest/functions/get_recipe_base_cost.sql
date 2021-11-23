CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_RECIPE_BASE_COST" (
    i_recipe_id in kdr_recipes.recipe_id%type
)
return number
is
    r_cost number;
begin
    /*
                            individual items * amount of that item needed
        lowest component price of level * amount of that component needed +
        -----------------------------------------------------------------
                                          Recipe cost based on components
    */
    with lowest as (
        select  min(nvl(get_lowest_component_price(item_type_id, comp_level),0) + nvl(kdr_items_api.get_item_cost(item_id),0)) item_cost
        from    kdr_recipe_components
        where   recipe_id = i_recipe_id
    )
    , price as (
        select  nvl(sum
                (
                    ( nvl(kdr_items_api.get_item_cost(item_id), 0) * comp_amount )
                +
                    ( get_lowest_component_price(item_type_id, comp_level) * comp_amount )
                ),0) as base_price
        from    kdr_recipe_components rc
        where   rc.recipe_id = i_recipe_id
    )
    select      (p.base_price - lw.item_cost)
                +
                (2 * lw.item_cost)
                as base_price
    into        r_cost
    from        price p, lowest lw;

    return r_cost;
end;
/
-- laagste kost per ingredient wordt verdubbeld. Andere componenten worden daad bij opgeteld.
