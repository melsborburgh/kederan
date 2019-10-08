
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_NAVIGATION_MENU_VIEW (LEVEL_VALUE
, LABEL_VALUE, TARGET_VALUE, IS_CURRENT, IMAGE_VALUE, IMAGE_ATTR_VALUE, IMAGE_AL
T_VALUE, ATTRIBUTE1, ATTRIBUTE2, ATTRIBUTE3) AS 
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
        where       menu_type = 'MAIN'
        union all
        select      EVENT_TYPE_NAME         as id,
                    to_char(-1)             as parent_id,
                    EVENT_TYPE_DESC         as name,
                    'f?p=&APP_ALIAS.:EVENTS:&SESSION.::&DEBUG.:RIR:IREQ_EVENT_TY
PE:' || EVENT_TYPE_DESC || ':' as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    EVENT_TYPE_DESC         as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    EVENT_TYPE_DESC         as seq
        from        kdr_event_types
        union all
        select      deity_code              as id,
                    to_char(-2)             as parent_id,
                    deity_name              as name,
                    'f?p=&APP_ALIAS.:PRAYERS_VIEW:&SESSION.::&DEBUG.:RIR:IR_DEIT
Y_CODE:' || deity_code || ':' as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    deity_desc              as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    deity_name              as seq
        from        kdr_deities
        union all
        select      to_char(type_id)        as id,
                    to_char(-8)             as parent_id,
                    type_name               as name,
                    'f?p=&APP_ALIAS.:SKILLGROUPS:&SESSION.::&DEBUG.:RIR:IR_CATEG
ORY_TYPE:' || type_name || ':' as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    type_desc               as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    type_name               as seq
        from        KDR_SKILL_CATEGORY_TYPES
        union all
        select      to_char(spell_type_code)as id,
                    to_char(-6)             as parent_id,
                    spell_type_name         as name,
                    'f?p=&APP_ALIAS.:SPELLS_VIEW:&SESSION.::&DEBUG.:RIR:IR_SPELL
_TYPE_CODE:' || spell_type_code || ':' as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                    as is_current,
                    spell_type_desc         as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    spell_type_name         as seq
        from        kdr_spell_types
        union all
        select      to_char(RECIPE_TYPE_ID) as id,
                    to_char(-9)             as parent_id,
                    RECIPE_TYPE_NAME        as name,
                    'f?p=&APP_ALIAS.:RECIPES:' || V('SESSION') || ':::RIR:IR_REC
IPE_TYPE_ID:' || RECIPE_TYPE_NAME as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                   as is_current,
                    RECIPE_TYPE_DESC         as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    RECIPE_TYPE_NAME         as seq
        from        KDR_RECIPE_TYPES
        union all
        select      to_char(column_value)   as id,
                    to_char(-4)             as parent_id,
                    initcap(column_value) || 'rassen'   as name,
                    'f?p=&APP_ALIAS.:RACES:&SESSION.::&DEBUG.:RIR:IR_RACE_TYPE:'
 || column_value || ':' as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                   as is_current,
                    column_value            as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    column_value            as seq
        from        table(apex_string.split('BASIS:SUB',':'))
        union all
        select      to_char(category_id)    as id,
                    to_char(-5)             as parent_id,
                    initcap(category_name)  as name,
                    'f?p=&APP_ALIAS.:SKILLS:&SESSION.::&DEBUG.:RP,7:P7_SEARCH:' 
|| category_name as target_value,
                    null                    as image_value,
                    null                    as image_attr_value,
                    null                    as image_alt_value,
                    'YES'                   as is_current,
                    nvl(category_desc,category_name) as tooltip,
                    null                    as attribute1,
                    null                    as attribute2,
                    null                    as attribute3,
                    type_name || '_' || category_name           as seq
        from        kdr_skill_categories sc, kdr_skill_category_types sct
        where       sc.category_type = sct.type_id
     )
start with parent_id is null
connect by parent_id = prior id
order siblings by seq;

