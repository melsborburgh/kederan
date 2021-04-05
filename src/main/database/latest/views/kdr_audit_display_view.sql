create or replace view kdr_audit_display_view as
with x as(
select      'Ras' audit_category,
            '<span class="fa fa-paw" aria-hidden="true"></span>' change_icon,
            r.race_name audit_name,
            c.comments,
            to_char(a.audit_old_value) old_value,
            to_char(a.audit_new_value) new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_races r,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_RACES'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         r.race_id               = a.audit_key
and         a.audit_user            = u.user_name(+)
union all
select      'Spreuk' audit_category,
            '<span class="fa fa-hat-wizard" aria-hidden="true"></span>' change_icon,
            r.spell_name audit_name,
            c.comments,
            case audit_column
                when 'SPELL_DISTANCE' then
                    (select distance_name from kdr_distances sc where sc.distance_id = to_char(a.audit_old_value))
                when 'SPELL_DURATION' then
                    (select duration_name from kdr_durations sc where sc.duration_id = to_char(a.audit_old_value))
                when 'SPELL_TYPE_CODE' then
                    (select spell_type_name from kdr_spell_types sc where sc.spell_type_code = to_char(a.audit_old_value))
                else
                    to_char(a.audit_old_value)
            end old_value,
            case audit_column
                when 'SPELL_DISTANCE' then
                    (select distance_name from kdr_distances sc where sc.distance_id = to_char(a.audit_new_value))
                when 'SPELL_DURATION' then
                    (select duration_name from kdr_durations sc where sc.duration_id = to_char(a.audit_new_value))
                when 'SPELL_TYPE_CODE' then
                    (select spell_type_name from kdr_spell_types sc where sc.spell_type_code = to_char(a.audit_new_value))
                else
                    to_char(a.audit_new_value)
            end new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_spells r,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_SPELLS'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         r.spell_id              = a.audit_key
and         a.audit_user            = u.user_name(+)
union all
select      'Gebed' audit_category,
            '<span class="fa fa-praying-hands" aria-hidden="true"></span>' change_icon,
            r.PRAYER_name audit_name,
            c.comments,
            case audit_column
                when 'PRAYER_DISTANCE' then
                    (select distance_name from kdr_distances sc where sc.distance_id = to_char(a.audit_old_value))
                when 'PRAYER_DURATION' then
                    (select duration_name from kdr_durations sc where sc.duration_id = to_char(a.audit_old_value))
                when 'DEITY_CODE' then
                    (select deity_name from kdr_deities sc where sc.deity_code = to_char(a.audit_old_value))
                else
                    to_char(a.audit_old_value)
            end old_value,
            case audit_column
                when 'PRAYER_DISTANCE' then
                    (select distance_name from kdr_distances sc where sc.distance_id = to_char(a.audit_new_value))
                when 'PRAYER_DURATION' then
                    (select duration_name from kdr_durations sc where sc.duration_id = to_char(a.audit_new_value))
                when 'DEITY_CODE' then
                    (select deity_name from kdr_deities sc where sc.deity_code = to_char(a.audit_new_value))
                else
                    to_char(a.audit_new_value)
            end new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_PRAYERs r,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_PRAYERS'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         r.PRAYER_id             = a.audit_key
and         a.audit_user            = u.user_name(+)
union all
select      'Evenement' audit_category,
            '<span class="fa fa-calendar-alt" aria-hidden="true"></span>' change_icon,
            e.event_name audit_name,
            c.comments,
            to_char(a.audit_old_value) old_value,
            to_char(a.audit_new_value) new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_events e,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_EVENTS'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         e.event_id              = a.audit_key
and         a.audit_user            = u.user_name(+)
union all
select      'Vaardigheid' audit_category,
            '<span class="fa fa-table" aria-hidden="true"></span>' change_icon,
            s.skill_name audit_name,
            c.comments,
            case audit_column
                when 'SKILL_CATEGORY' then
                    (select category_name from kdr_skill_categories sc where sc.category_id = to_char(a.audit_old_value))
                else
                    to_char(a.audit_old_value)
            end old_value,
            case audit_column
                when 'SKILL_CATEGORY' then
                    (select category_name from kdr_skill_categories sc where sc.category_id = to_char(a.audit_new_value))
                else
                    to_char(a.audit_new_value)
            end new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_skills s,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_SKILLS'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         s.skill_id              = a.audit_key
and         a.audit_user            = u.user_name(+)
union all
select      'Skill level' audit_category,
            '<span class="fa fa-graduation-cap" aria-hidden="true"></span>' change_icon,
            'null' audit_name,
            c.comments,
            to_char(a.audit_old_value) old_value,
            to_char(a.audit_new_value) new_value
            ,u.*,a.*
from        kdr_audit a,
            kdr_char_skills s,
            apex_workspace_apex_users u,
            user_col_comments c
where       upper(a.audit_table)    = 'KDR_CHAR_SKILLS'
and         c.table_name            = upper(a.audit_table)
and         c.column_name           = upper(a.audit_column)
and         s.char_skill_id         = a.audit_key
and         a.audit_user            = u.user_name(+)
)
select      change_icon user_avatar,
            'u-color-'|| ( ora_hash(change_icon,45) + 1 ) user_color,
            '<u>' ||
            case
                when user_name is null then 'Onbekende gebruiker <i>"' || audit_user || '"</i>'
                when user_name is not null then first_name || ' ' || last_name
            end || '</u>' user_name,
            audit_date  event_date,
            case audit_type
                when 'UPDATE' then 'Gewijzigd'
                when 'INSERT' then 'Toegevoegd'
                when 'DELETE' then 'Verwijderd'
            end event_type,
            case audit_type
                when 'UPDATE'
                then audit_category || ': ' || audit_name
                when 'INSERT'
                then replace_audit_text( to_char(new_value), audit_table, audit_type )
            end  event_title,
            case audit_type
                when 'UPDATE'
                then  '<strong>' || UPPER(substr(comments,1,1)) || substr(comments,2,length(comments)) || '</strong>' ||
                    case
                        when    audit_column not like '%DESC%'
                        then    ' van: <strong>' || nvl(old_value,'<i>Leeg</i>') || '</strong> ' || ' naar: <strong>' || nvl(new_value,'<i>Leeg</i>') || '</strong>'
                    end || '.'
            end event_desc,
            case audit_type
                when 'UPDATE' then 'fa fa-wrench'
                when 'INSERT' then 'fas fa-plus-circle'
                when 'DELETE' then 'fa fa-exclamation-circle'
            end event_icon,
            case audit_type
                when 'UPDATE' then 'is-updated'
                when 'INSERT' then 'is-new'
                when 'DELETE' then 'is-removed'
            end event_status,
            '#'  event_link,
            audit_table,
            audit_key
from    x
/