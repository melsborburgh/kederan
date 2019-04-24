set define off
create or replace force view kdr_character_cards_view as
select  '1' level_value,
        char_name label,
        'f?p=&APP_ID.:CHAR_SHEET:&SESSION.::&DEBUG.:RP,16:P16_CHAR_ID:' || char_id target,
        null is_current_list_entry,
        case
            when char_soul_left = 0
            then 'fas fa-2x fa-battery-empty'
            when char_soul_left between 1 and 33
            then 'fas fa-2x fa-battery-quarter'
            when char_soul_left between 34 and 66
            then 'fas fa-2x fa-battery-half'
            when char_soul_left between 67 and 99
            then 'fas fa-2x fa-battery-three-quarters'
               when char_soul_left = 100
            then 'fas fa-2x fa-battery-full'
        end image,
        null image_attribute,
        null image_alt_attribute,
        null attribute1,
        case
            when total_xp_left = 0
            then '<strong><font color=''forestgreen''>Geen xp te besteden</font></strong>'
            when total_xp_left < 0
            then '<strong><font color=''crimson''>' || total_xp_left * -1 || ' xp tekort!</font></strong>'
            when total_xp_left > 0
            then '<strong><font color=''RoyalBlue''>' || total_xp_left || ' xp te besteden</font></strong>'
            else
                '<font color=''red''>Geen xp te besteden</font>'
        end attribute2,
        null attribute3,
        null attribute4,
        null attribute5,
        case
            when total_xp_left = 0
            then 'forestgreen'
            when total_xp_left < 0
            then 'crimson'
            when total_xp_left > 0
            then 'RoyalBlue'
            else
                'red'
        end attribute6,
        race_name ||
        case
            when sub_race_name is not null
            then '/' || sub_race_name
        end ||
        case
            when char_occupation is not null and char_class is not null
            then
                ' ' || char_class || '-' || char_occupation
            when char_occupation is not null
            then
                ' ' || char_occupation
            when char_class is not null
            then
                ' ' || char_class
        end attribute7,
        null attribute8,
        null attribute9,
        null attribute10,
        char_id
from kdr_characters_view
order by char_name