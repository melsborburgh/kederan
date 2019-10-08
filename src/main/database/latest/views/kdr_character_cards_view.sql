
  CREATE OR REPLACE FORCE EDITIONABLE VIEW KDR_CHARACTER_CARDS_VIEW (LEVEL_VALUE
, LABEL, TARGET, IS_CURRENT_LIST_ENTRY, IMAGE, IMAGE_ATTRIBUTE, IMAGE_ALT_ATTRIB
UTE, ATTRIBUTE1, ATTRIBUTE2, ATTRIBUTE3, ATTRIBUTE4, ATTRIBUTE5, ATTRIBUTE6, ATT
RIBUTE7, ATTRIBUTE8, ATTRIBUTE9, ATTRIBUTE10, CHAR_ID, XP_DESC, PLAYER_ID, TOTAL
_XP_LEFT) AS 
  select  '1' level_value,
            char_name label,
            'f?p=&APP_ALIAS.:CHAR_SHEET:&SESSION.::&DEBUG.::P16_CHAR_ID:' || cha
r_id target,
            null is_current_list_entry,
            case
                when char_soul_left = 0             then
                    'fas fa-2x fa-battery-empty'
                when char_soul_left between 1 and 33 then
                    'fas fa-2x fa-battery-quarter'
                when char_soul_left between 34 and 66 then
                    'fas fa-2x fa-battery-half'
                when char_soul_left between 67 and 99 then
                    'fas fa-2x fa-battery-three-quarters'
                when char_soul_left = 100           then
                    'fas fa-2x fa-battery-full'
            end image,
            null image_attribute,
            null image_alt_attribute,
            null attribute1,
            race_name
            ||
                case
                    when sub_race_name is not null then
                        '/' || sub_race_name
                end
            ||
                case
                    when char_occupation is not null
                         and char_class is not null then
                        ' '
                        || char_class
                        || '-'
                        || char_occupation
                    when char_occupation is not null then
                        ' ' || char_occupation
                    when char_class is not null then
                        ' ' || char_class
            end attribute2, -- Description
            null attribute3,
            null attribute4,
            null attribute5,
            case
                when total_xp_left = 0 then
                    'u-success'
                when total_xp_left < 0 then
                    'u-danger'
                when total_xp_left > 0 then
                    'u-warning'
                else
                    'u-primary'
            end attribute6, -- CSS class for template
            case
                when player_name is not null then
                    '<strong>Gespeeld door: ' || player_name || '</strong>'
                else
                    null
            end attribute7, -- Subtext
            null attribute8,
            null attribute9,
            null attribute10,
            char_id,
            case
                when total_xp_left = 0 then
                    'Geen xp te besteden'
                when total_xp_left < 0 then
                    total_xp_left * - 1 || ' xp tekort!'
                when total_xp_left > 0 then
                    total_xp_left || ' xp te besteden'
                else
                    'Geen xp te besteden'
            end xp_desc,
            player_id,
            total_xp_left
    from kdr_characters_view
    order by char_name;

