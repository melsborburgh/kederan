create or replace function get_search_skill
(
  i_array in varchar2
) return varchar2 as
    r_skill_list varchar2(1000);
begin
    with x as
    (
        select  column_value
        from    table(apex_string.split(i_array, ':'))
    )
    select  listagg(ss.search_skill_name, ', ' ) within group (order by ss.search_skill_name)
    into    r_skill_list
    from    kdr_search_skills ss, x
    where   x.column_value = ss.search_skill_id;

  return r_skill_list;
end get_search_skill;