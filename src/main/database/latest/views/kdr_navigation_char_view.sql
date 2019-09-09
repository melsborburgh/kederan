set define off
create or replace force view kdr_navigation_char_view as
select
        level as level_value,
        name as label_value,
        target_value,
        is_current,
        image_value,
        image_attr_value,
        image_alt_value,
        attribute1,
        attribute2,
        attribute3
from (
        select      to_char(menu_item_id)   as id,
                    to_char(menu_parent_id) as parent_id,
                    menu_label              as name,
                    menu_target             as target_value,
                    MENU_ICON || ' fa-2x'   as image_value,
                    MENU_IMAGE              as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    null                    as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    to_char(menu_seq)       as seq
        from        kdr_menu
        where       menu_type = 'CHAR'
--        union all
--        select      EVENT_TYPE_NAME         as id,
--                    to_char(-1)             as parent_id,
--                    EVENT_TYPE_DESC         as name,
--                    'f?p=&APP_ALIAS.:EVENTS:&SESSION.::&DEBUG.:RIR:IREQ_EVENT_TYPE:' || EVENT_TYPE_DESC || ':' as target_value,
--                    null                    as image_value,
--                    null                    as image_attr_value,
--                    null                    as image_alt_value,
--                    'YES'                    as is_current,
--                    EVENT_TYPE_DESC         as tooltip,
--                    null                    as attribute1,
--                    null                    as attribute2,
--                    null                    as attribute3,
--                    EVENT_TYPE_DESC         as seq
--        from        kdr_event_types
     )
start with parent_id is null
connect by parent_id = prior id
order siblings by seq