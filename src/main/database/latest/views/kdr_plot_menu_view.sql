  CREATE OR REPLACE FORCE EDITIONABLE VIEW kdr_plot_menu_view AS
  select
        level as level_value,
        name as label_value,
        target_value,
        null as is_current,
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
                    MENU_ICON || ' fa-1x'   as image_value,
                    MENU_IMAGE              as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    null                    as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    to_char(menu_seq)       as seq
        from        kdr_menu
        where       menu_type = 'PLOT'
     )
start with parent_id is null
connect by parent_id = prior id
order siblings by seq;
