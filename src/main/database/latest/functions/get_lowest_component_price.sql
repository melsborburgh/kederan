create or replace function get_lowest_component_price(
    i_component_type_id in kdr_components_view.component_type_id%type,
    i_item_level        in kdr_components_view.item_level%type
)
return number
is
    r_cost number;
begin
    select      nvl(min(item_cost),0)
    into        r_cost
    from        kdr_components_view
    where       component_type_id   = i_component_type_id
    and         item_level          = coalesce(i_item_level,1);

    return r_cost;
end;
/