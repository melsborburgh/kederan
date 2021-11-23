CREATE OR REPLACE EDITIONABLE FUNCTION  "GET_SEARCH_SKILL"
(
  I_ARRAY IN VARCHAR2
) RETURN VARCHAR2 AS
    r_skill_list varchar2(1000);
BEGIN
    with x as
    (
        select  column_value
        from    table(apex_string.split(I_ARRAY, ':'))
    )
    select  listagg(ss.SEARCH_SKILL_NAME, ', ' ) within group (order by ss.SEARCH_SKILL_NAME)
    into    r_skill_list
    from    kdr_search_skills ss, x
    where   x.column_value = ss.SEARCH_SKILL_ID;

  RETURN r_skill_list;
END GET_SEARCH_SKILL;