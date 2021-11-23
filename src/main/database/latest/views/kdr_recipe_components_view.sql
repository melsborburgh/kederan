
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_RECIPE_COMPONENTS_VIEW AS
    select rc.recipe_id,
           r.recipe_name,
           comp_amount
           ||
           case
               when rc.comp_amount_upper is not null then
                       '-' || rc.comp_amount_upper
           end
           || 'x '
           ||
           case
                   when rc.item_id is not null then
                       '<a href="' || APEX_PAGE.GET_URL (p_page   => 'ITEM_DETAIL', p_items  => 'P28_ITEM_ID', p_values => rc.item_id ) || '">'
                       ||i.item_name ||
                       '</a>'
                   when rc.item_type_id is not null then
                   '<a href="' ||
                        APEX_PAGE.GET_URL (
                            p_page   => 'ITEMS',
                            p_items  => 'IRC_TYPES_LIST'
                                || case when rc.comp_level is not null then ',IREQ_ITEM_LEVEL' end,
                            p_values =>  it.item_type_name|| ' ('|| it.component_type|| ')'
                                || case when rc.comp_level is not null then ',' || rc.comp_level end
                            ,
                            p_clear_cache => 'RIR' ) || '">'
                   ||
                           case
                               when rc.comp_level is not null then
                                   'niv. '
                                   || rc.comp_level
                                   || ' '
                           end
                           || it.item_type_name
                           || ' ('
                           || it.component_type
                           || ')'
                    || '</a>'
           end
           ||
           case
               when comp_comment is not null then
                       ' ('
                       || comp_comment
                       || ')'
           end
           comp_desc,
           case
               when rc.item_id is not null then
                   i.item_desc
               when rc.item_type_id is not null then
                   it.item_type_desc
           end      comp_desc_long,
           rc.comp_id,
           rc.comp_amount,
           rc.item_id,
           i.item_name,
           rc.comp_level,
           rc.item_type_id,
           it.item_type_name,
           it.component_type
    from kdr_recipe_components  rc,
         kdr_items              i,
         kdr_item_types         it,
         kdr_recipes            r
    where rc.item_id = i.item_id(+)
          and rc.item_type_id = it.item_type_id(+)
          and rc.recipe_id = r.recipe_id;