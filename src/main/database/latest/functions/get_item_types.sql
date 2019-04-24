create or replace function get_item_types
(
  i_array in varchar2
) return varchar2 as
    r_type_list varchar2(1000);
begin
    with x as
    (
        select  column_value
        from    table(apex_string.split(i_array, ':'))
    )
    select  listagg(it.item_type_name ||
                       case
                           when it.component_type is not null then
                               ' ('
                               || it.component_type
                               || ')'
                       end, ', ' ) within group (order by it.item_type_name) types_list
    into    r_type_list
    from    kdr_item_types it, x
    where   x.column_value = it.item_type_id;

  return r_type_list;
end get_item_types;
/