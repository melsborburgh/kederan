create or replace force editionable view KDR_SKILL_TREE_VIEW as
    select case
             when connect_by_isleaf = 1 then   0
             when level = 1             then   1
             else                            - 1
             end as status,
           CONNECT_BY_ISLEAF "IsLeaf",
           SYS_CONNECT_BY_PATH(name, '/') "Path",
           level     as "level",
           name      as title,
           icon      as icon,
           id        as value,
           tooltip   as tooltip,
           case
              when instr(id,'_') = 0 then
                'javascript:$s(''P2_SELECTED_SKILL'', ' || apex_escape.js_literal(id) || ');'
              else null
              end as link
    from(
        select 'TYPE_' || to_char(sct.type_id) id,
               null parent_id,
               'fa-tabs' icon,
               sct.type_name   name,
               sct.type_desc   tooltip
        from kdr_skill_category_types sct
        where sct.public_view = 'Y'
        union all
        select 'CATEGORY_' || to_char(sc.category_id) id,
               'TYPE_' || to_char(category_type) parent_id,
               'fa-folder-o' icon,
               sc.category_name   name,
               sc.category_desc   tooltip
        from kdr_skill_categories sc
        union all
        select to_char(sv.skill_id)id,
               'CATEGORY_' || to_char(sv.category_id)parent_id,
               'fa-tag' icon,
               sv.skill_name   name,
               sv.skill_desc   tooltip
        from kdr_skills_view sv
        order by 4
--        ,
--                    kdr_skill_category_types sct
--        where       sv.category_type = sct.type_id
--        and         sct.public_view = 'Y'
    )
    where case when (connect_by_isleaf = 1 and level = 3) or (connect_by_isleaf != 1) then 1 else 9 end != 9
    start with
        parent_id is null
    connect by
        parent_id = prior id
    order siblings by name
    ;